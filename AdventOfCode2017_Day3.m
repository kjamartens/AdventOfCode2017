%% Advent of code 2017
%% Day 3 - puzzle 1
clc; clear all;
%Idea: Make input array based on size of next square
input = 368078;
squaresize = ceil(sqrt(input));
if mod(squaresize,2) == 0
    squaresize = squaresize+1;
end
arr = zeros(squaresize,squaresize);
%Now that the array is made, lets fill it in
arr((squaresize-1)/2+1,(squaresize-1)/2+1) = 1;
posx = 0;
posy = 0;
for i = 1:(squaresize-1)/2
    %'starting positions'
    center = (squaresize-1)/2+1;
    posx = center + i;
    posy = center + (i-1);
    %Loop over each point and set the number
    sqsize = (i*2+1)^2;
    prevsqsize = ((i-1)*2+1)^2;
    startpos = prevsqsize + 1;
    endpos = sqsize;
    id = 1;
    for k = startpos:endpos
        arr(posx,posy) = k;
        if (id+1)/(sqrt(sqsize)-1) <= 1
            dx = 0;
            dy = -1;
        elseif (id+1)/(sqrt(sqsize)-1) <= 2
            dx = -1;
            dy = 0;
        elseif (id+1)/(sqrt(sqsize)-1) <= 3
            dx = 0;
            dy = 1;
        else
            dx = 1;
            dy = 0;
        end
        posx = posx+dx;
        posy = posy+dy;
        id = id+1;
    end
end
%rotate array because fuck matlab
arr = arr';

[inputr inputc] = find(arr == input);
centerr = (squaresize-1)/2+1;
centerc = centerr;
totaldiff = abs(inputr-centerr)+abs(inputc-centerc);
fprintf('Puzzle 1: %.0f\n',totaldiff);

%% Day 3 - puzzle 2
clc; clear all;
%Idea: Make same array, but change filled in nr to sum of neighbours
%This input value is previous size of array
input = 200;
squaresize = ceil(sqrt(input));
if mod(squaresize,2) == 0
    squaresize = squaresize+1;
end
arr = zeros(squaresize,squaresize);
%Now that the array is made, lets fill it in
arr((squaresize-1)/2+1,(squaresize-1)/2+1) = 1;
posx = 0;
posy = 0;
for i = 1:(squaresize-1)/2-1
    %'starting positions'
    center = (squaresize-1)/2+1;
    posx = center + i;
    posy = center + (i-1);
    %Loop over each point and set the number
    sqsize = (i*2+1)^2;
    prevsqsize = ((i-1)*2+1)^2;
    startpos = prevsqsize + 1;
    endpos = sqsize;
    id = 1;
    for k = startpos:endpos
        totsum = 0;
        totsum = totsum + arr(posx-1,posy-1);
        totsum = totsum + arr(posx,posy-1);
        totsum = totsum + arr(posx+1,posy-1);
        totsum = totsum + arr(posx-1,posy);
        totsum = totsum + arr(posx,posy);
        totsum = totsum + arr(posx+1,posy);
        totsum = totsum + arr(posx-1,posy+1);
        totsum = totsum + arr(posx,posy+1);
        totsum = totsum + arr(posx+1,posy+1);
        arr(posx,posy) = totsum;
        if totsum > 368078
            fprintf('Puzzle 2: %.0f\n',arr(posx,posy));
            break;
        end
        if (id+1)/(sqrt(sqsize)-1) <= 1
            dx = 0;
            dy = -1;
        elseif (id+1)/(sqrt(sqsize)-1) <= 2
            dx = -1;
            dy = 0;
        elseif (id+1)/(sqrt(sqsize)-1) <= 3
            dx = 0;
            dy = 1;
        else
            dx = 1;
            dy = 0;
        end
        posx = posx+dx;
        posy = posy+dy;
        id = id+1;
    end
end
%rotate array because fuck matlab
arr = arr';

[inputr inputc] = find(arr == input);
centerr = (squaresize-1)/2+1;
centerc = centerr;
totaldiff = abs(inputr-centerr)+abs(inputc-centerc);