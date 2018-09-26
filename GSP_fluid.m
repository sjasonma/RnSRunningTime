% maxk-pairs screening
% if maxk = 1, then same as GSP_Sim2

[max_mu, max_i] = max(mu);
max_mu2 = max(mu([1:(max_i-1), (max_i+1):end]));
mu(max_i) = max(max_mu, max_mu2 + delta);

maxk = 10;
n = zeros(k, 1);
stage = n;

rbar = 20;
alpha = 0.05;
alpha1 = alpha * 0.1;
alpha2 = alpha - alpha1;
%alpha1 = 0.05;
%alpha2 = 0.05;

A = eta * sqrt(n1 - 1);
h_delta2 = h * h / (delta * delta);


%S_samp = sqrt(chi2rnd(n1-1, k, 1) /(n1-1)) .*sigma';
S_samp = std(X0)';
beta_hat = bsize / mean(S_samp);
bs = ceil(beta_hat * S_samp);
S2_n_rbar = S_samp.^2 ./ (n1 + rbar * bs);
%t_rbar = 1 ./ (S2_n_rbar + S2_n_rbar(i_best));
%a = A * sqrt(t_rbar);

idx = 1:k;

%tic
%Stage 0, sample completion time = T.

%Stage 1, sample mean and variance = Mu and S.
n = n1 * ones(k, 1);
sum_i = sum(X0)';
%Stage 2.
k_left = k;
for r = 0 : rbar
    if r > 0
        n(idx) = n(idx) + bs(idx);
        sum_i(idx) = sum_i(idx) + bs(idx) .* mu(idx)';
    end
    S2_n_r = S_samp.^2 ./ n;
    
    [mu_sort, i_sort] = sort(sum_i(idx)./n(idx), 'descend');
    i_sort = idx(i_sort);
    maxk = min(maxk, k_left);
    i_sort = i_sort(1:maxk);
    t_rbar = 1 ./ (S2_n_rbar(idx) * ones(1, maxk) + ones(k_left, 1) * S2_n_rbar(i_sort)');
    a = A * sqrt(t_rbar);
    
    t_r =  1 ./ (S2_n_r(idx) * ones(1, maxk) + ones(k_left, 1) * S2_n_r(i_sort)');
    mean_diff = (sum_i(idx)./n(idx)) * ones(1, maxk) - ones(k_left, 1) * (sum_i(i_sort) ./ n(i_sort))';
    toElim = max((t_r .* (mean_diff) < -a)')';
    
    stage(idx(toElim)) = 2;
    idx(toElim) = [];
    k_left = length(idx);
    if(k_left <= 1)
        break;
    end
end
if(k_left <= 1)
    return;
end

%Stage 3.
stage(idx) = 3;

Ni = n;
Ni(idx) = max(n(idx), ceil(h_delta2 * S_samp(idx).^2));
n = Ni;
sum_i(idx) = sum_i(idx) + (Ni(idx) - n(idx)) .* mu(idx)';
sim_mean = sum_i(idx) ./ Ni(idx);
[max_x, max_i] = max(sim_mean);
max_i = idx(max_i);