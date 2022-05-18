%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% OOFOs Participant Return Script %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1). This script will plot the day by day MVPA data from the activity monitor
% excel sheet.

% 2). This script will extract both the average MVPA per day and total
% weekly minutes of MVPA and print them out for easy access. 

close all
clear all
clc

%%%%%% Input Subject Identifiers %%%%%%%%

prompt = 'Enter Subject ID e.g. OP3_S#_V#';
subject_id = input(prompt,'s');

%%%%%% Extract Metrics %%%%%%%%%%%

mvpa_data = uigetfile(('*.xlsx'), 'Choose a File');
mvpa_data = xlsread(mvpa_data,'Detailed Daily');
three_day_mvpa = mvpa_data(1:3,5);
average_daily_mvpa = mvpa_data(13,5)
total_weekly_mvpa = mvpa_data(13,6)

%%%%% Plotting Three Day MVPA %%%%%%%

X = categorical({'Day 1','Day 2','Day 3'});
X = reordercats(X,{'Day 1','Day 2','Day 3'});
figure(1);
plot_week_mvpa = bar(X,three_day_mvpa, 0.6,'y');
ax = gca;
ax.FontSize = 12; 
title('Three Day MVPA Breakdown','FontSize',16);
ylabel('MVPA in Minutes','fontweight','bold','FontSize',14);
xlabel('Days','fontweight','bold','FontSize', 14);
box on
saveas(plot_week_mvpa,sprintf(append(subject_id,'_Three_Day_MVPA.jpg')))

%%%%%%%%%%%%%%%%%%%%% END %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



