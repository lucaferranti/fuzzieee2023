fis = mamfis('Name', 'robot_wall');

fis = addInput(fis, [0, 3], 'Name', 'rd');
fis = addMF(fis, 'rd', 'trimf', [0, 0, 1], 'Name', 'L');
fis = addMF(fis, 'rd', 'trimf', [0, 1, 2], 'Name', 'M');
fis = addMF(fis, 'rd', 'trimf', [1, 2, 3], 'Name', 'H');
fis = addMF(fis, 'rd', 'trimf', [2, 3, 3], 'Name', 'VH');

fis = addInput(fis, [0, 2], 'Name', 'dq');
fis = addMF(fis, 'dq', 'trimf', [0, 0, 2], 'Name', 'L');
fis = addMF(fis, 'dq', 'trimf', [0, 2, 2], 'Name', 'H');

fis = addInput(fis, [-450, 450], 'Name', 'o');
fis = addMF(fis, 'o', 'trimf', [-450, -450, -255], 'Name', 'HL');
fis = addMF(fis, 'o', 'trimf', [-450, -255, 0], 'Name', 'LL');
fis = addMF(fis, 'o', 'trimf', [-255, 0, 255], 'Name', 'Z');
fis = addMF(fis, 'o', 'trimf', [0, 255, 450], 'Name', 'LR');
fis = addMF(fis, 'o', 'trimf', [255, 450, 450], 'Name', 'HR');

fis = addInput(fis, [0, 1], 'Name', 'v');
fis = addMF(fis, 'v', 'trimf', [0, 0, 1], 'Name', 'L');
fis = addMF(fis, 'v', 'trimf', [0, 1, 1], 'Name', 'H');

fis = addOutput(fis, [-1, 1], 'Name', 'la');
fis = addMF(fis, 'la', 'trimf', [-1, -1, -0.75], 'Name', 'VHB');
fis = addMF(fis, 'la', 'trimf', [-1, -0.75, -0.5], 'Name', 'HB');
fis = addMF(fis, 'la', 'trimf', [-0.75, -0.5, -0.25], 'Name', 'MB');
fis = addMF(fis, 'la', 'trimf', [-0.5, -0.25, 0], 'Name', 'SB');
fis = addMF(fis, 'la', 'trimf', [-0.25, 0, 0.25], 'Name', 'Z');
fis = addMF(fis, 'la', 'trimf', [0, 0.25, 0.5], 'Name', 'SA');
fis = addMF(fis, 'la', 'trimf', [0.25, 0.5, 0.75], 'Name', 'MA');
fis = addMF(fis, 'la', 'trimf', [0.5, 0.75, 1], 'Name', 'HA');
fis = addMF(fis, 'la', 'trimf', [0.75, 1, 1], 'Name', 'VHA');

fis = addOutput(fis, [-1, 1], 'Name', 'av');
fis = addMF(fis, 'av', 'trimf', [-1, -1, -0.75], 'Name', 'VHR');
fis = addMF(fis, 'av', 'trimf', [-1, -0.75, -0.5], 'Name', 'HR');
fis = addMF(fis, 'av', 'trimf', [-0.75, -0.5, -0.25], 'Name', 'MR');
fis = addMF(fis, 'av', 'trimf', [-0.5, -0.25, 0], 'Name', 'SR');
fis = addMF(fis, 'av', 'trimf', [-0.25, 0, 0.25], 'Name', 'Z');
fis = addMF(fis, 'av', 'trimf', [0, 0.25, 0.5], 'Name', 'SL');
fis = addMF(fis, 'av', 'trimf', [0.25, 0.5, 0.75], 'Name', 'ML');
fis = addMF(fis, 'av', 'trimf', [0.5, 0.75, 1], 'Name', 'HL');
fis = addMF(fis, 'av', 'trimf', [0.75, 1, 1], 'Name', 'VHL');

rules = ["IF rd IS L AND dq IS L AND o IS LL AND v IS L THEN la IS VHB , av IS VHR (0.4610)"...
"IF rd IS L AND dq IS L AND o IS LL AND v IS H THEN la IS VHB , av IS VHR (0.4896)"...
"IF rd IS L AND dq IS L AND o IS Z AND v IS L THEN la IS Z , av IS MR (0.6664)"...
"IF rd IS L AND dq IS L AND o IS Z AND v IS H THEN la IS HB , av IS SR (0.5435)"...
"IF rd IS L AND dq IS H AND o IS LL AND v IS L THEN la IS MA , av IS HR (0.7276)"...
"IF rd IS L AND dq IS H AND o IS Z AND v IS L THEN la IS MA , av IS HL (0.4845)"...
"IF rd IS L AND dq IS H AND o IS Z AND v IS H THEN la IS HB , av IS ML (0.5023)"...
"IF rd IS L AND dq IS H AND o IS LR AND v IS H THEN la IS VHB , av IS VHL (0.7363)"...
"IF rd IS L AND dq IS H AND o IS HR AND v IS L THEN la IS VHB , av IS VHL (0.9441)"...
"IF rd IS M AND dq IS L AND o IS Z AND v IS H THEN la IS SA , av IS HR (0.3402)"...
"IF rd IS M AND dq IS L AND o IS LR AND v IS H THEN la IS Z , av IS VHL (0.4244)"...
"IF rd IS M AND dq IS L AND o IS HR AND v IS L THEN la IS SA , av IS HL (0.5472)"...
"IF rd IS M AND dq IS L AND o IS HR AND v IS H THEN la IS MB , av IS VHL (0.4369)"...
"IF rd IS M AND dq IS H AND o IS HL AND v IS L THEN la IS Z , av IS VHR (0.1770)"...
"IF rd IS M AND dq IS H AND o IS HL AND v IS H THEN la IS VHB , av IS VHR (0.4526)"...
"IF rd IS M AND dq IS H AND o IS LL AND v IS H THEN la IS SA , av IS VHR (0.2548)"...
"IF rd IS M AND dq IS H AND o IS Z AND v IS L THEN la IS HA , av IS Z (0.2084)"...
"IF rd IS M AND dq IS H AND o IS LR AND v IS L THEN la IS HA , av IS VHL (0.6242)"...
"IF rd IS M AND dq IS H AND o IS LR AND v IS H THEN la IS SA , av IS VHL (0.3779)"...
"IF rd IS M AND dq IS H AND o IS HR AND v IS L THEN la IS Z , av IS VHL (0.6931)"...
"IF rd IS M AND dq IS H AND o IS HR AND v IS H THEN la IS VHB , av IS VHL (0.7580)"...
"IF rd IS H AND dq IS L AND o IS Z AND v IS L THEN la IS HA , av IS VHR (0.5758)"...
"IF rd IS H AND dq IS L AND o IS LR AND v IS H THEN la IS SA , av IS MR (0.2513)"...
"IF rd IS H AND dq IS L AND o IS HR AND v IS L THEN la IS HA , av IS VHL (0.5471)"...
"IF rd IS H AND dq IS L AND o IS HR AND v IS H THEN la IS SA , av IS HL (0.5595)"...
"IF rd IS H AND dq IS H AND o IS HL AND v IS L THEN la IS VHB , av IS VHR (0.9999)"...
"IF rd IS H AND dq IS H AND o IS HL AND v IS H THEN la IS VHB , av IS VHR (0.9563)"...
"IF rd IS H AND dq IS H AND o IS LL AND v IS L THEN la IS HA , av IS VHR (0.9506)"...
"IF rd IS H AND dq IS H AND o IS Z AND v IS L THEN la IS HA , av IS VHR (0.4529)"...
"IF rd IS H AND dq IS H AND o IS Z AND v IS H THEN la IS SA , av IS VHR (0.2210)"...
"IF rd IS H AND dq IS H AND o IS LR AND v IS L THEN la IS HA , av IS MR (0.3612)"...
"IF rd IS H AND dq IS H AND o IS LR AND v IS H THEN la IS SA , av IS MR (0.2122)"...
"IF rd IS H AND dq IS H AND o IS HR AND v IS L THEN la IS HA , av IS HL (0.7878)"...
"IF rd IS H AND dq IS H AND o IS HR AND v IS H THEN la IS SA , av IS VHL (0.3859)"...
"IF rd IS VH AND dq IS L AND o IS LR AND v IS L THEN la IS HA , av IS VHR (0.5530)"...
"IF rd IS VH AND dq IS L AND o IS HR AND v IS L THEN la IS HA , av IS HR (0.4223)"...
"IF rd IS VH AND dq IS L AND o IS HR AND v IS H THEN la IS SA , av IS HR (0.3854)"...
"IF rd IS VH AND dq IS H AND o IS LL AND v IS L THEN la IS HA , av IS VHR (0.0936)"...
"IF rd IS VH AND dq IS H AND o IS LR AND v IS L THEN la IS HA , av IS VHR (0.7325)"...
"IF rd IS VH AND dq IS H AND o IS LR AND v IS H THEN la IS SA , av IS VHR (0.5631)"...
"IF rd IS VH AND dq IS H AND o IS HR AND v IS L THEN la IS HA , av IS HR (0.5146)"];
fis = addRule(fis, rules);

times = zeros(1, 100);

for ii = 1:100
tic;
evalfis(fis, [1.0, 1.0, 0.0, 0.5]);
times(ii) = toc;
end