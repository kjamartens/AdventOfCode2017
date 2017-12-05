%% Advent of code 2017
%% Day 2 - puzzle 1
%Assuming array called 'arr' is filled in!
clearvars -except arr; clc;
%For each row, check the max and min
%for each row
totdiff = 0;
for r = 1:size(arr,1);
    minv = min(arr(r,:));
    maxv = max(arr(r,:));
    totdiff = totdiff + (maxv-minv);
end
fprintf('Checksum puzzle 1 is %.0f!\n',totdiff);

%% Day 2 - puzzle 2

checksum = 0;
for r = 1:size(arr,1);
    for c = 1:size(arr,2)
        %Check each number in each row versus each other number in that row
        for cc = 1:size(arr,2)
            %don't check if they're the same number
            if c ~= cc
                %If fully divisible
                if mod(arr(r,c),arr(r,cc)) == 0
                    fprintf('Row %.0f done\n',r)
                    checksum = checksum + (arr(r,c)/arr(r,cc));
                end
            end
        end
    end
end
fprintf('Checksum puzzle 2 is %.0f!\n',checksum);