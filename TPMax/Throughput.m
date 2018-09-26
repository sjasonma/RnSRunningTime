function [fn, FnVar, FnGrad, FnGradCov, constraint, ConstraintCov, ConstraintGrad, ConstraintGradCov] = Throughput(x, runlength, seed, ~)
% function [fn, FnVar, FnGrad, FnGradCov, constraint, ConstraintCov, ConstraintGrad, ConstraintGradCov] = Throughput(x, runlength, seed, other);

% x is a row vector containing the buffer sizes (nstages-1 of them) and
% followed by the service rates (nstages of them).
% runlength is the number of replications to simulate
% seed is the index of the substreams to use (integer >= 1)
% other is a vector of buffer spaces before stage i (1-by-(n-1))
% Returns Mean response time with var estimates.

%   ***************************************
%   *** Code written by German Gutierrez***
%   ***         gg92@cornell.edu        ***
%   ***        Updated by Eric Ni       ***
%   ***         cn254@cornell.edu       ***
%   ***     Updated by Bryan Chong      ***
%   ***         bhc34@cornell.edu       ***
%   ***************************************
% Last Updated November 19, 2014

%Returns throughput as defined in problem statement, Mean and C.I. Half
%Width of the time between the last $count$ jobs releases.
FnGrad = NaN;
FnGradCov = NaN;

ConstraintGrad = NaN;
ConstraintGradCov = NaN;

if (sum(x < 0) > 0) || (runlength <= 0) || (seed <= 0) || (round(seed) ~= seed),
    fprintf('x should have nonnegative components,\nrunlength and seed should be a positive integers\n');
    fn = NaN;
    FnVar = NaN;
    constraint = NaN;
    ConstraintCov = NaN;
else % main simulation
    % Moderate-sized problem
    numStations=3;
    B=20; R=20;

    % Larger problem
%     numStations = 12;
%     B=80; R=80;
    
    nstages = (length(x)+1)/2; % Number of stages
    b=[inf x(1:nstages-1)]; % Buffer sizes
    r=x(nstages:length(x)); %Service Rates
    warmup=2000;            % Number of jobs for warming-up
    count=50;               % Number of jobs to count
    njobs=warmup + count;             %Number of jobs to be released in simulation
    tput = zeros(runlength, 1); % throughput for each replication
    
    constraint = [B-sum(b(2:nstages)) R-sum(r)];
    ConstraintCov = zeros(2,2);
    % Generate new streams for call arrivals, call
    ServiceStream = RandStream.create('mrg32k3a');

    ServiceStream.Substream = seed; % Set the substream to the "seed"
    OldStream = RandStream.setGlobalStream(ServiceStream); % Temporarily store old stream
    
    %Generate matrix of service times.
    sTimes=zeros(nstages, njobs, runlength);
    for k=1:nstages
        sTimes(k,:,:)=exprnd(1/r(k), 1, njobs, runlength);
    end
    
    % Restore old random number stream
    RandStream.setGlobalStream(OldStream);
    
    
    for k = 1:runlength
        ETimes = zeros(nstages, njobs); %matrix with the time at which job j exits stage i (row i).
        
        ETimes(:,1)=sTimes(:,1,k); % No waiting in first job

        for i=2:njobs
            t=sTimes(1,i,k); % First service time for this job
            % First stage: if i-1-b(2)th job left stage 2 before current
            % job is done at stage one, there is buffer space available and
            % the job leaves stage one as soon as it is completed. Note
            % that this job is completed at time ETimes(1,i-1)+t
            if ETimes(2,max(1,i-1-b(2))) <= ETimes(1,i-1) + t
                ETimes(1,i) = ETimes(1,i-1)+t;
            else
                % There is no buffer space available, next station is
                % blocked and job leaves as soon as space is available
                ETimes(1,i) = ETimes(2,max(1,i-1-b(2)));
            end
            
            for j=2:nstages-1
                t=sTimes(j,i,k); % jth service time for this job
                % If the previous job left this station before this job
                % left the previous station, then this job is serviced
                % immediately
                if ETimes(j,i-1) < ETimes(j-1,i)
                    % Job finishes service at this station at
                    % ETimes(j-1,i)+t. If the next station has buffer
                    % space, this job leaves this station immediately.
                    if ETimes(j+1,max(1,i-1-b(j+1))) <= ETimes(j-1,i) + t
                        ETimes(j,i) = ETimes(j-1,i)+t;
                    else
                        % There is no buffer space available, next station
                        % is blocked and job leaves as soon as space is
                        % available.
                        ETimes(j,i) = ETimes(j+1,max(1,i-1-b(j+1)));
                    end
                else
                    % This job must wait for the previous job to leave this
                    % station before it can be serviced, at time
                    % ETimes(j,i-1). Service completes at ETimes(j,i-1)+t.
                    % If the next station has buffer space, this job leaves
                    % this station immediately.
                    if ETimes(j+1,max(1,i-1-b(j+1))) <= ETimes(j,i-1) + t
                        ETimes(j,i) = ETimes(j,i-1) + t;
                    else
                        % There is no buffer space available, next station
                        % is blocked and job leaves as soon as space is
                        % available.
                        ETimes(j,i) = ETimes(j+1,max(1,i-1-b(j+1)));
                    end
                end
            end
        
            t=sTimes(nstages,i,k); % Final service time for this job
            % Last stage: if the previous job left the final stage before
            % this job finished its previous stage, then this job is
            % serviced immediately and leaves at ETimes(nstages-1,i)+t
            if ETimes(nstages,i-1) < ETimes(nstages-1,i)
                ETimes(nstages,i) = ETimes(nstages-1,i)+t;
            else
                % This job must wait for the previous job to leave the
                % final station before it can be serviced, at time
                % ETimes(nstages,i-1). Service completes at
                % ETimes(nstages,i-1)+t.
                ETimes(nstages,i) = ETimes(nstages,i-1)+t;
            end
        end
        tput(k) = count/(ETimes(nstages,njobs)-ETimes(nstages,warmup));
    end
    fn = mean(tput);
    FnVar = var(tput)/runlength;
end
end
