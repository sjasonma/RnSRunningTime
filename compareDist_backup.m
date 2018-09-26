function res = compareDist_backup(mu, sigma, Xbar, n0)

% Xbar = sort(Xbar - max(Xbar), 'descend');
% 
% res = 0;
% n_compare = 100;
% for i = 1 : n_compare
%     Xbar_new = mu + randn(size(mu)) .* sigma / sqrt(n0);
%     Xbar_new = sort(Xbar_new - max(Xbar_new), 'descend');
%     res = res + sum(Xbar - Xbar_new);
% end
% res = res / n_compare;

Xbar = sort(Xbar);
k = length(mu);

res = 0;
n_compare = 1000;
Xbar_new = zeros(size(Xbar));
for i = 1 : n_compare
    Xbar_new = sort(mu + randn(size(mu)) .* sigma / sqrt(n0));
    %Xbar = Xbar - max(Xbar);
    %Xbar_new = Xbar_new - max(Xbar_new);
    res = res + norm(Xbar(1:(k)) - Xbar_new(1:(k)));
end
res = res / n_compare;


%hold on
%plot(Xbar, 'r')
%plot(Xbar_new)
%sum(Xbar - Xbar_new)