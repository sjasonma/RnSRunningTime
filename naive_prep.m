X = randn(N, k) .* (ones(N, 1) * Sigma) + ones(N, 1) * Mu;
Xbar = cumsum(X) ./ ((1:N)' * ones(1, k));

mu = mean(X);
sigma = std(X);