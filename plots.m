hold on
plot(n_KN_true(:,[1,4,5]), n_KN_reg_sim(:,[1,4,5]), '*')
plot(n_KN_true(:,[1,4,5]), n_KN_naive_sim(:,[1,4,5]), 'o')
legend('SC, regression', 'SC-INC, regression', 'SC-DEC, regression', 'SC, naive', 'SC-INC, naive', 'SC-DEC, naive', 'Location', 'northwest')
plot([0,14e6], [0, 14e6])
title('Naive estimation and regression estimation for KN under SC')
xlabel('Total number of samples')
ylabel('Estimated total number of samples')

hold on
plot(n_KN_true(:,[2,6,7]), n_KN_reg_sim(:,[2,6,7]), '*')
plot(n_KN_true(:,[2,6,7]), n_KN_naive_sim(:,[2,6,7]), 'o')
legend('MDM, regression', 'MDM-INC, regression', 'MDM-DEC, regression', 'MDM, naive', 'MDM-INC, naive', 'MDM-DEC, naive', 'Location', 'northwest')
plot([0,4e5], [0, 4e5])
title('Naive estimation and regression estimation for KN under MDM')
xlabel('Total number of samples')
ylabel('Estimated total number of samples')

hold on
plot(n_KN_true(:,[3, 8]), n_KN_reg_sim(:,[3, 8]), '*')
plot(n_KN_true(:,[3, 8]), n_KN_naive_sim(:,[3, 8]), 'o')
legend('RPI, regression', 'RPI-HET, regression', 'RPI, naive', 'RPI-HET, naive', 'Location', 'northwest')
plot([0,14e6], [0, 14e6])
title('Naive estimation and regression estimation for KN under RPI')
xlabel('Total number of samples')
ylabel('Estimated total number of samples')



hold on
plot(n_BIZ_true(:,[1,4,5]), n_BIZ_reg_sim(:,[1,4,5]), '*')
plot(n_BIZ_true(:,[1,4,5]), n_BIZ_naive_sim(:,[1,4,5]), 'o')
legend('SC, regression', 'SC-INC, regression', 'SC-DEC, regression', 'SC, naive', 'SC-INC, naive', 'SC-DEC, naive', 'Location', 'northwest')
plot([0,8e6], [0, 8e6])
title('Naive estimation and regression estimation for BIZ under SC')
xlabel('Total number of samples')
ylabel('Estimated total number of samples')

hold on
plot(n_BIZ_true(:,[2,6,7]), n_BIZ_reg_sim(:,[2,6,7]), '*')
plot(n_BIZ_true(:,[2,6,7]), n_BIZ_naive_sim(:,[2,6,7]), 'o')
legend('MDM, regression', 'MDM-INC, regression', 'MDM-DEC, regression', 'MDM, naive', 'MDM-INC, naive', 'MDM-DEC, naive', 'Location', 'northwest')
plot([0,1.8e5], [0, 1.8e5])
title('Naive estimation and regression estimation for BIZ under MDM')
xlabel('Total number of samples')
ylabel('Estimated total number of samples')

hold on
plot(n_BIZ_true(:,[3, 8]), n_BIZ_reg_sim(:,[3, 8]), '*')
plot(n_BIZ_true(:,[3, 8]), n_BIZ_naive_sim(:,[3, 8]), 'o')
legend('RPI, regression', 'RPI-HET, regression', 'RPI, naive', 'RPI-HET, naive', 'Location', 'northwest')
plot([0,8e6], [0, 8e6])
title('Naive estimation and regression estimation for BIZ under RPI')
xlabel('Total number of samples')
ylabel('Estimated total number of samples')




hold on
plot(n_GSP_true(:,[1,4,5]), n_GSP_reg_sim(:,[1,4,5]), '*')
plot(n_GSP_true(:,[1,4,5]), n_GSP_naive_sim(:,[1,4,5]), 'o')
legend('SC, regression', 'SC-INC, regression', 'SC-DEC, regression', 'SC, naive', 'SC-INC, naive', 'SC-DEC, naive', 'Location', 'northwest')
plot([0,8e6], [0, 8e6])
title('Naive estimation and regression estimation for GSP under SC')
xlabel('Total number of samples')
ylabel('Estimated total number of samples')

hold on
plot(n_GSP_true(:,[2,6,7]), n_GSP_reg_sim(:,[2,6,7]), '*')
plot(n_GSP_true(:,[2,6,7]), n_GSP_naive_sim(:,[2,6,7]), 'o')
legend('MDM, regression', 'MDM-INC, regression', 'MDM-DEC, regression', 'MDM, naive', 'MDM-INC, naive', 'MDM-DEC, naive', 'Location', 'northwest')
plot([0,15e5], [0, 15e5])
title('Naive estimation and regression estimation for GSP under MDM')
xlabel('Total number of samples')
ylabel('Estimated total number of samples')

hold on
plot(n_GSP_true(:,[3, 8]), n_GSP_reg_sim(:,[3, 8]), '*')
plot(n_GSP_true(:,[3, 8]), n_GSP_naive_sim(:,[3, 8]), 'o')
legend('RPI, regression', 'RPI-HET, regression', 'RPI, naive', 'RPI-HET, naive', 'Location', 'northwest')
plot([0,8e6], [0, 8e6])
title('Naive estimation and regression estimation for GSP under RPI')
xlabel('Total number of samples')
ylabel('Estimated total number of samples')