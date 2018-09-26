subplot(3, 3, 1)
hold on
plot(n_KN_true(:,[19,10,1]), n_KN_naive_sim(:,[19,10,1]), 'o')
plot(n_KN_true(:,[19,10,1]), n_KN_reg_sim(:,[19,10,1]), '*')
legend('naive, k = 100', 'naive, k = 500', 'naive, k = 2000', 'regression, k = 100', 'regression, k = 500', 'regression, k = 2000', 'Location', 'northwest')
plot([0,2e7], [0, 2e7])
title('Estimations for KN procedure under SC')
xlabel('Total number of samples')
ylabel('Estimated total number of samples')