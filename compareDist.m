function [dist, Xbar_new] = compareDist(mu, sigma, Xbar, n0)

Xbar = sort(Xbar);
k = length(mu);

dist = 0;
n_compare = 100;
% xbar0 = genSample(n_compare, zeros(1, k), sigma/sqrt(n0));
xbar0 = randn(n_compare, k) .* repmat(sigma/sqrt(n0), [n_compare, 1]);
Xbar_new = repmat(mu, [n_compare, 1]) + xbar0;
Xbar_new = mean(sort(Xbar_new, 2), 1);
%Xbar = Xbar - max(Xbar);
%Xbar_new = Xbar_new - max(Xbar_new);
%res = norm(Xbar((k/2):(k)) - Xbar_new((k/2):(k)));
dist = norm(Xbar - Xbar_new);
