%%
set_config;
Est_mu;

% 
%              for i_est = 1:10
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
            
            mu = Mu;
            GSP;
            sum(n)
 mu = mu_naive;
            GSP;
            sum(n)
            
            mu = mu_reg;
            GSP;
            sum(n)
            
            mu = mu_mix;
            GSP;
            sum(n)
hold on
plot(sort(Mu), 'r')
plot(sort(mu_naive), 'b')
plot(sort(mu_mix), 'g')
plot(sort(mu_reg), 'k')

xbar0 = genSample(1000, zeros(1, k), sigma/sqrt(n0));
hold on
xbar_Mu = repmat(Mu, [1000, 1]) + xbar0;
xbar_muReg = repmat(mu_reg, [1000, 1]) + xbar0;
xbar_muMix = repmat(mu_mix, [1000, 1]) + xbar0;
% for i_plot = 1:1000
% %     plot(sort(xbar_Mu(i_plot,:)), 'c.')
%     plot(sort(xbar_muMix(i_plot,:)), 'm.')
% %     plot(sort(xbar_muReg(i_plot,:)), 'y')
% end
xbar_Mu = mean(sort(xbar_Mu, 2), 1);
xbar_muReg = mean(sort(xbar_muReg, 2), 1);
xbar_muMix = mean(sort(xbar_muMix, 2), 1);
plot(xbar_Mu, 'ro');
plot(xbar_muMix, 'go');
plot(xbar_muReg, 'ko');

plot(sort(Mu), 'r')
plot(sort(mu_naive), 'b')
plot(sort(mu_mix), 'g')
plot(sort(mu_reg), 'k')