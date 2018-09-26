delta = 0.1;
%mu = [0.1, 0.08, 0.04, 0, 0, -0.01, -0.02, -0.05, -0.08 -0.2];
mu = [0.1, 0.05, 0.01, 0, -0.05, -0.1, -0.2, -0.3, -0.4, -0.5];
mu = [0.1, 0.05, 0, 0, 0, 0, 0, 0, 0, 0]
k = length(mu);
mu = sort(mu, 'descend')
sigma = 1 * ones(1, k);
funcHandles
N = 20000;
X = genSample(N, mu, sigma);

hold on
plot(cumsum(X(1:nMax,mu > max(mu) - delta)), '.-')
plot(cumsum(X(1:nMax,mu <= max(mu) - delta)), ':')
plot([0, nMax], [0, nMax*max(mu)])
plot([0, nMax], [0, nMax*max(mu) + 1.96 * sqrt(sigma2*nMax)], '--')
plot([0, nMax], [0, nMax*max(mu) - 1.96 * sqrt(sigma2*nMax)], '--')
legend('1', '2', '3', '4', '5', '6','7','8','9','10', 'Location', 'NorthWest')

hold on
for i = 1 : k
    if mu(i) > max(mu) - delta
        plot(cumsum(X(1:ni(i), i)), '.-')
    else
        plot(cumsum(X(1:ni(i), i)), ':')
    end
end


%%
n1 = 1;
Xbar = mean(genSample(n1, mu, sigma), 1);
Y = Xbar * n1;

p_select = zeros(1, k);
p_elim = zeros(1, k);
for i = 1 : k
Xbar_i = Xbar(i);
Xbar_other = Xbar([1:(i-1), (i+1):end]);
p_select(i) = calcProbSelect(Xbar_i, Xbar_other, sigma2, t, delta);
p_elim(i) = calcProbElim(Xbar_i, Xbar_other, sigma2, t);
end
p_elim
q = exp(delta * Y / sigma2);
q = q / sum(q)

%%
% mu_t = Xbar * 2;
% mu_t = sort(mu_t, 'descend');
% R = perms(k:-1:1);
% k_fct = factorial(k);
% 
% Q_u = zeros(k, k);
% for j = 1:k
%     for i = 1:k
%        for ri = 1:k_fct
%            if R(ri, i) ~= j
%                continue
%            end
%            Q_u(i, j) = Q_u(i, j) + exp(sum(Y .* mu_t(R(ri, :))));
%            sum(Y .* mu_t(R(ri, :)));
%        end
%    end
%    Q_u(:, j) = Q_u(:, j) / sum(Q_u(:, j));
% end
% Q_up(:, 1)'