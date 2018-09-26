%% expectation_spread
rng(1)

k = 1000;
Mu = zeros(1, k);
Mu(1) = delta;
Sigma = 5 * ones(1, k);
subplot(2,2,1)
histogram(Mu, 20, 'BinWidth', 0.1, 'BinLimits', [-3, 3])
title('Histogram of the true means')

n0 = 50;
Xbar = genSample(1, Mu, Sigma/sqrt(n0));
subplot(2,2,2)
histogram(Xbar, 20, 'BinWidth', 0.1, 'BinLimits', [-3, 3])
title('Histogram of the sample means')

Mu = randn(1, k) * 2 * delta;
subplot(2,2,3)
histogram(Mu, 20, 'BinWidth', 0.1, 'BinLimits', [-3, 3])
title('Histogram of the true means')

n0 = 50;
Xbar = genSample(1, Mu, Sigma/sqrt(n0));
subplot(2,2,4)
histogram(Xbar, 20, 'BinWidth', 0.1, 'BinLimits', [-3, 3])
title('Histogram of the sample means')

%% regression1
rng(2)
k = 1000;
Mu = zeros(1, k);
Sigma = 2 * ones(1, k);
n0 = 50;

X0 = genSample(n0, Mu, Sigma);
Xbar = cumsum(X0) ./ repmat((1:n0)', [1, k]);
y = max(Xbar')';
x = [ones(1, n0);1 ./ sqrt(1:n0)]';
b = lscov(x(1:n0, :), y(1:n0));

subplot(1,2,1)
hold on
plot(1:n0, y, 'b*')
plot(1:100, b(1) + b(2) ./ sqrt(1:100), 'r-')
plot([0, 100], [b(1), b(1)], 'r-.')
legend('Data points', 'Fitted curve', 'Estimated \mu', 'Location', 'NorthEast')
xlabel('x = n')
ylabel('y = m(n)')

subplot(1,2,2)
hold on
plot((1:n0).^(-1/2), y, 'b*')
plot([0, 1], [b(1), b(1) + b(2)], 'r-')
plot(0, b(1), 'rx')
legend('Data points', 'Fitted curve', 'Estimated \mu', 'Location', 'NorthWest')
xlabel('x = n^{-1/2}')
ylabel('y = m(n)')

b(1)

%% regression2
rng(3)
k = 1000;
Mu = randn(1, k) * 0.2;
Mu = Mu - max(Mu);
Sigma = 2 * ones(1, k);
n0 = 50;

X0 = genSample(n0, Mu, Sigma);
Xbar = cumsum(X0) ./ repmat((1:n0)', [1, k]);
y = max(Xbar')';
x = [ones(1, n0);1 ./ sqrt(1:n0)]';
b = lscov(x(26:n0, :), y(26:n0));

subplot(1,2,1)
hold on
plot(26:n0, y(26:n0), 'b*')
plot(1:25, y(1:25), 'g*')
plot(1:100, b(1) + b(2) ./ sqrt(1:100), 'r-')
plot([0, 100], [b(1), b(1)], 'r-.')
legend('Data points for regression', 'Unused data points', 'Fitted curve', 'Estimated \mu', 'Location', 'NorthEast')
xlabel('x = n')
ylabel('y = m(n)')

subplot(1,2,2)
hold on
plot((26:n0).^(-1/2), y(26:n0), 'b*')
plot((1:25).^(-1/2), y(1:25), 'g*')
plot([0, 1], [b(1), b(1) + b(2)], 'r-')
plot(0, b(1), 'rx')
legend('Data points for regression','Unused data points', 'Fitted curve', 'Estimated \mu', 'Location', 'NorthWest')
xlabel('x = n^{-1/2}')
ylabel('y = m(n)')

b(1)

%% regression_shuffle
rng(6)
k = 1000;
Mu = randn(1, k) * 0.2;
Mu = Mu - max(Mu);
Sigma = 2 * ones(1, k);
n0 = 50;
m = 100; % bootstrap size

X0 = genSample(n0, Mu, Sigma);

X = zeros(size(X0));
sort_x = zeros(n0, k);
for i_bootstrap = 1:m
    for i = 1:k
        X(:, i) = X0(randperm(n0), i);
        %X(:, i) = datasample(X0(:, i), N, 'Replace', true);
    end
    Xbar = cumsum(X) ./ repmat((1:n0)', [1, k]);
    sort_x = sort_x + sort(Xbar, 2);
end
sort_x = sort_x / m;

y = sort_x(:, k);
x = [ones(1, n0);1 ./ sqrt(1:n0)]';
b = lscov(x(26:n0, :), y(26:n0));

subplot(1,2,1)
hold on
plot(26:n0, y(26:n0), 'b*')
plot(1:25, y(1:25), 'g*')
plot(1:100, b(1) + b(2) ./ sqrt(1:100), 'r-')
plot([0, 100], [b(1), b(1)], 'r-.')
legend('Data points for regression', 'Unused data points', 'Fitted curve', 'Estimated \mu', 'Location', 'NorthEast')
xlabel('x = n')
ylabel('y = m(n)')

subplot(1,2,2)
hold on
plot((26:n0).^(-1/2), y(26:n0), 'b*')
plot((1:25).^(-1/2), y(1:25), 'g*')
plot([0, 1], [b(1), b(1) + b(2)], 'r-')
plot(0, b(1), 'rx')
legend('Data points for regression','Unused data points', 'Fitted curve', 'Estimated \mu', 'Location', 'NorthWest')
xlabel('x = n^{-1/2}')
ylabel('y = m(n)')

b(1)

%% linear_combination

rng(7)
k = 1000;
Mu = randn(1, k) * 0.2;
Mu = Mu - max(Mu);
Sigma = 2 * ones(1, k);

Est_mu

hold on
plot(sort(Mu), 'r', 'LineWidth', 1.5)
plot(sort(mu_naive), 'b', 'LineWidth', 1.5)
plot(sort(mu_reg), 'g', 'LineWidth', 1.5)
plot(sort(mu_mix), 'k', 'LineWidth', 1.5)
xlabel('i')
ylabel('Estimated \mu_{(i)}')
legend('True ordered means', 'Naive estimator', 'Regression Estimator', 'Linear Combination Estimator', 'Location', 'NorthWest')

minCoeff

%% HIST-SC-BIZ
config_id = 1;
ci = config_id;
subplot(3,3,1)
hist( [ n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci)], 10)
halfLength = max(max(abs(n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)), max(abs(n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)));
xlim([1 - halfLength, 1 + halfLength])
legend('LC', 'Naive')
title(sprintf('%s, k = %.0f', char(config_names(config_id)), k_set(1)))

ci = ci + 10;
subplot(3,3,2)
hist( [ n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci)], 10)
halfLength = max(max(abs(n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)), max(abs(n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)));
xlim([1 - halfLength, 1 + halfLength])
legend('LC', 'Naive')
title(sprintf('%s, k = %.0f', char(config_names(config_id)), k_set(2)))

ci = ci + 10;
subplot(3,3,3)
hist( [ n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci)], 10)
halfLength = max(max(abs(n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)), max(abs(n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)));
xlim([1 - halfLength, 1 + halfLength])
legend('LC', 'Naive')
title(sprintf('%s, k = %.0f', char(config_names(config_id)), k_set(3)))

config_id = 2;
ci = config_id;
subplot(3,3,4)
hist( [ n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci)], 10)
halfLength = max(max(abs(n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)), max(abs(n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)));
xlim([1 - halfLength, 1 + halfLength])
legend('LC', 'Naive')
title(sprintf('%s, k = %.0f', char(config_names(config_id)), k_set(1)))

ci = ci + 10;
subplot(3,3,5)
hist( [ n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci)], 10)
halfLength = max(max(abs(n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)), max(abs(n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)));
xlim([1 - halfLength, 1 + halfLength])
legend('LC', 'Naive')
title(sprintf('%s, k = %.0f', char(config_names(config_id)), k_set(2)))

ci = ci + 10;
subplot(3,3,6)
hist( [ n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci)], 10)
halfLength = max(max(abs(n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)), max(abs(n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)));
xlim([1 - halfLength, 1 + halfLength])
legend('LC', 'Naive')
title(sprintf('%s, k = %.0f', char(config_names(config_id)), k_set(3)))

config_id = 3;
ci = config_id;
subplot(3,3,7)
hist( [ n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci)], 10)
legend('LC', 'Naive')
title(sprintf('%s, k = %.0f', char(config_names(config_id)), k_set(1)))

ci = ci + 10;
subplot(3,3,8)
hist( [ n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci)], 10)
halfLength = max(max(abs(n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)), max(abs(n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)));
xlim([1 - halfLength, 1 + halfLength])
legend('LC', 'Naive')
title(sprintf('%s, k = %.0f', char(config_names(config_id)), k_set(2)))

ci = ci + 10;
subplot(3,3,9)
hist( [ n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci)], 10)
halfLength = max(max(abs(n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)), max(abs(n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)));
xlim([1 - halfLength, 1 + halfLength])
legend('LC', 'Naive')
title(sprintf('%s, k = %.0f', char(config_names(config_id)), k_set(3)))

%% HIST-MDM-BIZ

config_id = 4;
ci = config_id;
subplot(3,3,1)
hist( [ n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci)], 10)
halfLength = max(max(abs(n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)), max(abs(n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)));
xlim([1 - halfLength, 1 + halfLength])
legend('LC', 'Naive')
title(sprintf('%s, k = %.0f', char(config_names(config_id)), k_set(1)))

ci = ci + 10;
subplot(3,3,2)
hist( [ n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci)], 10)
halfLength = max(max(abs(n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)), max(abs(n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)));
xlim([1 - halfLength, 1 + halfLength])
legend('LC', 'Naive')
title(sprintf('%s, k = %.0f', char(config_names(config_id)), k_set(2)))

ci = ci + 10;
subplot(3,3,3)
hist( [ n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci)], 10)
halfLength = max(max(abs(n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)), max(abs(n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)));
xlim([1 - halfLength, 1 + halfLength])
legend('LC', 'Naive')
title(sprintf('%s, k = %.0f', char(config_names(config_id)), k_set(3)))

config_id = 5;
ci = config_id;
subplot(3,3,4)
hist( [ n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci)], 10)
halfLength = max(max(abs(n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)), max(abs(n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)));
xlim([1 - halfLength, 1 + halfLength])
legend('LC', 'Naive')
title(sprintf('%s, k = %.0f', char(config_names(config_id)), k_set(1)))

ci = ci + 10;
subplot(3,3,5)
hist( [ n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci)], 10)
halfLength = max(max(abs(n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)), max(abs(n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)));
xlim([1 - halfLength, 1 + halfLength])
legend('LC', 'Naive')
title(sprintf('%s, k = %.0f', char(config_names(config_id)), k_set(2)))

ci = ci + 10;
subplot(3,3,6)
hist( [ n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci)], 10)
halfLength = max(max(abs(n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)), max(abs(n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)));
xlim([1 - halfLength, 1 + halfLength])
legend('LC', 'Naive')
title(sprintf('%s, k = %.0f', char(config_names(config_id)), k_set(3)))

config_id = 6;
ci = config_id;
subplot(3,3,7)
hist( [ n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci)], 10)
halfLength = max(max(abs(n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)), max(abs(n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)));
xlim([1 - halfLength, 1 + halfLength])
legend('LC', 'Naive')
title(sprintf('%s, k = %.0f', char(config_names(config_id)), k_set(1)))

ci = ci + 10;
subplot(3,3,8)
hist( [ n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci)], 10)
halfLength = max(max(abs(n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)), max(abs(n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)));
xlim([1 - halfLength, 1 + halfLength])
legend('LC', 'Naive')
title(sprintf('%s, k = %.0f', char(config_names(config_id)), k_set(2)))

ci = ci + 10;
subplot(3,3,9)
hist( [ n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci)], 10)
halfLength = max(max(abs(n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)), max(abs(n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)));
xlim([1 - halfLength, 1 + halfLength])
legend('LC', 'Naive')
title(sprintf('%s, k = %.0f', char(config_names(config_id)), k_set(3)))

%% HIST-RPI-BIZ

config_id = 7;
ci = config_id;
subplot(3,3,1)
hist( [ n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci)], 10)
halfLength = max(max(abs(n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)), max(abs(n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)));
xlim([1 - halfLength, 1 + halfLength])
legend('LC', 'Naive')
title(sprintf('%s, k = %.0f', char(config_names(config_id)), k_set(1)))

ci = ci + 10;
subplot(3,3,2)
hist( [ n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci)], 10)
halfLength = max(max(abs(n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)), max(abs(n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)));
xlim([1 - halfLength, 1 + halfLength])
legend('LC', 'Naive')
title(sprintf('%s, k = %.0f', char(config_names(config_id)), k_set(2)))

ci = ci + 10;
subplot(3,3,3)
hist( [ n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci)], 10)
halfLength = max(max(abs(n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)), max(abs(n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)));
xlim([1 - halfLength, 1 + halfLength])
legend('LC', 'Naive')
title(sprintf('%s, k = %.0f', char(config_names(config_id)), k_set(3)))

config_id = 8;
ci = config_id;
subplot(3,3,4)
hist( [ n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci)], 10)
halfLength = max(max(abs(n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)), max(abs(n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)));
xlim([1 - halfLength, 1 + halfLength])
legend('LC', 'Naive')
title(sprintf('%s, k = %.0f', char(config_names(config_id)), k_set(1)))

ci = ci + 10;
subplot(3,3,5)
hist( [ n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci)], 10)
halfLength = max(max(abs(n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)), max(abs(n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)));
xlim([1 - halfLength, 1 + halfLength])
legend('LC', 'Naive')
title(sprintf('%s, k = %.0f', char(config_names(config_id)), k_set(2)))

ci = ci + 10;
subplot(3,3,6)
hist( [ n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci)], 10)
halfLength = max(max(abs(n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)), max(abs(n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)));
xlim([1 - halfLength, 1 + halfLength])
legend('LC', 'Naive')
title(sprintf('%s, k = %.0f', char(config_names(config_id)), k_set(3)))

config_id = 10;
ci = config_id;
subplot(3,3,7)
hist( [ n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci)], 10)
halfLength = max(max(abs(n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)), max(abs(n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)));
xlim([1 - halfLength, 1 + halfLength])
legend('LC', 'Naive')
title(sprintf('%s, k = %.0f', char(config_names(config_id)), k_set(1)))

ci = ci + 10;
subplot(3,3,8)
hist( [ n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci)], 10)
halfLength = max(max(abs(n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)), max(abs(n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)));
xlim([1 - halfLength, 1 + halfLength])
legend('LC', 'Naive')
title(sprintf('%s, k = %.0f', char(config_names(config_id)), k_set(2)))

ci = ci + 10;
subplot(3,3,9)
hist( [ n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci)], 10)
halfLength = max(max(abs(n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)), max(abs(n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci) - 1)));
xlim([1 - halfLength, 1 + halfLength])
legend('LC', 'Naive')
title(sprintf('%s, k = %.0f', char(config_names(config_id)), k_set(3)))

%% PLOT-SC-BIZ

config_id = 1;
ci = config_id;
subplot(2,2,1)
hold on
plot(n_BIZ_true(:, ci), n_BIZ_mix_sim(:, ci), 'bo')
plot(n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci), 'ro')

ci = ci + 10;
plot(n_BIZ_true(:, ci), n_BIZ_mix_sim(:, ci), 'b+')
plot(n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci), 'r+')

ci = ci + 10;

plot(n_BIZ_true(:, ci), n_BIZ_mix_sim(:, ci), 'b*')
plot(n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci), 'r*')

plot([0, max(n_BIZ_true(:, ci))], [0, max(n_BIZ_true(:, ci))], 'k')
title(sprintf('%s, k = 100, 500, 2000', char(config_names(config_id))))
xlabel('True N')
ylabel('Estimated N')

config_id = 2;
ci = config_id;
subplot(2,2,2)
hold on
plot(n_BIZ_true(:, ci), n_BIZ_mix_sim(:, ci), 'bo')
plot(n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci), 'ro')

ci = ci + 10;
plot(n_BIZ_true(:, ci), n_BIZ_mix_sim(:, ci), 'b+')
plot(n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci), 'r+')

ci = ci + 10;

plot(n_BIZ_true(:, ci), n_BIZ_mix_sim(:, ci), 'b*')
plot(n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci), 'r*')

plot([0, max(n_BIZ_true(:, ci))], [0, max(n_BIZ_true(:, ci))], 'k')
title(sprintf('%s, k = 100, 500, 2000', char(config_names(config_id))))
xlabel('True N')
ylabel('Estimated N')


config_id = 3;
ci = config_id;
subplot(2,2,3)
hold on
plot(n_BIZ_true(:, ci), n_BIZ_mix_sim(:, ci), 'bo')
plot(n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci), 'ro')

ci = ci + 10;
plot(n_BIZ_true(:, ci), n_BIZ_mix_sim(:, ci), 'b+')
plot(n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci), 'r+')

ci = ci + 10;

plot(n_BIZ_true(:, ci), n_BIZ_mix_sim(:, ci), 'b*')
plot(n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci), 'r*')

plot([0, max(n_BIZ_true(:, ci))], [0, max(n_BIZ_true(:, ci))], 'k')
title(sprintf('%s, k = 100, 500, 2000', char(config_names(config_id))))
xlabel('True N')
ylabel('Estimated N')

subplot(2,2,4)
hold on
l1 = plot(10,10, 'bo');
l2 = plot(10,10, 'ro');
l3 = plot(10,10, 'b+');
l4 = plot(10,10, 'r+');
l5 = plot(10,10, 'b*');
l6 = plot(10,10, 'r*');
l7 = plot([0,0], [1,1], 'k')
set(gca,'position',[0 0 1.1 1.1],'units','normalized')
set(gca, 'FontSize', 13)
axis off
legend('Linear combination estimator, k = 100','Naive estimator, k = 100','Linear combination estimator, k = 500','Naive estimator, k = 500','Linear combination estimator, k = 2000','Naive estimator, k = 2000', 'True N = Estimated N', 'Location', 'NorthWest')

%% PLOT-MDM-BIZ

config_id = 4;
ci = config_id;
subplot(2,2,1)
hold on
plot(n_BIZ_true(:, ci), n_BIZ_mix_sim(:, ci), 'bo')
plot(n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci), 'ro')

ci = ci + 10;
plot(n_BIZ_true(:, ci), n_BIZ_mix_sim(:, ci), 'b+')
plot(n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci), 'r+')

ci = ci + 10;

plot(n_BIZ_true(:, ci), n_BIZ_mix_sim(:, ci), 'b*')
plot(n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci), 'r*')

plot([0, max(n_BIZ_true(:, ci))], [0, max(n_BIZ_true(:, ci))], 'k')
title(sprintf('%s, k = 100, 500, 2000', char(config_names(config_id))))
xlabel('True N')
ylabel('Estimated N')

config_id = 5;
ci = config_id;
subplot(2,2,2)
hold on
plot(n_BIZ_true(:, ci), n_BIZ_mix_sim(:, ci), 'bo')
plot(n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci), 'ro')

ci = ci + 10;
plot(n_BIZ_true(:, ci), n_BIZ_mix_sim(:, ci), 'b+')
plot(n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci), 'r+')

ci = ci + 10;

plot(n_BIZ_true(:, ci), n_BIZ_mix_sim(:, ci), 'b*')
plot(n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci), 'r*')

plot([0, max(n_BIZ_true(:, ci))], [0, max(n_BIZ_true(:, ci))], 'k')
title(sprintf('%s, k = 100, 500, 2000', char(config_names(config_id))))
xlabel('True N')
ylabel('Estimated N')


config_id = 6;
ci = config_id;
subplot(2,2,3)
hold on
plot(n_BIZ_true(:, ci), n_BIZ_mix_sim(:, ci), 'bo')
plot(n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci), 'ro')

ci = ci + 10;
plot(n_BIZ_true(:, ci), n_BIZ_mix_sim(:, ci), 'b+')
plot(n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci), 'r+')

ci = ci + 10;

plot(n_BIZ_true(:, ci), n_BIZ_mix_sim(:, ci), 'b*')
plot(n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci), 'r*')

plot([0, max(n_BIZ_true(:, ci))], [0, max(n_BIZ_true(:, ci))], 'k')
title(sprintf('%s, k = 100, 500, 2000', char(config_names(config_id))))
xlabel('True N')
ylabel('Estimated N')

subplot(2,2,4)
hold on
l1 = plot(10,10, 'bo');
l2 = plot(10,10, 'ro');
l3 = plot(10,10, 'b+');
l4 = plot(10,10, 'r+');
l5 = plot(10,10, 'b*');
l6 = plot(10,10, 'r*');
l7 = plot([0,0], [1,1], 'k')
set(gca,'position',[0 0 1.1 1.1],'units','normalized')
set(gca, 'FontSize', 13)
axis off
legend('Linear combination estimator, k = 100','Naive estimator, k = 100','Linear combination estimator, k = 500','Naive estimator, k = 500','Linear combination estimator, k = 2000','Naive estimator, k = 2000', 'True N = Estimated N', 'Location', 'NorthWest')

%% PLOT-RPI-BIZ

config_id = 7;
ci = config_id;
subplot(2,2,1)
hold on
plot(n_BIZ_true(:, ci), n_BIZ_mix_sim(:, ci), 'bo')
plot(n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci), 'ro')

ci = ci + 10;
plot(n_BIZ_true(:, ci), n_BIZ_mix_sim(:, ci), 'b+')
plot(n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci), 'r+')

ci = ci + 10;

plot(n_BIZ_true(:, ci), n_BIZ_mix_sim(:, ci), 'b*')
plot(n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci), 'r*')

plot([0, max(n_BIZ_true(:, ci))], [0, max(n_BIZ_true(:, ci))], 'k')
title(sprintf('%s, k = 100, 500, 2000', char(config_names(config_id))))
xlabel('True N')
ylabel('Estimated N')

config_id = 8;
ci = config_id;
subplot(2,2,2)
hold on
plot(n_BIZ_true(:, ci), n_BIZ_mix_sim(:, ci), 'bo')
plot(n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci), 'ro')

ci = ci + 10;
plot(n_BIZ_true(:, ci), n_BIZ_mix_sim(:, ci), 'b+')
plot(n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci), 'r+')

ci = ci + 10;

plot(n_BIZ_true(:, ci), n_BIZ_mix_sim(:, ci), 'b*')
plot(n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci), 'r*')

plot([0, max(n_BIZ_true(:, ci))], [0, max(n_BIZ_true(:, ci))], 'k')
title(sprintf('%s, k = 100, 500, 2000', char(config_names(config_id))))
xlabel('True N')
ylabel('Estimated N')


config_id = 10;
ci = config_id;
subplot(2,2,3)
hold on
plot(n_BIZ_true(:, ci), n_BIZ_mix_sim(:, ci), 'bo')
plot(n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci), 'ro')

ci = ci + 10;
plot(n_BIZ_true(:, ci), n_BIZ_mix_sim(:, ci), 'b+')
plot(n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci), 'r+')

ci = ci + 10;

plot(n_BIZ_true(:, ci), n_BIZ_mix_sim(:, ci), 'b*')
plot(n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci), 'r*')

plot([0, max(n_BIZ_true(:, ci))], [0, max(n_BIZ_true(:, ci))], 'k')
title(sprintf('%s, k = 100, 500, 2000', char(config_names(config_id))))
xlabel('True N')
ylabel('Estimated N')

subplot(2,2,4)
hold on
l1 = plot(10,10, 'bo');
l2 = plot(10,10, 'ro');
l3 = plot(10,10, 'b+');
l4 = plot(10,10, 'r+');
l5 = plot(10,10, 'b*');
l6 = plot(10,10, 'r*');
l7 = plot([0,0], [1,1], 'k')
set(gca,'position',[0 0 1.1 1.1],'units','normalized')
set(gca, 'FontSize', 13)
axis off
legend('Linear combination estimator, k = 100','Naive estimator, k = 100','Linear combination estimator, k = 500','Naive estimator, k = 500','Linear combination estimator, k = 2000','Naive estimator, k = 2000', 'True N = Estimated N', 'Location', 'NorthWest')

