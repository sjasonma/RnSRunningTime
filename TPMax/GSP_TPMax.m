function [max_i, max_x, n, tot_time, k_left] = GSP_TPMax(RB, alpha, delta, n0, bsize, X0)
tic
k = getNumSystems(RB);

maxk = 10;
n = zeros(k, 1);
stage = n;

rbar = 20;
alpha = 0.05;
alpha1 = alpha / 2;
alpha2 = alpha / 2;

eta = solveEta(n0, alpha1, k); 
h = solveH(k, alpha2, n0);
A = eta * sqrt(n0 - 1);
h_delta2 = h * h / (delta * delta);


S_samp = std(X0)';
beta_hat = bsize / mean(S_samp);
bs = ceil(beta_hat * S_samp);
S2_n_rbar = S_samp.^2 ./ (n0 + rbar * bs);

idx = 1:k;

%tic
%Stage 0, sample completion time = T.

%Stage 1, sample mean and variance = Mu and S.
n = n0 * ones(k, 1);
sum_i = sum(X0)';

%Stage 2.
k_left = k;
for r = 0 : rbar
%      [r, k_left, sum(n)]

    S2_n_r = S_samp.^2 ./ n;
    
    [mu_sort, i_sort] = sort(sum_i(idx)./n(idx), 'descend');
    i_sort = idx(i_sort);
    maxk = min(maxk, k_left);
    i_sort = i_sort(1:maxk);
    t_rbar = 1 ./ (repmat(S2_n_rbar(idx), [1, maxk]) + repmat(S2_n_rbar(i_sort)', [k_left, 1]));
    a = A * sqrt(t_rbar);
    
    t_r =  1 ./ (S2_n_r(idx) * ones(1, maxk) + ones(k_left, 1) * S2_n_r(i_sort)');
    mean_diff = repmat(sum_i(idx)./n(idx), [1, maxk]) - repmat((sum_i(i_sort) ./ n(i_sort))', [k_left, 1]);
    toElim = max((t_r .* (mean_diff) < -a)')';
    
    stage(idx(toElim)) = 2;
    idx(toElim) = [];
    k_left = length(idx);
    if(k_left <= 1)
        break;
    end
    
    sum_add = zeros(length(idx), 1);
    for id = 1:length(idx)
%             samples = genSampleTPMax(RB, idx(id), bs(idx(id)));
%             sum_add(id) = sum(samples);
        sum_add(id) = genSampleTPMax2(RB, idx(id), bs(idx(id)));
    end

    sum_i(idx) = sum_i(idx) + sum_add;
    n(idx) = n(idx) + bs(idx);
    
end

if(k_left <= 1)
    sim_mean = sum_i(idx) ./ n(idx);
    [max_x, max_i] = max(sim_mean);
    max_i = idx(max_i);
    tot_time = toc;
    return;
end

%Stage 3.
stage(idx) = 3;

n_add = max(n(idx), ceil(h_delta2 * S_samp(idx).^2)) - n(idx);

sum_add = zeros(length(idx), 1);
for id = 1:length(idx)
%     samples = genSampleTPMax(RB, idx(id), Ni(idx(id)) - n(idx(id)));
%     sum_add(id) = sum(samples);
 %    sum_add(id) = genSampleTPMax2(RB, idx(id),  n_add(id));
end
n(idx) = n(idx) + n_add;

%sum_i(idx) = sum_i(idx) + sum_add;
sim_mean = sum_i(idx) ./ n(idx);
[max_x, max_i] = max(sim_mean);
max_i = idx(max_i);
tot_time = toc;