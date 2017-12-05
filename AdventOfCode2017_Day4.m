%% Advent of code 2017
%% Day 4 - puzzle 1
clc; clearvars -except input;
% input = {};
% fprintf('Enter input in "input" please\n');
% keyboard

%for each row of input
totpossible = 0;
for i = 1:size(input,1)
    temparr = [];
    %Split into words
    temparr = strsplit(input{i,1},' ');
    %check against all previous words
    possible = 1;
    for j = 2:size(temparr,2);
        for k = 1:j-1
            if strcmp(char(temparr(1,j)),char(temparr(1,k)))
                possible = 0;
            end
        end
    end
    totpossible = totpossible + possible;
end
fprintf('Answer day4 puzzle 1: %.0f\n',totpossible);

%Day 4 - puzzle 2
%for each row of input
totpossible = 0;
for i = 1:size(input,1)
    temparr = [];
    %Split into words
    temparr = strsplit(input{i,1},' ');
    %check against all previous words
    possible = 1;
    for j = 2:size(temparr,2);
        for k = 1:j-1
           %Rahter than just comparing strings, we have to compare each
           %change of letters as well
           %if they're the same - it's not possible for sure
            if strcmp(char(temparr(1,j)),char(temparr(1,k)))
                possible = 0;
            %if they're not the same, but not the same amount of letters,
            %they cannot be anagrams - thus only look if they're the same
            %amount of letters
            elseif size(char(temparr(1,k)),2) == size(char(temparr(1,j)),2)
                %Make both k and j alphabetical - they're the same if
                %they're anagrams!
                if strcmp(sort(char(temparr(1,k))),sort(char(temparr(1,j))))
                    possible = 0;
                end
            end
        end
    end
    totpossible = totpossible + possible;
end
fprintf('Answer day4 puzzle 2: %.0f\n',totpossible);