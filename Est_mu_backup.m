% mu(1*k), sigma(1*k)
n0 = 50;
X0 = genSample(n0, Mu, Sigma);
m = 100; % bootstrap size

% naive estimation
sigma = std(X0);
mu_naive = mean(X0);
[sort_x, sort_i] = sort(mu_naive, 'descend');
X = zeros(size(X0));
sort_x = zeros(n0, k);
for i_bootstrap = 1:m
    for i = 1:k
        X(:, i) = X0(randperm(n0), i);
        %X(:, i) = datasample(X0(:, i), N, 'Replace', true);
    end
    Xbar = cumsum(X) ./ repmat((1:n0)', [1, k]);
    sort_x = sort_x + sort(Xbar, 2, 'descend');
end
sort_x = sort_x / m;

l_end = 1;
%regression
est_mu = zeros(1, k);
x = [ones(1, n0);1 ./ sqrt(1:n0)]';
for i = 1:k
    y = sort_x(:, i);
    b = lscov(x(l_end:n0, :), y(l_end:n0));
    b(1);
    est_mu(i) = b(1);
end

%mu = sort(est_mu, 'descend');

for i = (k-1):-1:1
    est_mu(i) = max(est_mu(i), est_mu(i+1));
end

for i = 2:k
    est_mu(i) = min(est_mu(i), est_mu(i-1));
end

mu_reg = zeros(size(est_mu));
mu_reg(sort_i) = est_mu;

%% linear combination of naive and regression
% c_naive = compareDist(mu_naive, sigma, mu_naive, N)
% c_reg = compareDist(mu_reg, sigma, mu_naive, N)
% if c_naive < 0
%     mu_mix = mu_naive;
% elseif  c_reg > 0
%     mu_mix = mu_reg;
% else
%     mu_mix = c_naive/(c_naive - c_reg) * mu_reg - c_reg/(c_naive - c_reg) * mu_naive;
% end
% compareDist(mu_mix, sigma, mu_naive, N)
minDist = inf;
for c1 = 0:0.02:1
    mu_mix = c1 * mu_naive + (1 - c1) * mu_reg;
    distMix = abs(compareDist(mu_mix, sigma, mu_naive, n0));
    if distMix < minDist
        minDist = distMix;
        minCoeff = c1;
    end
    %plot(c1, distMix, '*')
end
minCoeff;
mu_mix = minCoeff * mu_naive + (1 - minCoeff) * mu_reg;



%hold on
%plot(sort(Mu, 'ascend'), 'r')
%plot(sort(mu_naive, 'ascend'))
%plot(sort(mu_reg, 'ascend'), 'g')
%plot(sort(mu_mix, 'ascend'), 'k')

%legend('True Ordered Means', 'Naive Estimator', 'Regression Estimator', 'Linear Combination Estimator', 'Location', 'northwest')


%% Indifference Zone assumption
%est_mu(2:k) = min(est_mu(1) - delta, est_mu(2:k));

%mu = est_mu(sort_i);

% for i = 2:k
%     est_mu(i) = min(est_mu(i), est_mu(i-1));
% end

% sort_est_mu = sort(est_mu, 'descend');
% hold on
% plot(est_mu,'r');
% plot(sort_est_mu);
