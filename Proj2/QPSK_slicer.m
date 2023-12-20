%filename : QPSK_slicer.m

function [sliced_symbol_stream] = QPSK_slicer(received_symbol_stream)
    QPSK_table = [1, j, -j, -1];
    len = length(received_symbol_stream);
    
    sliced_symbol_stream = zeros(1, len);
    
    for i = 1:len
        current_symbol = received_symbol_stream(i);
        distances = abs(QPSK_table - current_symbol);
        [~, closest_index] = min(distances);
        sliced_symbol_stream(i) = QPSK_table(closest_index);
    end
end
