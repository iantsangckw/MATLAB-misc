clear;
clc;
close all;

%% Cost per donut

cost = 0.5;
packs = [1.5 4/3 1];
d = zeros(3,2);
d(1,1) = 200; % Single demand
d(2,1) = 150; % Set demand
d(3,1) = 25; % Box demand
d = d * 1.6;
pricing = (0:0.1:2.6)';

for j = 1 : size(packs,1)
%fprintf('Case %g\n',j)
pack = packs(j,:);
%pack = zeros(1,3);
%pack(1) = input('Pack 1 price [$/donuts] = ');
%pack(2) = input('Pack 2 price [$/donuts] = ');
%pack(3) = input('Pack 3 price [$/donuts] = ');
dozens = 42;
donuts = dozens*12;

%% Predicted demand

%p = length(pricing);
P = zeros(3,2);
%Area = zeros(3,1);
Order = zeros(3,1);

for i = 1 : length(d)
    P(i,:) = polyfit([pricing(1) pricing(end)],d(i,:),1);
    %f = @(x) P(i,1)*x + P(i,2);
    %Area(i) = quad(f, pricing(1), pricing(end));
    Order(i) = P(i,1)*pack(i) + P(i,2);
end

pdd(1) = round(Order(1));
pdd(2) = round(Order(2))*3;
pdd(3) = round(Order(3))*12;

while sum(pdd) > donuts
    dec = donuts/sum(pdd);
    Order = Order * dec;
    pdd(1) = round(Order(1));
    pdd(2) = round(Order(2))*3;
    pdd(3) = round(Order(3))*12;
end

for i = 1:3
        if pdd(i) < 0
            pdd(i) = 0;
        end
    end

%check = 1;
%while check == 1
    %pd = zeros(1,2.5);
    %pd(1) = input('Pack 1 demand [probability] = ');
    %pd(2) = input('Pack 2 demand [probability] = ');
    %pd(3) = input('Pack 3 demand [probability] = ');
    %if sum(pd) <=1
        %check = 0;
    %elseif sum(pd) > 1 || sum(pd) < 0
        %fprintf('Demand sum must be within 1\n')
    %end
%end

psold = sum(pdd);
psoldt(j) = (psold/donuts*100);

fprintf('Package  1 CpD: %g PD: %g\n',pack(1),pdd(1))
fprintf('Package  3 CpD: %g PD: %g sets\n',pack(2),pdd(2)/3)
fprintf('Package 12 CpD: %g PD: %g boxes\n',pack(3),pdd(3)/12)
fprintf('Donuts sold = %g/%g, %g%%\n',psold,donuts,psold/donuts*100)

%% Predicted profit

profit = pack(1)*pdd(1)+pack(2)*pdd(2)+pack(3)*pdd(3)-cost*donuts;
promar = profit/(cost*donuts)*100;
fprintf('Profit margin = %g%% \n',promar) 
promart(j) = promar;

end
promart = promart';
psoldt = psoldt';