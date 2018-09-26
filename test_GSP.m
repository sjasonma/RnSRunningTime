%num_config = 8;
%ki_max = 20;
%I_max = 2;
n_GSP_true = zeros(I_max*ki_max, num_config);
n_GSP_naive_sim = zeros(I_max*ki_max, num_config);
n_GSP_naive_fluid = zeros(I_max*ki_max, num_config);
n_GSP_reg_sim = zeros(I_max*ki_max, num_config);
n_GSP_reg_fluid = zeros(I_max*ki_max, num_config);

tic
for ki = 1:ki_max
k = ki * 100
for config_id = 1:num_config
    config_id
    set_config;
    eta = solveEta(n1, alpha/2, k);
    h = solveH(k, alpha/2, n1);
    for I_i = 1:I_max
        I = (ki-1) * I_max + I_i;
        
        
        mu = Mu;
        sigma = Sigma;
        GSP;
        n_GSP_true(I, config_id) = sum(n);
        sum(n);

        naive_prep;
        GSP;
        n_GSP_naive_sim(I, config_id) = sum(n);
        sum(n);
        
        GSP_fluid;
        n_GSP_naive_fluid(I, config_id) = sum(n);
        sum(n);
        
        Est_mu;
        GSP;
        n_GSP_reg_sim(I, config_id) = sum(n);
        sum(n);
        
        GSP_fluid;
        n_GSP_reg_fluid(I, config_id) = sum(n);
        sum(n);
        
        
    end
end
toc
end