[max_mu, max_i] = max(mu);
max_mu2 = max(mu([1:(max_i-1), (max_i+1):end]));
mu(max_i) = max(max_mu, max_mu2 + delta);

R = zeros(1, k);
for i = 1:k
    mu_diff_i = mu - mu(i);
    S2_i = var(X0(:,i) * ones(1, k) - X0);
    R_i = h2 * S2_i / 2 / delta ./ (mu_diff_i + delta / 2 );
    R_i(R_i <= 0) = inf;
    R(i) = min(R_i);
    R(i) = min(R(i), Ni(i));
end
R(isinf(R)) = max(R(~isinf(R)));
sum(R+bsize/2);
%% memroy k^2, dumped
% mu_diff = mu' * ones(1, k) - ones(k, 1) * mu;
% R = h2 * S2 / 2 / delta ./ (-mu_diff + delta / 2 );
% R(R <= 0) = inf;
% R = min(R');