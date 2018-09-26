% maxk-pairs screening
% if maxk = 1, then same as GSP_Sim2

maxk = 10;
n = zeros(k, 1);
stage = n;

rbar = 100;
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

if_elim = zeros(k, 1);

%tic
%Stage 0, sample completion time = T.

%Stage 1, sample mean and variance = Mu and S.
n = n1 * ones(k, 1);
%sum_i = n1 * mu' + randn(k, 1) .* sigma' * sqrt(n1);
sum_i = sum(X0)';
%Stage 2.
for r = 0 : rbar
    if r > 0
        n = n + bs;
        sum_i = sum_i + bs .* mu' + randn(k, 1) .* sigma' .* sqrt(bs);
    end
    S2_n_r = S_samp.^2 ./ n;
    
    [mu_sort, i_sort] = sort(sum_i./n .* (1-if_elim), 'descend');
    i_sort = i_sort(1:maxk);
    t_rbar = 1 ./ (S2_n_rbar * ones(1, maxk) + ones(k, 1) * S2_n_rbar(i_sort)');
    a = A * sqrt(t_rbar);
    
    t_r =  1 ./ (S2_n_r * ones(1, maxk) + ones(k, 1) * S2_n_r(i_sort)');
    mean_diff = (sum_i./n) * ones(1, maxk) - ones(k, 1) * (sum_i(i_sort) ./ n(i_sort))';
    if_elim = if_elim | max((t_r .* (mean_diff) < -a)')';
    %sum(~if_elim)
    
    bs(if_elim) = 0;
    stage(if_elim) = 2;
    if(sum(if_elim == 0) <= 1)
        break;
    end
end
if(sum(if_elim == 0) <= 1)
    return;
end

%Stage 3.
stage(~if_elim) = 3;

Ni = n;
Ni(~if_elim) = max(n(~if_elim), ceil(h_delta2 * S_samp(~if_elim).^2));
n = Ni;
sum_i(~if_elim) = sum_i(~if_elim) + (Ni(~if_elim) - n(~if_elim)) .* mu(~if_elim)' + randn(sum(~if_elim), 1) .* sigma(~if_elim)' .* sqrt(Ni(~if_elim) - n(~if_elim));
sim_mean = sum_i ./ Ni;
[max_x, max_i] = max(sim_mean);