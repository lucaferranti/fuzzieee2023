clear all, close all, clc
c = 255;
w = 510;

LLim = -1000;
ULim = abs(LLim);

% Define the FIS
% First, create the fuzzy inference system, specifying its name.
fis = mamfis('Name', 'FISActionDetection');
% Add input variable
fis = addInput(fis,[LLim ULim], 'Name', 'x1');
fis = addInput(fis,[LLim ULim], 'Name', 'x2');
fis = addInput(fis,[LLim ULim], 'Name', 'x3');
fis = addInput(fis,[LLim ULim], 'Name', 'x4');
fis = addInput(fis,[LLim ULim], 'Name', 'x5');
fis = addInput(fis,[LLim ULim], 'Name', 'x6');
fis = addInput(fis,[LLim ULim], 'Name', 'x7');
fis = addInput(fis,[LLim ULim], 'Name', 'x8');
fis = addMF(fis,'x1', 'trimf',[c-w c c+w], 'Name', 'POS');
fis = addMF(fis,'x1', 'trimf',[-c-w -c -c+w], 'Name', 'NEG');
fis = addMF(fis,'x2', 'trimf',[c-w c c+w], 'Name', 'POS');
fis = addMF(fis,'x2', 'trimf',[-c-w -c -c+w], 'Name', 'NEG');
fis = addMF(fis,'x3', 'trimf',[c-w c c+w], 'Name', 'POS');
fis = addMF(fis,'x3', 'trimf',[-c-w -c -c+w], 'Name', 'NEG');
fis = addMF(fis,'x4', 'trimf',[c-w c c+w], 'Name', 'POS');
fis = addMF(fis,'x4', 'trimf',[-c-w -c -c+w], 'Name', 'NEG');
fis = addMF(fis,'x5', 'trimf',[c-w c c+w], 'Name', 'POS');
fis = addMF(fis,'x5', 'trimf',[-c-w -c -c+w], 'Name', 'NEG');
fis = addMF(fis,'x6', 'trimf',[c-w c c+w], 'Name', 'POS');
fis = addMF(fis,'x6', 'trimf',[-c-w -c -c+w], 'Name', 'NEG');
fis = addMF(fis,'x7', 'trimf',[c-w c c+w], 'Name', 'POS');
fis = addMF(fis,'x7', 'trimf',[-c-w -c -c+w], 'Name', 'NEG');
fis = addMF(fis,'x8', 'trimf',[c-w c c+w], 'Name', 'POS');
fis = addMF(fis,'x8', 'trimf',[-c-w -c -c+w], 'Name', 'NEG');

x = (LLim:1:ULim)';
y1 = trimf(x, [-c-w -c -c+w]); %neg

% Add output variable
fis = addOutput(fis, [LLim ULim], 'Name', 'y');
fis = addMF(fis, 'y', 'trimf',[c-w c c+w], 'Name', 'PO');
fis = addMF(fis, 'y', 'trimf',[-c-w -c -c+w], 'Name', 'NE');

% figure;
% plotmf(fis,'output',1);
% figure;
% plotmf(fis,'input',1);

% Specify the rules
r1 = 'IF x2 IS POS AND x5 IS POS AND x7 IS POS THEN y IS PO';
r2 = 'IF x5 IS POS AND x7 IS POS AND x4 IS POS THEN y IS PO';
r3 = 'IF x7 IS POS AND x4 IS POS AND x2 IS POS THEN y IS PO';
r4 = 'IF x4 IS POS AND x2 IS POS AND x5 IS POS THEN y IS PO';
r5 = 'IF x1 IS POS AND x3 IS POS AND x8 IS POS AND x6 IS POS THEN y IS PO';
r6 = 'IF x1 IS POS AND x2 IS POS AND x3 IS POS AND x5 IS POS THEN y IS PO';
r7 = 'IF x2 IS POS AND x3 IS POS AND x5 IS POS AND x8 IS POS THEN y IS PO';
r8 = 'IF x3 IS POS AND x5 IS POS AND x8 IS POS AND x7 IS POS THEN y IS PO';
r9 = 'IF x5 IS POS AND x8 IS POS AND x7 IS POS AND x6 IS POS THEN y IS PO';
r10 = 'IF x8 IS POS AND x7 IS POS AND x6 IS POS AND x4 IS POS THEN y IS PO';
r11 = 'IF x7 IS POS AND x6 IS POS AND x4 IS POS AND x1 IS POS THEN y IS PO';
r12 = 'IF x6 IS POS AND x4 IS POS AND x1 IS POS AND x2 IS POS THEN y IS PO';
r13 = 'IF x4 IS POS AND x1 IS POS AND x2 IS POS AND x3 IS POS THEN y IS PO';
r14 = 'IF x2 IS NEG AND x5 IS NEG AND x7 IS NEG THEN y IS NE';
r15 = 'IF x5 IS NEG AND x7 IS NEG AND x4 IS NEG THEN y IS NE';
r16 = 'IF x7 IS NEG AND x4 IS NEG AND x2 IS NEG THEN y IS NE';
r17 = 'IF x4 IS NEG AND x2 IS NEG AND x5 IS NEG THEN y IS NE';
r18 = 'IF x1 IS NEG AND x3 IS NEG AND x8 IS NEG AND x6 IS NEG THEN y IS NE';
r19 = 'IF x1 IS NEG AND x2 IS NEG AND x3 IS NEG AND x5 IS NEG THEN y IS NE';
r20 = 'IF x2 IS NEG AND x3 IS NEG AND x5 IS NEG AND x8 IS NEG THEN y IS NE';
r21 = 'IF x3 IS NEG AND x5 IS NEG AND x8 IS NEG AND x7 IS NEG THEN y IS NE';
r22 = 'IF x5 IS NEG AND x8 IS NEG AND x7 IS NEG AND x6 IS NEG THEN y IS NE';
r23 = 'IF x8 IS NEG AND x7 IS NEG AND x6 IS NEG AND x4 IS NEG THEN y IS NE';
r24 = 'IF x7 IS NEG AND x6 IS NEG AND x4 IS NEG AND x1 IS NEG THEN y IS NE';
r25 = 'IF x6 IS NEG AND x4 IS NEG AND x1 IS NEG AND x2 IS NEG THEN y IS NE';
r26 = 'IF x4 IS NEG AND x1 IS NEG AND x2 IS NEG AND x3 IS NEG THEN y IS NE';
ruleList = char(r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21,r22,r23,r24,r25,r26);

fis = addRule(fis, ruleList);
fis = convertToSugeno(fis);
N = 10000;
times = zeros(1, N);
for ii = 1:N
    tic;
    [~,~,~,~,ruleFiring] = evalfis(fis, rand(1, 8));

    L1 = max(ruleFiring(1:13,1));
    L2 = max(ruleFiring(14:end,1));
    L0 = max(0, 1-L1-L2);

    y = (255*(L1-L2))/(L1+L2+L0);
    times(ii) = toc;
end

median(times)