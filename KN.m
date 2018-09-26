n1 = n0;
bsize = 100;
eta = 1/2 * ((2 * alpha / (k - 1)) ^ (-2 / (n1 - 1)) - 1);
h2 = 2 * eta * (n1 - 1);

%X = genSample(n1, mu, sigma);
X = X0;
Xbar = mean(X);
S2_i = zeros(1, k);
Ni = zeros(1, k);
for i = 1 : k
    S2_i = var(X(:,i) * ones(1, k) - X);
    Ni(i) = max(floor(h2 * S2_i / delta^2));
end
max_N = max(Ni);

r = n1;
n = ones(1, k) * r;
if n1 > max(Ni)
    [max_x, max_i] = max(Xbar);
end

if_cont = ones(1, k);
idx = 1:k;
while 1
    num_cont = length(idx);
    idx_del = false(1, num_cont);
    for it = 1 : num_cont
        i = idx(it);
        S2_i = var(X(:,i) * ones(1, num_cont) - X(:, idx));
        W_i = max(0, delta / 2 / r * (h2 * S2_i / delta^2 - r));
        if Xbar(i) < max(Xbar(idx) - W_i)
            idx_del(it) = true;
        end
    end
    idx(idx_del) = [];
    if length(idx) < 2
        max_i = idx;
        sum(n);
        break;
    end
    
    Xbar(idx) = (Xbar(idx) * r + genSample(1, mu(idx) * bsize, sigma(idx)*sqrt(bsize)) ) / (r + bsize);
    %Xbar(idx) = (Xbar(idx) * r + genSample(1, mu(idx) * bsize, sigma(idx)* 0 ) ) / (r + bsize);
    n(idx) = n(idx) + bsize;
    r = r + bsize;
    
    if r >= max_N
        [max_x, max_i] = max(Xbar(idx));
        max_i = idx(max_i);
        sum(n);
    end
end

%% memroy k^2, dumped
% n1 = 20;
% bsize = 100;
% eta = 1/2 * ((2 * alpha / (k - 1)) ^ (-2 / (n1 - 1)) - 1);
% h2 = 2 * eta * (n1 - 1);
% 
% X = genSample(n1, mu, sigma);
% Xbar = mean(X);
% S2 = zeros(k, k);
% for i = 1 : k
%     S2(i, :) = var(X - X(:, i) * ones(1, k) );
% end
% Ni = max(floor(h2 * S2 / delta^2));
% 
% r = n1;
% n = ones(1, k) * r;
% if n1 > max(Ni)
%     [max_x, max_i] = max(Xbar);
% end
% 
% if_elim = zeros(1, k);
% 
% while 1
%     W = max(0, delta / 2 / r * (h2 * S2 / delta^2 - r));
%     Xbar_diff = Xbar' * ones(1, k) - ones(k, 1) * Xbar;
%     if_elim = (( (Xbar_diff < -W) * (1-if_elim') ) ~= 0)' | if_elim;
%     if sum(~if_elim) < 2
%         break;
%     end
%     
%     Xbar(~if_elim) = (Xbar(~if_elim) * r + genSample(1, mu(~if_elim), sigma(~if_elim)/sqrt(bsize)) * bsize ) / (r + bsize);
%     n(~if_elim) = n(~if_elim) + bsize;
%     r = r + bsize;
% end
% max_i = find(~if_elim)
% sum(n)
