%%
mean(n_BIZ_naive_sim(:, (1:10) + 0*10) ./ n_BIZ_true(:, (1:10) + 0*10))
mean(n_BIZ_naive_sim(:, (1:10) + 1*10) ./ n_BIZ_true(:, (1:10) + 1*10))
mean(n_BIZ_naive_sim(:, (1:10) + 2*10) ./ n_BIZ_true(:, (1:10) + 2*10))
mean(n_BIZ_mix_sim(:, (1:10) + 0*10) ./ n_BIZ_true(:, (1:10) + 0*10))
mean(n_BIZ_mix_sim(:, (1:10) + 1*10) ./ n_BIZ_true(:, (1:10) + 1*10))
mean(n_BIZ_mix_sim(:, (1:10) + 2*10) ./ n_BIZ_true(:, (1:10) + 2*10))
mean(n_BIZ_reg_sim(:, (1:10) + 0*10) ./ n_BIZ_true(:, (1:10) + 0*10))
mean(n_BIZ_reg_sim(:, (1:10) + 1*10) ./ n_BIZ_true(:, (1:10) + 1*10))
mean(n_BIZ_reg_sim(:, (1:10) + 2*10) ./ n_BIZ_true(:, (1:10) + 2*10))

mean(n_BIZ_naive_fluid(:, (1:10) + 0*10) ./ n_BIZ_true(:, (1:10) + 0*10))
mean(n_BIZ_naive_fluid(:, (1:10) + 1*10) ./ n_BIZ_true(:, (1:10) + 1*10))
mean(n_BIZ_naive_fluid(:, (1:10) + 2*10) ./ n_BIZ_true(:, (1:10) + 2*10))
mean(n_BIZ_mix_fluid(:, (1:10) + 0*10) ./ n_BIZ_true(:, (1:10) + 0*10))
mean(n_BIZ_mix_fluid(:, (1:10) + 1*10) ./ n_BIZ_true(:, (1:10) + 1*10))
mean(n_BIZ_mix_fluid(:, (1:10) + 2*10) ./ n_BIZ_true(:, (1:10) + 2*10))
mean(n_BIZ_reg_fluid(:, (1:10) + 0*10) ./ n_BIZ_true(:, (1:10) + 0*10))
mean(n_BIZ_reg_fluid(:, (1:10) + 1*10) ./ n_BIZ_true(:, (1:10) + 1*10))
mean(n_BIZ_reg_fluid(:, (1:10) + 2*10) ./ n_BIZ_true(:, (1:10) + 2*10))

%%

mean(abs(n_BIZ_naive_sim(:, (1:10) + 0*10) ./ n_BIZ_true(:, (1:10) + 0*10) - 1))
mean(abs(n_BIZ_naive_sim(:, (1:10) + 1*10) ./ n_BIZ_true(:, (1:10) + 1*10) - 1))
mean(abs(n_BIZ_naive_sim(:, (1:10) + 2*10) ./ n_BIZ_true(:, (1:10) + 2*10) - 1))
mean(abs(n_BIZ_mix_sim(:, (1:10) + 0*10) ./ n_BIZ_true(:, (1:10) + 0*10) - 1))
mean(abs(n_BIZ_mix_sim(:, (1:10) + 1*10) ./ n_BIZ_true(:, (1:10) + 1*10) - 1))
mean(abs(n_BIZ_mix_sim(:, (1:10) + 2*10) ./ n_BIZ_true(:, (1:10) + 2*10) - 1))
mean(abs(n_BIZ_reg_sim(:, (1:10) + 0*10) ./ n_BIZ_true(:, (1:10) + 0*10) - 1))
mean(abs(n_BIZ_reg_sim(:, (1:10) + 1*10) ./ n_BIZ_true(:, (1:10) + 1*10) - 1))
mean(abs(n_BIZ_reg_sim(:, (1:10) + 2*10) ./ n_BIZ_true(:, (1:10) + 2*10) - 1))

mean(abs(n_BIZ_true(:, (1:10) + 0*10) ./ n_BIZ_naive_sim(:, (1:10) + 0*10) - 1))
mean(abs(n_BIZ_true(:, (1:10) + 1*10) ./ n_BIZ_naive_sim(:, (1:10) + 1*10) - 1))
mean(abs(n_BIZ_true(:, (1:10) + 2*10) ./ n_BIZ_naive_sim(:, (1:10) + 2*10) - 1))
mean(abs(n_BIZ_true(:, (1:10) + 0*10) ./ n_BIZ_mix_sim(:, (1:10) + 0*10) - 1))
mean(abs(n_BIZ_true(:, (1:10) + 1*10) ./ n_BIZ_mix_sim(:, (1:10) + 1*10) - 1))
mean(abs(n_BIZ_true(:, (1:10) + 2*10) ./ n_BIZ_mix_sim(:, (1:10) + 2*10) - 1))
mean(abs(n_BIZ_true(:, (1:10) + 0*10) ./ n_BIZ_reg_sim(:, (1:10) + 0*10) - 1))
mean(abs(n_BIZ_true(:, (1:10) + 1*10) ./ n_BIZ_reg_sim(:, (1:10) + 1*10) - 1))
mean(abs(n_BIZ_true(:, (1:10) + 2*10) ./ n_BIZ_reg_sim(:, (1:10) + 2*10) - 1))

%%
% mean(n_BIZ_true(:, (1:10) + 0*10) ./ n_BIZ_naive_sim(:, (1:10) + 0*10))
% mean(n_BIZ_true(:, (1:10) + 1*10) ./ n_BIZ_naive_sim(:, (1:10) + 1*10))
% mean(n_BIZ_true(:, (1:10) + 2*10) ./ n_BIZ_naive_sim(:, (1:10) + 2*10))
% mean(n_BIZ_true(:, (1:10) + 0*10) ./ n_BIZ_mix_sim(:, (1:10) + 0*10))
% mean(n_BIZ_true(:, (1:10) + 1*10) ./ n_BIZ_mix_sim(:, (1:10) + 1*10))
% mean(n_BIZ_true(:, (1:10) + 2*10) ./ n_BIZ_mix_sim(:, (1:10) + 2*10))
% mean(n_BIZ_true(:, (1:10) + 0*10) ./ n_BIZ_reg_sim(:, (1:10) + 0*10))
% mean(n_BIZ_true(:, (1:10) + 1*10) ./ n_BIZ_reg_sim(:, (1:10) + 1*10))
% mean(n_BIZ_true(:, (1:10) + 2*10) ./ n_BIZ_reg_sim(:, (1:10) + 2*10))

%%
ci = 3;
ki = 1;
hold on
plot(n_BIZ_true(:, [1,2,3]+ci+ki*10), n_BIZ_naive_sim(:, [1,2,3]+ci+ki*10), '.')
plot(n_BIZ_true(:, [1,2,3]+ci+ki*10), n_BIZ_mix_sim(:, [1,2,3]+ci+ki*10), '*')
plot([0, max(max(n_BIZ_true(:, [1,2,3]+ci+ki*10)))], [0, max(max(n_BIZ_true(:, [1,2,3]+ci+ki*10)))])

ci = 7;
ki = 0;
hold on
plot(n_BIZ_true(:, [ci]+ki*10), n_BIZ_naive_sim(:, [ci]+ki*10), '.')
plot(n_BIZ_true(:, [ci]+ki*10), n_BIZ_mix_sim(:, [ci]+ki*10), '*')
plot([0, max(max(n_BIZ_true(:, [ci]+ki*10)))], [0, max(max(n_BIZ_true(:, [ci]+ki*10)))])

mean(n_BIZ_mix_sim(:, ci + 0*10) ./ n_BIZ_true(:, ci + 0*10))

%%
ci = 0;
ki = 0;
hold on
plot(n_BIZ_true(:, [1,2,3]+ci+ki*10), n_BIZ_naive_fluid(:, [1,2,3]+ci+ki*10), '.')
plot(n_BIZ_true(:, [1,2,3]+ci+ki*10), n_BIZ_mix_fluid(:, [1,2,3]+ci+ki*10), '*')
plot([0, max(max(n_BIZ_true(:, [1,2,3]+ci+ki*10)))], [0, max(max(n_BIZ_true(:, [1,2,3]+ci+ki*10)))])

ci = 0;
ki = 1;
hold on
plot(n_BIZ_true(:, [7,9]+ci+ki*10), n_BIZ_naive_fluid(:, [7,9]+ci+ki*10), '.')
plot(n_BIZ_true(:, [7,9]+ci+ki*10), n_BIZ_mix_fluid(:, [7,9]+ci+ki*10), '*')
plot([0, max(max(n_BIZ_true(:, [7,9]+ci+ki*10)))], [0, max(max(n_BIZ_true(:, [7,9]+ci+ki*10)))])

%%

ki = 0;
hold on
[r_naive, h_naive] = hist(n_BIZ_naive_sim(:, [1,2,3]+ki*10) ./ n_BIZ_true(:, [1,2,3]+ki*10));
[r_mix, h_mix] = hist(n_BIZ_mix_sim(:, [1,2,3]+ki*10) ./ n_BIZ_true(:, [1,2,3]+ki*10));
plot(h_naive, r_naive, '-');
plot(h_mix, r_mix, '--');
hist([n_BIZ_naive_sim(:, [1,2,3]+ki*10) ./ n_BIZ_true(:, [1,2,3]+ki*10), n_BIZ_mix_sim(:, [1,2,3]+ki*10) ./ n_BIZ_true(:, [1,2,3]+ki*10)]);
h = findobj(gca, 'Type', 'patch');
h(1).FaceColor = [1, 1, 0];
h(2).FaceColor = [1, 0.8, 0];
h(3).FaceColor = [1, 0.6, 0];
h(4).FaceColor = [0, 1, 1];
h(5).FaceColor = [0, 0.8, 1];
h(6).FaceColor = [0, 0.6, 1];


hold on
[r_naive, h_naive] = hist(n_BIZ_naive_sim(:, [4,5,6]+ki*10) ./ n_BIZ_true(:, [4,5,6]+ki*10));
[r_mix, h_mix] = hist(n_BIZ_mix_sim(:, [4,5,6]+ki*10) ./ n_BIZ_true(:, [4,5,6]+ki*10));
plot(h_naive, r_naive, '-');
plot(h_mix, r_mix, '--');
hist([n_BIZ_naive_sim(:, [4,5,6]+ki*10) ./ n_BIZ_true(:, [4,5,6]+ki*10), n_BIZ_mix_sim(:, [4,5,6]+ki*10) ./ n_BIZ_true(:, [4,5,6]+ki*10)])
h = findobj(gca, 'Type', 'patch');
h(1).FaceColor = [1, 1, 0];
h(2).FaceColor = [1, 0.5, 0];
h(3).FaceColor = [1, 0, 0];
h(4).FaceColor = [0, 1, 1];
h(5).FaceColor = [0, 0.5, 1];
h(6).FaceColor = [0, 0, 1];

hold on
[r_naive, h_naive] = hist(n_BIZ_naive_sim(:, [7,8,9,10]+ki*10) ./ n_BIZ_true(:, [7,8,9,10]+ki*10));
[r_mix, h_mix] = hist(n_BIZ_mix_sim(:, [7,8,9,10]+ki*10) ./ n_BIZ_true(:, [7,8,9,10]+ki*10));
plot(h_naive, r_naive(:, 1), 'o');
plot(h_naive, r_naive(:, 2), 'x')
plot(h_naive, r_naive(:, 3), '+')
plot(h_naive, r_naive(:, 4), '*')
plot(h_mix, r_mix(:, 1), 'o');
plot(h_mix, r_mix(:, 2), 'x');
plot(h_mix, r_mix(:, 3), '+');
plot(h_mix, r_mix(:, 4), '*');


hist([n_BIZ_naive_sim(:, [7,8,9,10]+ki*10) ./ n_BIZ_true(:, [7,8,9,10]+ki*10), n_BIZ_mix_sim(:, [7,8,9,10]+ki*10) ./ n_BIZ_true(:, [7,8,9,10]+ki*10)])
h = findobj(gca, 'Type', 'patch');
h(1).FaceColor = [1, 1, 0];
h(2).FaceColor = [1, 0.7, 0];
h(3).FaceColor = [1, 0.4, 0];
h(4).FaceColor = [1, 0.1, 0];
h(6).FaceColor = [0, 1, 1];
h(6).FaceColor = [0, 0.7, 1];
h(7).FaceColor = [0, 0.4, 1];
h(8).FaceColor = [0, 0.1, 1];

n_BIZ_mix_sim(:, [1,2,3]+ci+ki*10) ./ n_BIZ_true(:, [1,2,3]+ci+ki*10)

n_BIZ_mix_sim(:, [1,2,3]+ki*10) ./ n_BIZ_true(:, [1,2,3]+ki*10)
[sort_n, sort_i] = sort(n_BIZ_mix_sim(:, [1,2,3]+ki*10) ./ n_BIZ_true(:, [1,2,3]+ki*10));

%%
config_id = 1;
ci = config_id;
subplot(3,3,1)
hist( [ n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci)], 15, 'BinLimits', [0, 2])
legend('Linear Combination', 'Naive')
xlabel('Prediction of N / True value of N')
title(sprintf('%s, k = %.0f', char(config_names(config_id)), k_set(1)))

ci = ci + 10;
subplot(3,3,2)
hist( [ n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci)], 15, 'BinLimits', [0, 2])
legend('Linear Combination', 'Naive')
xlabel('Prediction of N / True value of N')
title(sprintf('%s, k = %.0f', char(config_names(config_id)), k_set(2)))

ci = ci + 10;
subplot(3,3,3)
hist( [ n_BIZ_mix_sim(:, ci) ./ n_BIZ_true(:, ci), n_BIZ_naive_sim(:, ci) ./ n_BIZ_true(:, ci)], 15, 'BinLimits', [0, 2])
legend('Linear Combination', 'Naive')
xlabel('Prediction of N / True value of N')
title(sprintf('%s, k = %.0f', char(config_names(config_id)), k_set(3)))



%%
ci = 1;
subplot(3,3,1)
hist( [ n_BIZ_true(:, ci) ./ n_BIZ_naive_sim(:, ci),  n_BIZ_true(:, ci) ./ n_BIZ_mix_sim(:, ci) ], 20)
ci = ci + 10;
subplot(3,3,2)
hist( [ n_BIZ_true(:, ci) ./ n_BIZ_naive_sim(:, ci),  n_BIZ_true(:, ci) ./ n_BIZ_mix_sim(:, ci) ], 20)
ci = ci + 10;
subplot(3,3,3)
hist( [ n_BIZ_true(:, ci) ./ n_BIZ_naive_sim(:, ci),  n_BIZ_true(:, ci) ./ n_BIZ_mix_sim(:, ci) ], 20)

