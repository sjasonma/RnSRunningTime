I_max = 20;
tn_KN_true = zeros(1, I_max);
tn_KN_mix_sim = zeros(1, I_max);
tn_BIZ_true = zeros(1, I_max);
tn_BIZ_mix_sim = zeros(1, I_max);
tn_GSP_true = zeros(1, I_max);
tn_GSP_mix_sim = zeros(1, I_max);

tic
for I_i = 1:I_max
    I_i
    Est_mu;
    sigma = Sigma;
    
    mu = Mu;
    KN_largeMemory;
    tn_KN_true(I_i) = sum(n);
    mu = mu_mix;
    KN_largeMemory;
    tn_KN_mix_sim(I_i) = sum(n);
    
    mu = Mu;
    BIZ;
    tn_BIZ_true(I_i) = sum(n);
    mu = mu_mix;
    BIZ;
    tn_BIZ_mix_sim(I_i) = sum(n);
    
    eta = solveEta(n1, alpha/2, k);
    h = solveH(k, alpha/2, n1);
    mu = Mu;
    GSP;
    tn_GSP_true(I_i) = sum(n);
    mu = mu_mix;
    GSP;
    tn_GSP_mix_sim(I_i) = sum(n);
    toc
end
    