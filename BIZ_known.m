%% BIZ w/ known common variance 


bsize = 1;
c = 1 - (1-alpha)^(1/(k-1));
sigma2 = sigma(1)^2;

idx = 1:k;
Y = genSample(1, mu*bsize, sigma*sqrt(bsize));

t = 0;
n = zeros(1, k);

if_cont = true(1, k);
P = 1 - alpha;
q = ones(1, k) / k;

while max(q(if_cont)) < P
    % min_i is the smallest in q(if_cont) not q!
    [min_x, min_i] = min(q(if_cont));
    while min(q(if_cont)) <= c
        P = P / (1 - min_x);
        if_cont(idx(min_i)) = 0;
        idx(min_i) = [];
        [min_x, min_i] = min(q(if_cont));
    end

    Y_add = genSample(1, mu(if_cont)*bsize, sigma(if_cont)*sqrt(bsize));
    
    Y(if_cont) = Y(if_cont) + Y_add;
    n(if_cont) = n(if_cont) + bsize;
    t = t + 1;
    
    q(if_cont) = delta / sigma2 * Y(if_cont);
    q(if_cont) = q(if_cont) - min(q(if_cont));
    q(if_cont) = exp(q(if_cont));
    %q(if_cont) = q(if_cont) * exp(t*delta^2/sigma2) ./ (sum(q(if_cont)) + q(if_cont) * (exp(t*delta^2/sigma2) - 1) );
    q(if_cont) = q(if_cont) / sum(q(if_cont));
end
[max_q, max_i] = max(q(if_cont));
max_i = idx(max_i);
sum(n);
        