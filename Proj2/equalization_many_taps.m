% filename:QPSK_equalization_HW.m
clear all;  
j = sqrt(-1);
Eb_No_start = -1;
Eb_No_step = 1;
Eb_No_end = 30;
tap_numbers = [3, 5, 7]; % tap_number 배열

% 모든 tap_number에 대한 BER 저장을 위한 배열 초기화
BERs = zeros(length(tap_numbers), ceil((Eb_No_end-Eb_No_start+1)/Eb_No_step));

% 채널 정의
channel = [1+0.8j 0.4j -0.1+0.1j 0.6 0.2-0.1j 0.1 0.05+0.01j];

for tap_idx = 1:length(tap_numbers)
    tap_number = tap_numbers(tap_idx); % 현재 tap_number 선택
    [equalizer, Delay] = ZFE_design(channel, tap_number);
    
    frame_size = 200;

    for EbN0dB = Eb_No_start:Eb_No_step:Eb_No_end
        error = 0;

        % 프레임별 처리
        for frame_index = 1: 100000000
            bit_stream = zeros(1, frame_size);
            temp = randn(1, frame_size);
            one_indices = find(temp > 0);
            bit_stream(one_indices) = 1;
            
            symbol_stream = QPSK_mapper(bit_stream);
            rx_symbol_stream = conv(symbol_stream, channel);

            P_s = sum(abs(channel).^2);        
            P_b = P_s / 2;
            P_n = P_b * 10^(-EbN0dB / 10);
            
            noise = (P_n / sqrt(2)) * (randn(1, length(rx_symbol_stream)) + j * randn(1, length(rx_symbol_stream)));
            rx_symbol_stream = rx_symbol_stream + noise;

            equalized_symbol_stream_temp = conv(rx_symbol_stream, equalizer);
            equalized_symbol_stream = equalized_symbol_stream_temp(1 + Delay : Delay + frame_size / 2);
            
            sliced_symbol_stream = QPSK_slicer(equalized_symbol_stream);
            bit_stream_hat = QPSK_demapper(sliced_symbol_stream);

            error_index = find(bit_stream_hat ~= bit_stream);
            error = error + length(error_index);
            if error > 100, break; end
        end
        
        BERs(tap_idx, EbN0dB + 2) = error / (frame_index * frame_size);
        if BERs(tap_idx, EbN0dB + 2) < 10^-5 || EbN0dB > 30
            break;
        end
    end
end

% 결과 
figure;
for tap_idx = 1:length(tap_numbers)
    semilogy([Eb_No_start:Eb_No_step:Eb_No_end], BERs(tap_idx, :), 'o-');
    hold on;
end
xlabel('E_b/N_o(dB)');
ylabel('P_b');
title('BER vs E_b/N_o for Different Tap Numbers');
legend('Tap = 3', 'Tap = 5', 'Tap = 7');
grid;
