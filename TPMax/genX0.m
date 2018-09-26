function X0 = genX0(RB, n0);
k = getNumSystems(RB);
X0 = zeros(n0, k);
for idx = 1:k
    X0(:, idx) = genSampleTPMax(RB, idx, n0);
end