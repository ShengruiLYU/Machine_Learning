
% first direct search
% generate some random points
max_runs = 10;

globalResults = zeros(3,max_runs);

tic;
for run=1:max_runs

    n = 20;
    points = (rand(2,n) - 0.5) * 2 * 100;
    evals = zeros(1,n);
    results = zeros(3,n);

    options = psoptimset ( 'CompletePoll', 'off', 'Display', 'off');

    for i=1:n
        [x, fval, exitflag, options] = patternsearch ( @Ras_vec, points(:,i), [], [],[],[], -Inf, Inf, options  );
        results(1:2,i) = x;
        results(3,i) = fval;
        evals(1,i) = options.iterations;
    end

    globalResults (1,run) = mean(evals)*n;
    globalResults (2,run) = mean(results(3,:));

    if run == 1
        figure;
        plot ( results(1,:), results(2,:), 'b+' );
        title ('Results for Ras-fun -  first sucessfull poll');
    end

end

display ( ['elapsed time: ' num2str(toc) ]);
display ( ['mean f-evals: ' num2str(mean(globalResults(1,:))) ]  );
display ( ['average f-val: ' num2str(mean(globalResults(3,:))) ]  );

% plot best points
figure;
hist ( globalResults(1,:) );
title ('Function evaluations for Ras-fun - first sucessfull poll');
pause;

options = psoptimset ( 'CompletePoll', 'on', 'Display', 'off' );

tic;
for run=1:max_runs

    for i=1:n
        [x, fval, exitflag, options] = patternsearch ( @Ras_vec, points(:,i), [], [],[],[], -Inf, Inf, options  );
        results(1:2,i) = x;
        results(3,i) = fval;
        evals(1,i) = options.iterations;
    end

    globalResults (1,run) = mean(evals)*n;
    globalResults (2,run) = mean(results(3,:));

    if run == 1
        figure;
        plot ( results(1,:), results(2,:), 'b+' );
        title ('Results for Ras-fun - complete poll');
    end

end

display ( ['elapsed time: ' num2str(toc) ]);
display ( ['mean f-evals: ' num2str(mean(globalResults(1,:))) ]  );
display ( ['average f-val: ' num2str(mean(globalResults(3,:))) ]  );

% plot best points
figure;
hist ( globalResults(1,:) );
title ('Function evaluations for Ras-fun - complete poll');
pause;

% ga

pops = 5:5:100;
j =1;
results = zeros(2,length(pops));
evals = zeros(1,length(pops));
xs = [];
tic;
for i = pops
    for runs=1:max_runs
        options = gaoptimset ( 'PopInitRange', [-20;20], 'PopulationSize', i );
        [x, fval, reason, output, pop, score] = ga(@Ras_vec, 2, options);
        results(:, j) = results(:, j) + [ i; fval ];
        evals(j) = evals(j) + output.funccount;
        xs = [ xs x' ];
    end
    j = j+1;
end

results = results / max_runs;
evals = evals / max_runs;

display ( ['elapsed time: ' num2str(toc) ]);
display ( ['mean f-evals: ' num2str( mean(evals)) ]  );
display ( ['average f-val: ' num2str( mean(results(2,:))) ]  );

figure
plot ( results(1,:), results(2,:) );
title ('Function values for Ras');
figure
plot ( results(1,:), evals );
xlabel ('population size');
title ('Function evaluations for Ras');
ylim ([0 max(evals)*1.2]);
xlabel ('population size');
figure
plotRas('contour');
hold on;
plot ( xs(1,:), xs(2,:), 'b+' );
title ('Resulting points for Ras');
hold off;

% pause;

results = zeros(4,max_runs);
tic;
for runs = 1:max_runs

    options = anneal();
    options.InitTemp = 1000;
    options.Verbosity =0;
    options.Generator =  @(x) (x+(randperm(length(x))==length(x))*randn/2);
    [x f evals] = anneal (@Ras_vec, (rand(1,2)-0.5)*40, options);
    results(:, runs) = [ x'; f; evals];

end

display ( ['elapsed time: ' num2str(toc) ]);
display ( ['mean f-evals: ' num2str( mean(results(4,:))) ]  );
display ( ['average f-val: ' num2str( mean(results(3,:))) ]  );
plot ( results(1,:), results(2,:), 'b+' );
title ('Results for Ras-fun - Simmulated Annealing');




