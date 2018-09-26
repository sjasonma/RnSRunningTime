%num_config = 2;
%ki_max = 20;
%I_max = 2;
n_BIZ_true = zeros(I_max*ki_max, num_config);
n_BIZ_naive_sim = zeros(I_max*ki_max, num_config);
n_BIZ_naive_fluid = zeros(I_max*ki_max, num_config);
n_BIZ_reg_sim = zeros(I_max*ki_max, num_config);
n_BIZ_reg_fluid = zeros(I_max*ki_max, num_config);

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
        BIZ;
        n_BIZ_true(I, config_id) = sum(n);
        sum(n);

        naive_prep;
        BIZ;
        n_BIZ_naive_sim(I, config_id) = sum(n);
        sum(n);
        
        BIZ_fluid;
        n_BIZ_naive_fluid(I, config_id) = sum(n);
        sum(n);
        
        Est_mu;
        BIZ;
        n_BIZ_reg_sim(I, config_id) = sum(n);
        sum(n);
        
        BIZ_fluid;
        n_BIZ_reg_fluid(I, config_id) = sum(n);
        sum(n);
        
        
    end
end
toc
end