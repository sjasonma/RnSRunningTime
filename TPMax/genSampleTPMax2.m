function [sumX, sumX2] = genSampleTPMax2(RB, idx, n)
if n == 0
    sumX = 0;
    sumX2 = 0;
    return
end
samples = zeros(n, 1);
x_sys = TP_idx2sys(RB, idx);
[fn, fnVar] = Throughput(x_sys, n, randi([1, 1e9], 1, 1));
sumX = fn * n;
sumX2 = (n-1) * fnVar + sumX^2 / n;