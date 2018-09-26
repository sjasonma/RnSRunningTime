function sys_x = TP_idx2sys(RB, idx)
rr = RB * 2 - 3;
n = floor((idx-1) / (RB-1)) + 1;
sys_x(3) = ceil((rr - sqrt(rr^2 - 8*n)) / 2);
sys_x(4) = RB - 1 + (n - (rr-sys_x(3)) * sys_x(3) / 2) - sys_x(3);
sys_x(5) = RB - sys_x(3) - sys_x(4);

sys_x(1) = mod(idx-1, RB-1) + 1;
sys_x(2) = RB - sys_x(1);