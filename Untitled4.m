sqrt(mean((n_KN_naive_fluid ./ n_KN_true - 1).^2))
mean(n_KN_reg_fluid ./ n_KN_true)
mean(n_KN_mix_fluid ./ n_KN_true)
mean(n_KN_naive_sim ./ n_KN_true)
mean(n_KN_reg_sim ./ n_KN_true)
mean(n_KN_mix_sim ./ n_KN_true)

mean(n_BIZ_naive_fluid ./ n_BIZ_true)
mean(n_BIZ_reg_fluid ./ n_BIZ_true)
mean(n_BIZ_mix_fluid ./ n_BIZ_true)
mean(n_BIZ_naive_sim ./ n_BIZ_true)
mean(n_BIZ_reg_sim ./ n_BIZ_true)
mean(n_BIZ_mix_sim ./ n_BIZ_true)

mean(n_GSP_naive_fluid ./ n_GSP_true)
mean(n_GSP_reg_fluid ./ n_GSP_true)
mean(n_GSP_mix_fluid ./ n_GSP_true)
mean(n_GSP_naive_sim ./ n_GSP_true)
mean(n_GSP_reg_sim ./ n_GSP_true)
mean(n_GSP_mix_sim ./ n_GSP_true)

er = sqrt(mean((n_GSP_mix_sim ./ n_GSP_true - 1).^2))

er(1+[0,9,18]), mean(ans)
er(4+[0,9,18]), mean(ans)
er(5+[0,9,18]), mean(ans)

er(2+[0,9,18]), mean(ans)
er(6+[0,9,18]), mean(ans)
er(7+[0,9,18]), mean(ans)

er(3+[0,9,18]), mean(ans)
er(9+[0,9,18]), mean(ans)
er(8+[0,9,18]), mean(ans)

cols = [8 + [0, 9, 18]];
mean(n_KN_naive_sim(:, cols)) ./ mean(n_KN_true(:, cols))
mean(n_KN_reg_sim(:, cols)) ./ mean(n_KN_true(:, cols))
mean(n_KN_mix_sim(:, cols)) ./ mean(n_KN_true(:, cols))

cols = [8 + [0, 9, 18]];
mean(n_BIZ_naive_sim(:, cols)) ./ mean(n_BIZ_true(:, cols))
mean(n_BIZ_reg_sim(:, cols)) ./ mean(n_BIZ_true(:, cols))
mean(n_BIZ_mix_sim(:, cols)) ./ mean(n_BIZ_true(:, cols))

cols = [7 + [0, 9, 18]];
mean(n_GSP_naive_sim(:, cols)) ./ mean(n_GSP_true(:, cols))
mean(n_GSP_reg_sim(:, cols)) ./ mean(n_GSP_true(:, cols))
mean(n_GSP_mix_sim(:, cols)) ./ mean(n_GSP_true(:, cols))

