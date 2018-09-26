genSample = @(n, mu, sigma) randn(n, length(mu)) .* repmat(sigma, [n, 1]) + repmat(mu, [n, 1]);
genVar = @(n, sigma) chi2rnd(n-1, 1, length(sigma)) .* sigma.^2 / (n-1);