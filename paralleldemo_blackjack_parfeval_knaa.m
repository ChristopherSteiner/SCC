%% Parfeval Blackjack
% This example uses Parallel Computing Toolbox(TM) to play the card game of
% blackjack, also known as 21. We simulate a number of players that are
% independently playing thousands of hands at a time, and display payoff
% statistics. This example runs the simulations asynchronously on a parallel
% pool of workers, using |parfeval|. In this way, we can update a display of the
% results as they become available.
%
% Related examples:
%
% * <paralleldemo_blackjack_seq.html Sequential Blackjack>
% * <paralleldemo_parfor_bench.html Simple Benchmarking of PARFOR Using
% Blackjack>

% Copyright 2013 The MathWorks, Inc.

%%
% You can find the code shown in this example in the function:
function paralleldemo_blackjack_parfeval_knaa

%% Analyze the sequential problem
% Because the blackjack players are independent of one another, we can simulate
% them in parallel.  We do this by dividing the problem up into a number of
% function evaluations.  We run a maximum of |numPlayers| simulations,
% where each player plays |numHands| hands of blackjack. We plot the
% results as soon as they become available, and we terminate the simulation
% if the elapsed time exceeds |maxSimulationTime| seconds, or if the user
% cancels execution.
numPlayers        = 200;   %RK
numHands          = 5000;  %RK
maxSimulationTime = 30;    %RK

%% Divide the work into individual function evaluations
% We call the |parfeval| function to request evaluation of the simulation on the
% parallel pool workers. The parallel pool will be created automatically if
% necessary. The |parfeval| function returns a |parallel.Future| object, which
% we use to access results when they become available. You can
% <matlab:edit('pctdemo_task_blackjack.m') view the code for
% |pctdemo_task_blackjack|> for full details.

for idx = numPlayers:-1:1
    futures(idx) = parfeval(@pctdemo_task_blackjack, 1, numHands, 1);
end
% Create an onCleanup to ensure we do not leave any futures running when we exit
% this example.
cancelFutures = onCleanup(@() cancel(futures));

%% Set up for collecting results and monitoring progress
% The parallel pool workers immediately start running |pctdemo_task_blackjack|,
% and we can collect and display results as soon as they are available by using
% the |fetchNext| method. We use |resultsSoFar| to accumulate results. We update
% the array |completed| to indicate which elements of |futures| have completed,
% and increment the counter |numCompleted|. We supply the optional argument
% |timeout| to the |fetchNext| method so that it returns quickly if no new
% results are available.
resultsSoFar = zeros(numHands, numPlayers); % Allocate space for all results
completed    = false(1, numPlayers);        % Has a given future completed yet
timeout      = 2;                           % fetchNext timeout in seconds
numCompleted = 0;                           % How many simulations have completed
fig          = pctdemo_setup_blackjack(1);  % Create a figure to display results

% Build a waitbar with a cancel button, using appdata to track
% whether the cancel button has been pressed.
hWaitBar = waitbar(0, 'Blackjack progress', 'CreateCancelBtn', ...
                   @(src, event) setappdata(gcbf(), 'Cancelled', true));
setappdata(hWaitBar, 'Cancelled', false);

%% Collect and display results as they become available
% We collect and display results by calling |fetchNext| in a loop until we have
% seen |numPlayers| results. When |fetchNext| returns new results, we assign the
% results into |resultsSoFar|, update the |completed| array and the
% |numCompleted| counter, and update the plot. We abort the loop early if the
% user presses the cancel button on the waitbar, or the |maxSimulationTime|
% expires.
startTime = clock();
while numCompleted < numPlayers

    % fetchNext blocks execution until one element of futures has completed.  It
    % then returns the index into futures of the element that has now completed,
    % and the results from execution.
    [completedIdx, resultThisTime] = fetchNext(futures, timeout);

    % If fetchNext timed out returning an empty completedIdx, do not attempt to
    % process results.
    if ~isempty(completedIdx)
        numCompleted = numCompleted + 1;
        % Update list of completed futures.
        completed(completedIdx) = true;
        % Fill out portion of results.
        resultsSoFar(:, completedIdx) = resultThisTime;
        % Update plot.
        pctdemo_plot_blackjack(fig, resultsSoFar(:, completed), false);
    end

    % Check to see if we have run out of time.
    timeElapsed = etime(clock(), startTime);
%RK     if timeElapsed > maxSimulationTime
%RK         fprintf('Simulation terminating: maxSimulationTime exceeded.\n');
%RK         break;
%RK     end

    % Check to see if the cancel button was pressed.
    if getappdata(hWaitBar, 'Cancelled')
        fprintf('Simulation cancelled.\n');
        break;
    end

    % Update the waitbar.
    fractionTimeElapsed      = timeElapsed / maxSimulationTime;
    fractionPlayersCompleted = numCompleted / numPlayers;
    fractionComplete         = max(fractionTimeElapsed, fractionPlayersCompleted);
    waitbar(fractionComplete, hWaitBar);
end

fprintf('Elapsed time is %2.1f seconds\n', timeElapsed);
fprintf('Number of simulations completed: %d\n', numCompleted);

% Now the simulation is complete, we can cancel the futures and delete
% the waitbar.
cancel(futures);
delete(hWaitBar);

displayEndOfDemoMessage(mfilename)
end
