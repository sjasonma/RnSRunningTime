X0 = randn(N, k) .* (ones(N, 1) * Sigma) + ones(N, 1) * Mu;
subplot(2, 2, 1)
hist(mu, -2.5:0.1:2.5)
title('Histogram of the expectations')
subplot(2, 2, 2)
hist(mean(X0), -2.5:0.1:2.5)
title('Histogram of the sample means')

X0 = randn(N, k) .* (ones(N, 1) * Sigma) + ones(N, 1) * Mu;
subplot(2, 2, 3)
hist(mu, -2.5:0.1:2.5)
title('Histogram of the expectations')
subplot(2, 2, 4)
hist(mean(X0), -2.5:0.1:2.5)
title('Histogram of the sample means')



%%
%Est_mu
subplot(1, 2, 1)
hold on
plot(1:(l_end-1), y(1:(l_end-1)), 'g*')
plot(l_end:N, y(l_end:N), '*')
plot((1:0.1:100), b(1) + b(2) ./ sqrt(1:0.1:100), 'r')
plot([0, 100], [b(1), b(1)], 'r-.')
xlabel('x = n')
ylabel('y = m(n)')
legend('Unused data points', 'Data points for regression', 'Fitted curve', 'Estimated \mu')

subplot(1, 2, 2)
hold on
plot(x(1:(l_end-1),2), y(1:(l_end-1)), 'g*')
plot(x(l_end:N,2), y(l_end:N), '*')
plot([0, 1], [b(1), b(1) + b(2)], 'r')
plot(0, b(1), 'xr', 'MarkerSize',8, 'LineWidth', 1.2)
xlabel('x = n^{-1/2}')
ylabel('y = m(n)')
legend('Unused data points', 'Data points for regression', 'Fitted line', 'Estimated \mu', 'Location', 'northwest')
