[max_mu, max_i] = max(mu);
max_mu2 = max(mu([1:(max_i-1), (max_i+1):end]));
mu(max_i) = max(max_mu, max_mu2 + delta);

n1 = n0;
bsize = 100;
c = 1 - (1-alpha)^(1/(k-1));

idx = 1:k;
%W = genSample(1, mu*n1, 0);
W = sum(X0);
S2 = sigma.^2;

t = 1;
n = ones(1, k) * n1;

if_cont = true(1, k);
P = 1 - alpha;
beta = sum(n(if_cont)) / sum(S2(if_cont));
q(if_cont) = exp(delta * beta * W(if_cont) ./ n(if_cont));
q(if_cont) = q(if_cont) / sum(q(if_cont));


while max(q(if_cont)) < P
    % min_i is the smallest in q(if_cont) not q!
    [min_x, min_i] = min(q(if_cont));
    while min(q(if_cont)) <= c
        P = P / (1 - min_x);
        if_cont(idx(min_i)) = 0;
        idx(min_i) = [];
        [min_x, min_i] = min(q(if_cont));
    end
    [min_z, min_zi] = min(n(if_cont) ./  S2(if_cont));
    n_add = max((ceil(S2(if_cont).*(n(idx(min_zi))+bsize) / S2(idx(min_zi))) - n(if_cont)), 0);
    W_add = genSample(1, mu(if_cont).*n_add, 0);
    
    n_total = n(if_cont) + n_add;
    
    W(if_cont) = W(if_cont) + W_add;
    n(if_cont) = n_total;
    
    beta = sum(n(if_cont)) / sum(S2(if_cont));
    q(if_cont) = delta * beta * W(if_cont) ./ n(if_cont);
    q(if_cont) = q(if_cont) - min(q(if_cont));
    q(if_cont) = exp(q(if_cont));
    q(if_cont) = q(if_cont) / sum(q(if_cont));
    t = t + 1;
end
[max_q, max_i] = max(q(if_cont));
max_i = idx(max_i);
sum(n);
        