%% Advent of code 2017
%% Day 5 - puzzle 1
clc; clearvars -except input;
% input = [0 3 0 1 -3];

escaped = 0;
arr = input;
pos = 1;
steps = 0;
while escaped < 1
    currentpos = pos;
    currentvalue = arr(currentpos);
    pos = currentpos + currentvalue;
    arr(currentpos) = currentvalue+1;
    steps = steps+1;
    if pos > size(input,2)
        escaped = 1;
    elseif pos < 0
        escaped = 1;
    end
end
fprintf('Answer Day 5 puzzle 1: %.0f\n',steps)

%% Day 5 - puzzle 2
escaped = 0;
arr = input;
pos = 1;
steps = 0;
while escaped < 1
    currentpos = pos;
    currentvalue = arr(currentpos);
    pos = currentpos + currentvalue;
    if currentvalue < 3
        arr(currentpos) = currentvalue+1;
    else
        arr(currentpos) = currentvalue-1;
    end
    steps = steps+1;
    if pos > size(input,2)
        escaped = 1;
    elseif pos < 0
        escaped = 1;
    end
end
fprintf('Answer Day 5 puzzle 2: %.0f\n',steps)