%%
for ip = [1,2,3,4,5,6,7,8,10]
    for jp = 0:2
        fprintf('%.4f, %.4f, ', mean(n_GSP_naive_sim(:, ip + jp*10) ./  n_GSP_true(:, ip + jp*10)), mean(n_GSP_mix_sim(:, ip + jp*10) ./  n_GSP_true(:, ip + jp*10)))
    end
    fprintf('\n')
end

%%
for ip = [1,2,3,4,5,6,7,8,10]
    for jp = 0:2
        fprintf('%.4f, %.4f, ', mean(n_GSP_naive_fluid(:, ip + jp*10) ./  n_GSP_true(:, ip + jp*10)), mean(n_GSP_mix_sim(:, ip + jp*10) ./  n_GSP_true(:, ip + jp*10)))
    end
    fprintf('\n')
end
%%
mean(n_GSP_naive_sim(:, (1:10) + 0*10) ./ n_GSP_true(:, (1:10) + 0*10))
mean(n_GSP_naive_sim(:, (1:10) + 1*10) ./ n_GSP_true(:, (1:10) + 1*10))
mean(n_GSP_naive_sim(:, (1:10) + 2*10) ./ n_GSP_true(:, (1:10) + 2*10))
mean(n_GSP_mix_sim(:, (1:10) + 0*10) ./ n_GSP_true(:, (1:10) + 0*10))
mean(n_GSP_mix_sim(:, (1:10) + 1*10) ./ n_GSP_true(:, (1:10) + 1*10))
mean(n_GSP_mix_sim(:, (1:10) + 2*10) ./ n_GSP_true(:, (1:10) + 2*10))
mean(n_GSP_reg_sim(:, (1:10) + 0*10) ./ n_GSP_true(:, (1:10) + 0*10))
mean(n_GSP_reg_sim(:, (1:10) + 1*10) ./ n_GSP_true(:, (1:10) + 1*10))
mean(n_GSP_reg_sim(:, (1:10) + 2*10) ./ n_GSP_true(:, (1:10) + 2*10))

mean(n_GSP_naive_fluid(:, (1:10) + 0*10) ./ n_GSP_true(:, (1:10) + 0*10))
mean(n_GSP_naive_fluid(:, (1:10) + 1*10) ./ n_GSP_true(:, (1:10) + 1*10))
mean(n_GSP_naive_fluid(:, (1:10) + 2*10) ./ n_GSP_true(:, (1:10) + 2*10))
mean(n_GSP_mix_fluid(:, (1:10) + 0*10) ./ n_GSP_true(:, (1:10) + 0*10))
mean(n_GSP_mix_fluid(:, (1:10) + 1*10) ./ n_GSP_true(:, (1:10) + 1*10))
mean(n_GSP_mix_fluid(:, (1:10) + 2*10) ./ n_GSP_true(:, (1:10) + 2*10))
mean(n_GSP_reg_fluid(:, (1:10) + 0*10) ./ n_GSP_true(:, (1:10) + 0*10))
mean(n_GSP_reg_fluid(:, (1:10) + 1*10) ./ n_GSP_true(:, (1:10) + 1*10))
mean(n_GSP_reg_fluid(:, (1:10) + 2*10) ./ n_GSP_true(:, (1:10) + 2*10))



%%
mean(abs(n_GSP_naive_sim(:, (1:10) + 0*10) ./ n_GSP_true(:, (1:10) + 0*10) - 1))
mean(abs(n_GSP_naive_sim(:, (1:10) + 1*10) ./ n_GSP_true(:, (1:10) + 1*10) - 1))
mean(abs(n_GSP_naive_sim(:, (1:10) + 2*10) ./ n_GSP_true(:, (1:10) + 2*10) - 1))
mean(abs(n_GSP_mix_sim(:, (1:10) + 0*10) ./ n_GSP_true(:, (1:10) + 0*10) - 1))
mean(abs(n_GSP_mix_sim(:, (1:10) + 1*10) ./ n_GSP_true(:, (1:10) + 1*10) - 1))
mean(abs(n_GSP_mix_sim(:, (1:10) + 2*10) ./ n_GSP_true(:, (1:10) + 2*10) - 1))
mean(abs(n_GSP_reg_sim(:, (1:10) + 0*10) ./ n_GSP_true(:, (1:10) + 0*10) - 1))
mean(abs(n_GSP_reg_sim(:, (1:10) + 1*10) ./ n_GSP_true(:, (1:10) + 1*10) - 1))
mean(abs(n_GSP_reg_sim(:, (1:10) + 2*10) ./ n_GSP_true(:, (1:10) + 2*10) - 1))

mean(abs(n_GSP_true(:, (1:10) + 0*10) ./ n_GSP_naive_sim(:, (1:10) + 0*10) - 1))
mean(abs(n_GSP_true(:, (1:10) + 1*10) ./ n_GSP_naive_sim(:, (1:10) + 1*10) - 1))
mean(abs(n_GSP_true(:, (1:10) + 2*10) ./ n_GSP_naive_sim(:, (1:10) + 2*10) - 1))
mean(abs(n_GSP_true(:, (1:10) + 0*10) ./ n_GSP_mix_sim(:, (1:10) + 0*10) - 1))
mean(abs(n_GSP_true(:, (1:10) + 1*10) ./ n_GSP_mix_sim(:, (1:10) + 1*10) - 1))
mean(abs(n_GSP_true(:, (1:10) + 2*10) ./ n_GSP_mix_sim(:, (1:10) + 2*10) - 1))
mean(abs(n_GSP_true(:, (1:10) + 0*10) ./ n_GSP_reg_sim(:, (1:10) + 0*10) - 1))
mean(abs(n_GSP_true(:, (1:10) + 1*10) ./ n_GSP_reg_sim(:, (1:10) + 1*10) - 1))
mean(abs(n_GSP_true(:, (1:10) + 2*10) ./ n_GSP_reg_sim(:, (1:10) + 2*10) - 1))


ci = (k_i-1)*length(config_id_set) + config_id;
figure
hold on
plot(n_GSP_true(:, ci), n_GSP_naive_sim(:, ci), 'o')
plot(n_GSP_true(:, ci), n_GSP_mix_sim(:, ci), '*')
plot([0, max(max(n_GSP_true(:, ci)))], [0, max(max(n_GSP_true(:, ci)))])
fprintf('%.4f, %.4f: mean ratio\n', mean(n_GSP_naive_sim(:, ci)' ./ n_GSP_true(:, ci)'), mean(n_GSP_mix_sim(:, ci)' ./ n_GSP_true(:, ci)'))

ci = ci + 10;
figure
hold on
plot(n_GSP_true(:, ci), n_GSP_naive_sim(:, ci), 'o')
plot(n_GSP_true(:, ci), n_GSP_mix_sim(:, ci), '*')
plot([0, max(max(n_GSP_true(:, ci)))], [0, max(max(n_GSP_true(:, ci)))])
fprintf('%.4f, %.4f: mean ratio\n', mean(n_GSP_naive_sim(:, ci)' ./ n_GSP_true(:, ci)'), mean(n_GSP_mix_sim(:, ci)' ./ n_GSP_true(:, ci)'))

ci = ci + 10;
figure
hold on
plot(n_GSP_true(:, ci), n_GSP_naive_sim(:, ci), 'o')
plot(n_GSP_true(:, ci), n_GSP_mix_sim(:, ci), '*')
plot([0, max(max(n_GSP_true(:, ci)))], [0, max(max(n_GSP_true(:, ci)))])
fprintf('%.4f, %.4f: mean ratio\n', mean(n_GSP_naive_sim(:, ci)' ./ n_GSP_true(:, ci)'), mean(n_GSP_mix_sim(:, ci)' ./ n_GSP_true(:, ci)'))
