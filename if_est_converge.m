% funcHandles
% k = 10;
% Mu = randn(1, k) * 0.1;
% Mu = Mu - max(Mu) + 1;
Mu = ones(1, k);
% Sigma = ones(size(Mu))*2;

n0 = 1e6;
l_end = floor(n0 / 2 + 1);
% l_end = 1;
x0 = (1 ./ sqrt(1:n0))';
X0 = genSample(n0, Mu, Sigma);
Xbar = cumsum(X0) ./ repmat((1:n0)', [1, k]);
y0 = max(Xbar')';
x = x0(l_end:n0);
y = y0(l_end:n0);
b = lscov([ones(1, (n0-l_end+1))', x], y);
plot(x, y, '.')
% plot(y0, '.')
b
max(Xbar(n0,:))