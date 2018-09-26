Pstar = 1 - alpha;
c = 1 - Pstar^(1/(k-1));
X = genSample(N, mu, sigma);
sigma2 = sigma(1)^2;
t = 1;
Xbar = mean(X(1:t, :), 1);
n = zeros(1, k);
idx = 1:k;

[maxX, max_i] = max(Xbar(idx) / t);
Xbar_other = Xbar(idx([1:(max_i-1), (max_i+1):end]));
pSelect = calcProbSelect(maxX, Xbar_other, sigma2, t, delta);
while pSelect < Pstar
    [minX, min_i] = min(Xbar(idx) / t);
    Xbar_other = Xbar(idx([1:(min_i-1), (min_i+1):end]));
%     pElim = calcProbElim(minX, Xbar_other, sigma2, t);
%     while pElim <= c
%         n(idx(min_i)) = t;
%         idx(min_i) = [];
%         Pstar = Pstar / (1 - pElim);
%         [minX, min_i] = min(Xbar(idx) / t);
%         Xbar_other = Xbar(idx([1:(min_i-1), (min_i+1):end]));
%         pElim = calcProbElim(minX, Xbar_other, sigma2, t);
%     end
    %idx
    t = t + 1;
    Xbar(idx) = (Xbar(idx) * t + X(t, idx)) / (t + 1);
    [maxX, max_i] = max(Xbar(idx));
    Xbar_other = Xbar(idx([1:(max_i-1), (max_i+1):end]));
    pSelect = calcProbSelect(maxX, Xbar_other, sigma2, t, delta);
end
max_i = idx(max_i)
n(idx) = t;
sum(n)