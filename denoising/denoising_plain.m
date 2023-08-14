

N = 1000;
times = zeros(1, N);
for ii = 1:N
    tic;
    y = russo(rand(1, 8));
    times(ii) = toc;
end

function Y = russo(x)
y = trimf(x, [-255, 255, 765]);
% 13 conjunctive premises
L1 = max([min([y(2), y(5), y(7)]);
    min([y(5), y(7), y(4)]);
    min([y(7), y(4), y(2)]);
    min([y(4), y(2), y(5)]);
    min([y(1), y(3), y(8), y(6)]);
    min([y(1), y(2), y(3), y(5)]);
    min([y(2), y(3), y(5), y(8)]);
    min([y(3), y(5), y(8), y(7)]);
    min([y(5), y(8), y(7), y(6)]);
    min([y(8), y(7), y(6), y(4)]);
    min([y(7), y(6), y(4), y(1)]);
    min([y(6), y(4), y(1), y(2)]);
    min([y(4), y(1), y(2), y(3)]);
    ]);

y = trimf(x, [-765, -255, 255]);

L2 = max([min([y(2), y(5), y(7)]);
    min([y(5), y(7), y(4)]);
    min([y(7), y(4), y(2)]);
    min([y(4), y(2), y(5)]);
    min([y(1), y(3), y(8), y(6)]);
    min([y(1), y(2), y(3), y(5)]);
    min([y(2), y(3), y(5), y(8)]);
    min([y(3), y(5), y(8), y(7)]);
    min([y(5), y(8), y(7), y(6)]);
    min([y(8), y(7), y(6), y(4)]);
    min([y(7), y(6), y(4), y(1)]);
    min([y(6), y(4), y(1), y(2)]);
    min([y(4), y(1), y(2), y(3)]);
    ]);
L0 = max(0, 1 - L1 - L2);
Y = 255*(L1-L2)/(L1 + L2 + L0);
end
