function [max_i, max_x, n, tot_time] = KN_sim(mu, sigma, alpha, delta, n0, bsize, X0)
genSample = @(n, mu, sigma) randn(n, length(mu)) .* repmat(sigma, [n, 1]) + repmat(mu, [n, 1]);
tic
k = length(mu);
eta = 1 / 2 * ((2 * alpha / (k - 1))^(-2 / (n0 - 1)) - 1);
h2 = 2 * eta * (n0 - 1);

idx = 1:k; % index set of survivors

Xsum = sum(X0);
for i = 1 : k
    S2 =  var(repmat(X0(:,i), [1, k]) - X0);
    Ni(i) = max(floor(h2 * S2 / delta^2));
end
max_N = max(Ni);

t = n0; % r in paper
n = ones(1, k) * t;
if n0 > max_N
    [max_x, max_i] = max(Xsum);
end

while length(idx) > 1
    idx_elim = false(size(idx));
    for sys_l = idx
        S2 =  var(repmat(X0(:,sys_l), [1, length(idx)]) - X0(:, idx));
        rW = max(0, h2 * S2 / (2 * delta) - delta * t / 2);
        idx_elim = idx_elim | ( Xsum(idx) + 1e-8 < Xsum(sys_l) - rW );
    end
    idx(idx_elim) = [];
    
    Xsum(idx) = Xsum(idx) + genSample(1, mu(idx)*bsize, sigma(idx)*sqrt(bsize));
    n(idx) = n(idx) + bsize;
    t = t + bsize;
end
max_i = idx(1);
max_x = Xsum(max_i) / n(max_i);
tot_time = toc;