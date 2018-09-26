n1 = 20;
bsize = 100;
eta = 1/2 * ((2 * alpha / (k - 1)) ^ (-2 / (n1 - 1)) - 1);
h2 = 2 * eta * (n1 - 1);

X = genSample(n1, mu, sigma);
Xbar = mean(X);
Ni = zeros(1, k);
var_i = var(X);
for i = 1 : k
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
        S2_i = var_i(i) + var_i(idx);
        S2_i(it) = 0;
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
