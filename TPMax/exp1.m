n0s = [10, 20, 50];
N_iter = 10;
bsize = 10;

for n0i = 1:3
    n0 = n0s(n0i);
    n0
    for iter = 1:N_iter
        iter
        tic
        X0 = genX0(RB, n0);
        tt_init(n0i, iter) = toc;

        [mu_mix, sigma, tt_est_mu, mu_naive, mu_reg] = Est_mu(X0);
        mu = mu_mix;

        [max_i, max_x, n_BIZ_true, tt_BIZ_true(n0i, iter)] = BIZ_TPMax(RB, alpha, delta, n0, bsize, X0);
        [max_i, max_x, n_KN_true, tt_KN_true(n0i, iter)] = KN_TPMax(RB, alpha, delta, n0, bsize, X0);
        [max_i, max_x, n_GSP_true, tt_GSP_true(n0i, iter), k_left_true] = GSP_TPMax(RB, alpha, delta, n0, bsize, X0);

        [max_i, max_x, n_BIZ_sim, tt_BIZ_sim(n0i, iter)] = BIZ_sim(mu, sigma, alpha, delta, n0, bsize, X0);
        [max_i, max_x, n_KN_sim, tt_KN_sim(n0i, iter)] = KN_sim(mu, sigma, alpha, delta, n0, bsize, X0);
        [max_i, max_x, n_GSP_sim, tt_GSP_sim(n0i, iter), k_left_sim] = GSP_sim(mu, sigma, alpha, delta, n0, bsize, X0);
        
        sumn_BIZ_true(n0i, iter) = sum(n_BIZ_true);
        sumn_KN_true(n0i, iter) = sum(n_KN_true);
        sumn_GSP_true(n0i, iter) = sum(n_GSP_true);
        
        sumn_BIZ_sim(n0i, iter) = sum(n_BIZ_sim);
        sumn_KN_sim(n0i, iter) = sum(n_KN_sim);
        sumn_GSP_sim(n0i, iter) = sum(n_GSP_sim);
    end
end