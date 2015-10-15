%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ECE 599 Neural Networs                                       %
% Name: Arindam Bose                                           %
% UIN: 665387232                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Implementation of Character Recognition system using Hopfield Neural Network
%% Initialization
Initialization();

%% Main menu
first = true;
while first
    clc;
    disp('------------- Main Menu -------------');
	disp('1: Train network'); 
	disp('2: Test with trained exemplars');
    disp('3: Test with untrained exemplars');
    disp('4: Test with noise');
    disp('5: Generate graph for error rates');
	disp('0: Exit'); 
    ch = input('Your choice: ', 's');
    switch ch
        case '1'
            tic;
            TrainNetwork(); % Train network
            t = toc;
            disp(['Training complete in ' num2str(t) ' sec']);
        case '2'
            tic;
            TestWithExemplars('trained'); % Test with trained exemplars A, C, N
            t = toc;
            disp(['Testing trained exemplar complete in ' num2str(t) ' sec']);
        case '3'
            tic;
            TestWithExemplars('untrained'); % Test with untrained exemplars X, Y, Z
            t = toc;
            disp(['Testing untrained exemplar complete in ' num2str(t) ' sec']);
        case '4'
            n = input('Number of error bits ? ');
            RecognitionWithError(n); % Recognition with noise
        case '5'
            n = input('Number of final error bits ? ');
            GenerateGraph(n);
        case '0'
            first = false;
            disp('Exiting...');
    end
    disp('Press any key to continue...');
    pause;
end
clear all;