config_id_set = 1:10;
k_set = [100, 500, 2000];
%k_set = [100, 500, 2000, 10000];
I_max = 100;

% n_KN_true = zeros(I_max, length(config_id_set) * length(k_set));
% n_KN_naive_fluid = zeros(I_max, length(config_id_set) * length(k_set));
% n_KN_reg_fluid = zeros(I_max, length(config_id_set) * length(k_set));
% n_KN_mix_fluid = zeros(I_max, length(config_id_set) * length(k_set));
% n_KN_naive_sim = zeros(I_max, length(config_id_set) * length(k_set));
% n_KN_reg_sim = zeros(I_max, length(config_id_set) * length(k_set));
% n_KN_mix_sim = zeros(I_max, length(config_id_set) * length(k_set));
% 
% n_BIZ_true = zeros(I_max, length(config_id_set) * length(k_set));
% n_BIZ_naive_fluid = zeros(I_max, length(config_id_set) * length(k_set));
% n_BIZ_reg_fluid = zeros(I_max, length(config_id_set) * length(k_set));
% n_BIZ_mix_fluid = zeros(I_max, length(config_id_set) * length(k_set));
% n_BIZ_naive_sim = zeros(I_max, length(config_id_set) * length(k_set));
% n_BIZ_reg_sim = zeros(I_max, length(config_id_set) * length(k_set));
% n_BIZ_mix_sim = zeros(I_max, length(config_id_set) * length(k_set));
% 
% n_GSP_true = zeros(I_max, length(config_id_set) * length(k_set));
% n_GSP_naive_fluid = zeros(I_max, length(config_id_set) * length(k_set));
% n_GSP_reg_fluid = zeros(I_max, length(config_id_set) * length(k_set));
% n_GSP_mix_fluid = zeros(I_max, length(config_id_set) * length(k_set));
% n_GSP_naive_sim = zeros(I_max, length(config_id_set) * length(k_set));
% n_GSP_reg_sim = zeros(I_max, length(config_id_set) * length(k_set));
% n_GSP_mix_sim = zeros(I_max, length(config_id_set) * length(k_set));

tic
for k_i = 1:length(k_set)
    eta_GSP = solveEta(n1, alpha/2, k);
    h_GSP = solveH(k, alpha/2, n1);
    for config_id = config_id_set
        for I_i = 1:I_max
            I_i
            k = k_set(k_i);
            set_config;
            
            %%
            
             Est_mu;
             sigma = Sigma;
             toc
            
            %%
            mu = Mu;
            KN_largeMemory;
            sumn_1 = sum(n);
            KN_largeMemory;
            sumn_2 = sum(n);
            n_KN_true(I_i, (k_i-1)*length(config_id_set) + config_id) = (sumn_1 + sumn_2)/2;
            
            mu = mu_naive;
            KN_fluid;
            n_KN_naive_fluid(I_i, (k_i-1)*length(config_id_set) + config_id) = sum(R+bsize/2);
            
            mu = mu_reg;
            KN_fluid;
            n_KN_reg_fluid(I_i, (k_i-1)*length(config_id_set) + config_id) = sum(R+bsize/2);
            
            mu = mu_mix;
            KN_fluid;
            n_KN_mix_fluid(I_i, (k_i-1)*length(config_id_set) + config_id) = sum(R+bsize/2);
            
            mu = mu_naive;
            KN_largeMemory;
            n_KN_naive_sim(I_i, (k_i-1)*length(config_id_set) + config_id) = sum(n);
            
            mu = mu_reg;
            KN_largeMemory;
            n_KN_reg_sim(I_i, (k_i-1)*length(config_id_set) + config_id) = sum(n);
            
            mu = mu_mix;
            KN_largeMemory;
            sumn_1 = sum(n);
            KN_largeMemory;
            sumn_2 = sum(n);
            n_KN_mix_sim(I_i, (k_i-1)*length(config_id_set) + config_id) = (sumn_1 + sumn_2)/2;
            
            toc
            %%
            mu = Mu;
            BIZ;
            sumn_1 = sum(n);
            BIZ;
            sumn_2 = sum(n);
            n_BIZ_true(I_i, (k_i-1)*length(config_id_set) + config_id) = (sumn_1 + sumn_2)/2;
            
            mu = mu_naive;
            BIZ_fluid;
            n_BIZ_naive_fluid(I_i, (k_i-1)*length(config_id_set) + config_id) = sum(n);
            
            mu = mu_reg;
            BIZ_fluid;
            n_BIZ_reg_fluid(I_i, (k_i-1)*length(config_id_set) + config_id) = sum(n);
            
            mu = mu_mix;
            BIZ_fluid;
            n_BIZ_mix_fluid(I_i, (k_i-1)*length(config_id_set) + config_id) = sum(n);
            
            mu = mu_naive;
            BIZ;
            n_BIZ_naive_sim(I_i, (k_i-1)*length(config_id_set) + config_id) = sum(n);
            
            mu = mu_reg;
            BIZ;
            n_BIZ_reg_sim(I_i, (k_i-1)*length(config_id_set) + config_id) = sum(n);
            
            mu = mu_mix;
            BIZ;
            sumn_1 = sum(n);
            BIZ;
            sumn_2 = sum(n);
            n_BIZ_mix_sim(I_i, (k_i-1)*length(config_id_set) + config_id) = (sumn_1 + sumn_2)/2;
            
            toc
            %%
            eta = eta_GSP;
            h = h_GSP;
            
            mu = Mu;
            GSP;
            sumn_1 = sum(n);
            GSP;
            sumn_2 = sum(n);
            n_GSP_true(I_i, (k_i-1)*length(config_id_set) + config_id) = (sumn_1 + sumn_2)/2;
            
            mu = mu_naive;
            GSP_fluid;
            n_GSP_naive_fluid(I_i, (k_i-1)*length(config_id_set) + config_id) = sum(n);
            
            mu = mu_reg;
            GSP_fluid;
            n_GSP_reg_fluid(I_i, (k_i-1)*length(config_id_set) + config_id) = sum(n);
            
            mu = mu_mix;
            GSP_fluid;
            n_GSP_mix_fluid(I_i, (k_i-1)*length(config_id_set) + config_id) = sum(n);
            
            mu = mu_naive;
            GSP;
            n_GSP_naive_sim(I_i, (k_i-1)*length(config_id_set) + config_id) = sum(n);
            
            mu = mu_reg;
            GSP;
            n_GSP_reg_sim(I_i, (k_i-1)*length(config_id_set) + config_id) = sum(n);
            
            mu = mu_mix;
            GSP;
            sumn_1 = sum(n);
            GSP;
            sumn_2 = sum(n);
            n_GSP_mix_sim(I_i, (k_i-1)*length(config_id_set) + config_id) = (sumn_1 + sumn_2)/2;
            
            toc
        end
    end
end
test_all_runtime = toc;

