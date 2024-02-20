clear;
clc;
close all

sales11 = [3 1 3 1 1 3 3 3 3]; % 11 - 12
sales12 = [3 1 1 3 1 1 1 3 1 3 3 1 1 1 3]; % 12 - 1
sales1 = [3 1 12 1 1 3 3 3 1 1 3]; % 1 - 2
sales2 = [1 3 3 3 1 1 1 1]; % 2 - 3
sales3 = [3 12 3 3 3 3 3 1 3 3 1 1 3 1 12 1 3]; % 3 - 4
sales4 = [12 3 3 1 3 1 12 1 3 1 1 1 1 1 1 1 1 1 3 1 1 3 1 3 3]; % 4 - 5
sales5 = [12 3 12 1 3 1 1 1 1 1 1 12 1 1 1 1 12 1 1 3 3 3 1]; % 5 - 6
sales = sales11;
sold11 = sum(sales11);
sold12 = sum(sales12);
sold1 = sum(sales1);
sold2 = sum(sales2);
sold3 = sum(sales3);
sold4 = sum(sales4);
sold5 = sum(sales5);

rev11 = 0;
rev12 = 0;
rev1 = 0;
rev2 = 0;
rev3 = 0;
rev4 = 0;
rev5 = 0;

for i = 1 : length(sales11)
    if sales11(i) == 1
        rev11 = rev11 + 1.5;
    elseif sales11(i) == 3
        rev11 = rev11 + 4;
    elseif sales11(i) == 12
        rev11 = rev11 + 12;
    end
end

for i = 1 : length(sales12)
    if sales12(i) == 1
        rev12 = rev12 + 1.5;
    elseif sales12(i) == 3
        rev12 = rev12 + 4;
    elseif sales12(i) == 12
        rev12 = rev12 + 12;
    end
end

for i = 1 : length(sales1)
    if sales1(i) == 1
        rev1 = rev1 + 1.5;
    elseif sales1(i) == 3
        rev1 = rev1 + 4;
    elseif sales1(i) == 12
        rev1 = rev1 + 12;
    end
end

for i = 1 : length(sales2)
    if sales2(i) == 1
        rev2 = rev2 + 1.5;
    elseif sales2(i) == 3
        rev2 = rev2 + 4;
    elseif sales2(i) == 12
        rev2 = re2 + 12;
    end
end

for i = 1 : length(sales3)
    if sales3(i) == 1
        rev3 = rev3 + 1.5;
    elseif sales3(i) == 3
        rev3 = rev3 + 4;
    elseif sales3(i) == 12
        rev3 = rev3 + 12;
    end
end

for i = 1 : length(sales4)
    if sales4(i) == 1
        rev4 = rev4 + 1.5;
    elseif sales4(i) == 3
        rev4 = rev4 + 4;
    elseif sales4(i) == 12
        rev4 = rev4 + 12;
    end
end

for i = 1 : length(sales5)
    if sales5(i) == 1
        rev5 = rev5 + 1.5;
    elseif sales5(i) == 3
        rev5 = rev5 + 4;
    elseif sales5(i) == 12
        rev5 = rev5 + 12;
    end
end

sales(end+1:end+length(sales12)) = sales12;
sales(end+1:end+length(sales1)) = sales1;
sales(end+1:end+length(sales2)) = sales2;
sales(end+1:end+length(sales3)) = sales3;
sales(end+1:end+length(sales4)) = sales4;
sales(end+1:end+length(sales5)) = sales5;
sales = sales';
packagea = 0;
packageb = 0;
packagec = 0;

for i = 1 : length(sales)
    if sales(i) == 1
        packagea = packagea + 1;
    elseif sales(i) == 3
        packageb = packageb + 1;
    elseif sales(i) == 12
        packagec = packagec + 1;
    end
end

donutssold = packagea + packageb * 3 + packagec * 12 + 9;
revenue = packagea * 1.5 + packageb * 4 + packagec * 12 + 9;

donuts = 12 * 25;
cost = 0.5 * donuts;
profit = revenue - cost;
promar = profit / cost * 100;

fprintf('Package  1 CpD: 1.5 PD: %g\n',packagea)
fprintf('Package  3 CpD: 1.33333 PD: %g sets\n', packageb)
fprintf('Package 12 CpD: 1 PD: %g boxes\n',packagec)
fprintf('Donuts sold = %g/%g, %g%%\n',donutssold,donuts,donutssold/donuts*100)
fprintf('Profit margin = %g%% \n',promar)