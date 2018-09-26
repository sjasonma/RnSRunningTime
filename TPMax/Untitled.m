tic
X0 = genX0(RB, n0);
tt_init = toc

[mu_mix, sigma, tt_est_mu, mu_naive, mu_reg] = Est_mu(X0);
mu = mu_mix;

[max_i, max_x, n_BIZ_true, tt_BIZ_true] = BIZ_TPMax(RB, alpha, delta, n0, bsize, X0);
[max_i, max_x, n_KN_true, tt_KN_true] = KN_TPMax(RB, alpha, delta, n0, bsize, X0);
[max_i, max_x, n_GSP_true, tt_GSP_true, k_left_true] = GSP_TPMax(RB, alpha, delta, n0, bsize, X0);

[max_i, max_x, n_BIZ_sim, tt_BIZ_sim] = BIZ_sim(mu, sigma, alpha, delta, n0, bsize, X0);
[max_i, max_x, n_KN_sim, tt_KN_sim] = KN_sim(mu, sigma, alpha, delta, n0, bsize, X0);
[max_i, max_x, n_GSP_sim, tt_GSP_sim, k_left_sim] = GSP_sim(mu, sigma, alpha, delta, n0, bsize, X0);

fprintf('Results: \n')
[sum(n_BIZ_true), sum(n_BIZ_sim)]
[sum(n_KN_true), sum(n_KN_sim)]
[sum(n_GSP_true), sum(n_GSP_sim)]

[tt_BIZ_true, tt_BIZ_sim]
[tt_KN_true, tt_KN_sim]
[tt_GSP_true, tt_GSP_sim]

