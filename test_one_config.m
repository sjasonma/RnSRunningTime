tic
for I_i = 1:100
%             I_i
%             k = k_set(k_i);
%             set_config;
            Est_mu;
            %            
%             i_est_max = 1;
%             mu_naive_s = zeros(i_est_max, k);
%             mu_reg_s = zeros(i_est_max, k);
%             mu_mix_s = zeros(i_est_max, k);
%              for i_est = 1:i_est_max
%                  
%                  Est_mu
%                  mu_naive_s(i_est, 1:k) = sort(mu_naive);
%                  mu_reg_s(i_est, 1:k) = sort(mu_reg);
%                  mu_mix_s(i_est, 1:k) = sort(mu_mix);
%              end
%              mu_naive = mean(mu_naive_s, 1);
%              mu_reg = mean(mu_reg_s, 1);
%              mu_mix = mean(mu_mix_s, 1);
%              mu_naive(sort_i) = mu_naive;
%              mu_reg(sort_i) = mu_reg;
%              mu_mix(sort_i) = mu_mix;
             
             
             sigma = Sigma;
            %
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
            
            %mu = mu_reg;
            %BIZ_fluid;
            %n_BIZ_reg_fluid(I_i, (k_i-1)*length(config_id_set) + config_id) = sum(n);
            
            %mu = mu_mix;
            %BIZ_fluid;
            %n_BIZ_mix_fluid(I_i, (k_i-1)*length(config_id_set) + config_id) = sum(n);
            
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
            eta = solveEta(n1, alpha/2, k);
            h = solveH(k, alpha/2, n1);
            
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

%%
ci = (k_i-1)*length(config_id_set) + config_id;
hold on
plot(n_GSP_true(:, ci), n_GSP_naive_sim(:, ci), 'o')
plot(n_GSP_true(:, ci), n_GSP_mix_sim(:, ci), '*')
plot([0, max(max(n_GSP_true(:, ci)))], [0, max(max(n_GSP_true(:, ci)))])

fprintf('%.4f, %.4f: mean ratio\n', mean(n_GSP_naive_sim(:, ci)' ./ n_GSP_true(:, ci)'), mean(n_GSP_mix_sim(:, ci)' ./ n_GSP_true(:, ci)'))
fprintf('%.4f: std\n', std(n_GSP_mix_sim(:, ci)' ./ n_GSP_true(:, ci)'))
fprintf('%.4f, %.4f: |pred / true| - 1\n', mean(abs(n_GSP_naive_sim(:, ci)' ./ n_GSP_true(:, ci)' - 1) ), mean(abs(n_GSP_mix_sim(:, ci)' ./ n_GSP_true(:, ci)' - 1) ))
fprintf('%.4f, %.4f: |true / pred| - 1\n', mean(abs(n_GSP_true(:, ci)' ./ n_GSP_naive_sim(:, ci)' - 1) ), mean(abs(n_GSP_true(:, ci)' ./ n_GSP_mix_sim(:, ci)' - 1) ))

%%
% ci = (k_i-1)*length(config_id_set) + config_id;
% hold on
% plot(n_KN_true(:, ci), n_KN_naive_fluid(:, ci), 'o')
% plot(n_KN_true(:, ci), n_KN_mix_fluid(:, ci), '*')
% plot([0, max(max(n_KN_true(:, ci)))], [0, max(max(n_KN_true(:, ci)))])
% fprintf('%.4f, %.4f: mean ratio\n', mean(n_KN_naive_fluid(:, ci)' ./ n_KN_true(:, ci)'), mean(n_KN_mix_fluid(:, ci)' ./ n_KN_true(:, ci)'))
