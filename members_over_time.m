A=readmatrix('T4_normalized_all.csv'); 
B=[A(:, 18) A(:,16) A(:,17) A(:,20)];

%%%% Gender by year
% filter by field/primary section
% B=B(find(B(:,4)>40),:);
% 
% % get number of males each year
y=groupcounts(B(find(B(:,2)==0),1));
% years males were elected
x=unique(B(find(B(:,2)==0),1));
%plot(x,cumsum(y)) % cumulative number
%yyaxis left
plot(x, y)
set(gca,'FontSize',14)

% get number of women each year
y2=groupcounts(B(find(B(:,2)==1),1));
x2=unique(B(find(B(:,2)==1),1));
hold on
%plot(x2,cumsum(y2)) % cumulative
plot(x2, y2);
ylabel('Number of New Members', 'FontSize', 14)

%% Plot percentage of women
% % Create matrix D containing year, percent
% yyaxis right
% plot(D(:,1), D(:,2), ':ok', 'LineWidth', 1.5)
% ylabel('Percentage', 'Color', 'k', 'FontSize', 14)
legend('Men', 'Women', 'FontSize', 14, 'Location','northwest','NumColumns',1)


%% Institution rank
figure
rank=101; % B(:,3)>0 &  if want to include unranked
y=groupcounts(B(find(B(:,3)>0 & B(:,3)<rank),1));
x=unique(B(find(B(:,3)<rank),1));
%plot(x,cumsum(y))
plot(x,y, 'c')
hold on; set(gca,'FontSize',14)
% unranked
y3=groupcounts(B(find(B(:,3)<1),1));
x3=unique(B(find(B(:,3)<1),1));
plot(x3,y3, 'y')
% low ranking
y2=groupcounts(B(find(B(:,3)>rank-1),1));
x2=unique(B(find(B(:,3)>rank-1),1));
%plot(x2,cumsum(y2))
plot(x2, y2, 'r')

ylabel('Number of New Members', 'FontSize', 14)

% yyaxis right
% plot(D(:,1), D(:,2), ':ok', 'LineWidth', 1.5)
% ylabel('Percentage', 'Color', 'k', 'FontSize', 14)
legend('Hi Rank', 'Unranked', 'Lo Rank (>100)', 'FontSize', 14, 'Location','northwest','NumColumns',1)
