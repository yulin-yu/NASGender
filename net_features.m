clear;
A=readmatrix('T4_normalized_all.csv'); %'data\network_features\T4_normalized_all.csv');
xlabels=["paperCount", "citationCount",	"Mutual Edges",	"Ego Mutual Edges",	"Ego Hub Score",	"Ego Authority Score", "Average Degree", "Edge Density",	"Shortest Path",	"Clustering",	"Communities",	"Num Peers",	"Papers of Peers",	"Citations of Peers",	"Peer Gender Ratio",	"gender",	"2015Ranking",	"ElectionYear",	"new_Id",	"subject"];
% Split by gender
M=A(find(A(:,16)==0),:); % Men
F=A(find(A(:,16)==1),:); % Women

% Split by rank
% rank=100;
% M=A(find(A(:,17)>0 & A(:,17)<rank+1),:);   % High vs low rank insitutions
% F=A(find(A(:,17)>rank),:);
% 

%% Construct CDF plots
% Split by gender and field
% M=A(find(A(:,17)==0),:);% & A(:,18)>40),:); % Men, SBE fields (>40), STEM (<40)
% F=A(find(A(:,17)==1),:);% & A(:,18)>40),:);

% Create plots
t = tiledlayout(4,4);
t.Padding = 'compact';
t.TileSpacing = 'compact';
% title(t,'Prestige comparison (rank 100)')
ylabel(t,'CDF(x)');
xlabel(t,'x');
for index=3:15
    MM=M(find(M(:,index)>-1),index);
    ax1 = nexttile;
    ecdf(MM);
    %histogram(MM, 35, 'FaceColor', 'c');
    hold on
    FF=F(find(F(:,index)>-1),index);
    ecdf(FF);
    ylabel(ax1,{});
    xlabel(ax1,{});
    title(ax1, xlabels(index));
    %histogram(FF,30, 'FaceColor', 'r');
    %xlim([0 1]);
    %ylim([0 100]);
end
hold off

figure;
% Plot difference in means
Mn=zeros(size(A,2),3);
Wm=zeros(size(A,2),3);
for i=1:size(A,2)
    Mn(i,1)=i;
    Mn(i,2)= mean(M(find(M(:,i)>-1),i));
    Mn(i,3)=std(M(find(M(:,i)>-1),i))/sqrt(length(M(find(M(:,i)>-1),i)));
    
    Wm(i,1)=i;
    Wm(i,2)=mean(F(find(F(:,i)>-1),i));
    Wm(i,3)=std(F(find(F(:,i)>-1),i))/sqrt(length(F(find(F(:,i)>-1),i)));
end


xrange=3:15;

model_series = [Mn(xrange,2) Wm(xrange,2)];
model_error = [Mn(xrange,3) Wm(xrange,3)];
b = bar(model_series, 'grouped');
legend('Men', 'Women')
xticklabels(xlabels(xrange))
xtickangle(45)
ylabel('Mean Feature Value (Standardized)')
ylim([0 1.05]);
hold on
% Find the number of groups and the number of bars in each group
[ngroups, nbars] = size(model_series);
% Calculate the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));
% Set the position of each error bar in the centre of the main bar
% Based on barweb.m by Bolu Ajiboye from MATLAB File Exchange
for i = 1:nbars
    % Calculate center of each bar
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, model_series(:,i), model_error(:,i), 'k', 'linestyle', 'none');
end
hold off
