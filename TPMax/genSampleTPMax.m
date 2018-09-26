function samples = genSampleTPMax(RB, idx, n)
samples = zeros(n, 1);
x_sys = TP_idx2sys(RB, idx);
for i = 1:n
    samples(i) = Throughput(x_sys, 1, randi([1, 1e9], 1, 1));
end