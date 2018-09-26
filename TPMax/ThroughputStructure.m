function [minmax d m VarNature VarBds FnGradAvail NumConstraintGradAvail, StartingSol, budget, ObjBd, OptimalSol] = ThroughputStructure(NumStartingSol, seed)
%function [minmax d m VarNature VarBds FnGradAvail NumConstraintGradAvail, StartingSol] = ThroughputStructure(NumStartingSol, seed);
% Inputs:
%	a) NumStartingSol: Number of starting solutions required. Integer, >= 0
%	b) seed: Seed for generating random starting solutions. Integer, >= 1
% Return structural information on optimization problem
%     a) minmax: -1 to minimize objective , +1 to maximize objective
%     b) d: positive integer giving the dimension d of the domain
%     c) m: nonnegative integer giving the number of constraints. All
%        constraints must be inequality constraints of the form LHS >= 0.
%        If problem is unconstrained (beyond variable bounds) then should be 0.
%     d) VarNature: a d-dimensional column vector indicating the nature of
%        each variable - real (0), integer (1), or categorical (2).
%     e) VarBds: A d-by-2 matrix, the ith row of which gives lower and
%        upper bounds on the ith variable, which can be -inf, +inf or any
%        real number for real or integer variables. Categorical variables
%        are assumed to take integer values including the lower and upper
%        bound endpoints. Thus, for 3 categories, the lower and upper
%        bounds could be 1,3 or 2, 4, etc.
%     f) FnGradAvail: Equals 1 if gradient of function values are
%        available, and 0 otherwise.
%     g) NumConstraintGradAvail: Gives the number of constraints for which
%        gradients of the LHS values are available. If positive, then those
%        constraints come first in the vector of constraints.
%     h) StartingSol: One starting solution in each row, or NaN if NumStartingSol=0.
%        Solutions generated as per problem writeup
%     i) budget: Column vector of suggested budgets, or NaN if none suggested
%     j) ObjBd is a bound (upper bound for maximization problems, lower
%        bound for minimization problems) on the optimal solution value, or
%        NaN if no such bound is known.
%     k) OptimalSol is a d dimensional column vector giving an optimal
%        solution if known, and it equals NaN if no optimal solution is known.

%   ***************************************
%   *** Written by Shane Henderson to   ***
%   *** use standard calling and random ***
%   *** number streams                  ***
%   *** Values updated by Victor Wu     ***
%   *** Edited by Bryan Chong           ***
%   ***************************************
% Last updated November 19, 2014

% Moderate-sized problem
%numStations=3;
%B=20; R=20;

% Larger problem
numStations = 12;
B=80; R=80;

remBuff=mod(B,numStations-1); remServ=mod(R,numStations);
servInt=0; % Set to 0 for continuous service rates, 1 for integral

minmax = 1; % maximize throughput (-1 for minimize)
d = 2*numStations - 1; % one buffer variable for each station other than the first, one service rate variable for each buffer
m = 2; % constraints on total buffer allocation, and sum of service rates
VarNature = ones(d,1); % integer variables
VarBds = [ones(numStations-1,1)*[0,B]; ones(numStations,1)*[0,R]];
FnGradAvail = 1; % Derivative is computed
NumConstraintGradAvail = 0; 
budget = [3000; 9000; 15000];
ObjBd=NaN;
%moderate problem:
%OptimalSol= [12 8 6 6 7]
%larger problem:
OptimalSol=NaN;

if (NumStartingSol < 0) || (NumStartingSol ~= round(NumStartingSol)) || (seed <= 0) || (round(seed) ~= seed),
    fprintf('NumStartingSol should be integer >= 0, seed must be a positive integer\n');
    StartingSol = NaN;
elseif (servInt == 1 && numStations > R)
    fprintf('Cannot have integral service rates if total number of stations is greater than R\n');
    StartingSol = NaN;
else
    if (NumStartingSol == 0),
        StartingSol = NaN;
    elseif (NumStartingSol == 1),
        BufferSizes = floor(B/(numStations-1))*ones(1,numStations-1) + [zeros(1,numStations-1-remBuff) ones(1,remBuff)];
        if servInt == 0
            ServiceRates = R/numStations*ones(1,numStations);
        else
            ServiceRates = floor(R/numStations)*ones(1,numStations) + [zeros(1,numStations-remServ) ones(1,remServ)];
        end
        StartingSol = [BufferSizes ServiceRates];
    else
        [BufferStream, ServiceStream] = RandStream.create('mlfg6331_64', 'NumStreams', 2); % Use a different generator from simulation code to avoid stream clashes
        BufferStream.Substream = seed;
        ServiceStream.Substream = seed;
        OldStream = RandStream.setGlobalStream(BufferStream); % Temporarily store old stream
        
        % Generate random buffer sizes
        BuffRnd = unidrnd(B, NumStartingSol, numStations-2);
        BuffRnd = sort(BuffRnd, 2);
        buffU_j = [BuffRnd, B*ones(NumStartingSol, 1)];
        buffU_k = [zeros(NumStartingSol, 1), BuffRnd];
        BufferSizes = buffU_j - buffU_k;
        
        % Generate random service times
        RandStream.setGlobalStream(ServiceStream);
        if servInt == 0
            ServRnd = unifrnd(0, R, NumStartingSol, numStations-1);
            ServRnd = sort(ServRnd, 2);
            servU_j = [ServRnd, R*ones(NumStartingSol, 1)];
            servU_k = [zeros(NumStartingSol, 1), ServRnd];
        else
            ServRnd = unidrnd(R-numStations, NumStartingSol, numStations-1);
            ServRnd = sort(ServRnd, 2);
            size(ServRnd)
            servU_j = [ServRnd, (R-numStations)*ones(NumStartingSol, 1)]+1;
            servU_k = [zeros(NumStartingSol, 1), ServRnd];
        end
        ServiceRates = servU_j - servU_k;
        
        StartingSol = [BufferSizes ServiceRates];
        RandStream.setGlobalStream(OldStream); % Restore previous stream
    end %if NumStartingSol
end %if inputs ok