n0;

Mu = randn(1, k) * 2 * delta;
Sigma = ones(1, k) * 1;
X0 = randn(n0, k).* repmat(Sigma, [n0, 1]) + repmat(Mu, [n0, 1]);
[mu_mix, sigma, tt_est_mu, mu_naive, mu_reg] = Est_mu(X0);
mu = mu_mix;

[max_i, max_x, n_BIZ_t] = BIZ_sim(Mu, Sigma, alpha, delta, n0, bsize, X0);
[max_i, max_x, n_BIZ_s] = BIZ_sim(mu, sigma, alpha, delta, n0, bsize, X0);
sum(n_BIZ_t), sum(n_BIZ_s)