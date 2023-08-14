% First, create the fuzzy inference system, specifying its name.
fis = mamfis('Name', 'tipper');
% Add the first input variable for the service quality
fis = addInput(fis,[0 10], 'Name', 'service');
% Add membership functions for each of the service quality levels
fis = addMF(fis, 'service','gaussmf',[1.5 0], 'Name', 'poor');
fis = addMF(fis, 'service', 'gaussmf',[1.5 5], 'Name', 'good');
fis = addMF(fis, 'service','gaussmf',[1.5 10], 'Name', 'excellent');
% Add the second input variable for the food quality
fis = addInput(fis, [0 10], 'Name', 'food');
fis = addMF(fis,'food', 'trapmf',[-2 0 1 3], 'Name', 'rancid');
fis = addMF(fis,'food', 'trapmf',[7 9 10 12], 'Name', 'delicious');
% Add the output variable for the tip and add three triangular MFs
fis = addOutput(fis, [0 30], 'Name', 'tip');
fis = addMF(fis,'tip', 'trimf',[0 5 10], 'Name', 'cheap');
fis = addMF(fis,'tip', 'trimf',[10 15 20], 'Name', 'average');
fis = addMF(fis,'tip', 'trimf',[20 25 30], 'Name', 'generous');
% Specify the three rules
rule1 = "If service is poor or food is rancid then tip is cheap";
rule2 = "If service is good then tip is average";
rule3 = "If service is excellent or food is delicious then tip is generous";
rules = [rule1 rule2 rule3];
fis = addRule(fis, rules);

% Evaluate output
result = evalfis(fis, [2, 3]);

N = 100;
times = zeros(N, 1);

for i = 1:N
  tic;
  evalfis(fis, [2, 3]);
  times(i) = toc;
end

min(times)
mean(times)
max(times)