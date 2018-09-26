%num_config = 8;
%ki_max = 20;
%I_max = 1;
n_KN_true = zeros(I_max*ki_max, num_config);
n_KN_naive_sim = zeros(I_max*ki_max, num_config);
n_KN_naive_fluid = zeros(I_max*ki_max, num_config);
n_KN_reg_sim = zeros(I_max*ki_max, num_config);
n_KN_reg_fluid = zeros(I_max*ki_max, num_config);

tic
for ki = 1:ki_max
k = ki * 100;
for config_id = 1:num_config
    config_id
    set_config;
    for I_i = 1:I_max
        I = (ki-1) * I_max + I_i;
        mu = Mu;
        sigma = Sigma;
        KN_largeMemory;
        S2_true = S2;
        n_KN_true(I, config_id) = sum(n);
        sum(n);

        naive_prep;
        KN_largeMemory;
        n_KN_naive_sim(I, config_id) = sum(n);
        sum(n);

        S2 = S2_true;
        KN_fluid;
        n_KN_naive_fluid(I, config_id) = sum(R+bsize/2);
        sum(R+bsize/2);

        Est_mu;
        KN_largeMemory;
        n_KN_reg_sim(I, config_id) = sum(n);
        sum(n);

        S2 = S2_true;
        KN_fluid;
        n_KN_reg_fluid(I, config_id) = sum(R+bsize/2);
        sum(R+bsize/2);

        
    end
end
toc
end