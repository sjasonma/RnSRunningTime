function p = calcProbDiffMax(c, k, sigma2)
%% p = P(max_{i \neq j) X_i - X_j >= c)
%    = (k-1) * int_\-inf^inf F(x)^(k-2) f(x) F(x - c) dx
%   Same expectation mu_1 = mu_2 = ... = mu_k
%   Same variance sigma2
%   Translation invariant
dummy_mu = 0;
integrand = @(x) normcdf((x-dummy_mu) / sqrt(sigma2)) .^ (k-2) .* normpdf((x-dummy_mu) / sqrt(sigma2)) .* normcdf((x-c-dummy_mu) / sqrt(sigma2));
p = (k-1) * integral(integrand, -inf, inf);