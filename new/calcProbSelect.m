function p = calcProbSelect(Xbar_i, Xbar_other, sigma2, n, delta)
ko = length(Xbar_other);
u_other = @(u) (repmat(u,[ko,1]) + delta - repmat(Xbar_other', [1,length(u)]))/sqrt(sigma2/n);
uCDF_other = @(u) normcdf(u_other(u));
prodCDF = @(u) exp(sum(log(uCDF_other(u)), 1));
uPDF = @(u) normpdf((u - Xbar_i) / sqrt(sigma2/n)) / sqrt(sigma2/n);
integrand = @(u) prodCDF(u) .* uPDF(u);
p = integral(integrand, -inf, inf);