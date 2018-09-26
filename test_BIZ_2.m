config_id_set = 1:9;
I_max = 10;
n_BIZ_true = zeros(I_max, length(config_id_set));
n_BIZ_naive_sim = zeros(I_max, length(config_id_set));
n_BIZ_reg_sim = zeros(I_max, length(config_id_set));
n_BIZ_mix_sim = zeros(I_max, length(config_id_set));


for config_id = config_id_set
    for I_i = 1:I_max
        set_config;
        I_i
        mu = Mu;
        sigma = Sigma;
        BIZ;
        n_BIZ_true(I_i, config_id) = sum(n);
        
        Est_mu;
        
        mu = mu_naive;
        BIZ;
        n_BIZ_naive_sim(I_i, config_id) = sum(n);
        
        mu = mu_reg;
        BIZ;
        n_BIZ_reg_sim(I_i, config_id) = sum(n);
        
        mu = mu_mix;
        BIZ;
        n_BIZ_mix_sim(I_i, config_id) = sum(n);
    end
end


