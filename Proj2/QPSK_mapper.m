% QPSK_mapper.m

function [symbol] = QPSK_mapper(bitseq)
j =sqrt(-1);
bitseq_length=length(bitseq);
symbol_length=bitseq_length/2;
symbol=zeros(1,symbol_length);

QPSK_table = [1 j -j -1 ]; 

for i=0: symbol_length-1
    temp = bitseq(2*i+1)*2 +bitseq(2*i+2);
    symbol(i+1)=QPSK_table(temp+1);
end



