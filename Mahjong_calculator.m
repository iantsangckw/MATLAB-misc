clear;
clc;
close all;
%% Instructions
% E = 1
% S = 2
% W = 3
% N = 4

%Win type 0 1v1
%Win type 1 1v3
%Win type 2 Bao

%% Setup
a=zeros(1,4);
e=0;
k=input('Type 0 for default start, 1 for custom start = ');
if k==0
    r=1;
    p=1;
    c=[0 0 8 16 24 32 48 64 96 128];
    len=10;
elseif k==1
    a(1)=input('E Score = ');
    a(2)=input('S Score = ');
    a(3)=input('W Score = ');
    a(4)=input('N Score = ');
    r=input('Round = ');
    if r<1
        error('Round must be between 1 and 4')
    elseif r>4
        error('Round must be between 1 and 4')
    end
    p=input('Position = ');
    if p<1
        error('Position must be between 1 and 4')
    elseif p>4
        error('Position must be between 1 and 4')
    end
    len=input('Max fan = ');
    c=zeros(1,len);
    for i=1:len
        fprintf('%g fan value',i')
        c(i)=input(' = ');
    end
else
    error('Input must be 0 or 1')
end
clc;
%% In-use
while e==0
    if r==1
        fprintf('Round E, position %g\n',p)
    elseif r==2
        fprintf('Round S, position %g\n',p)
    elseif r==3
        fprintf('Round W, position %g\n',p)
    elseif r==4
        fprintf('Round N, position %g\n',p)
    end
    t=input('Type of win = ');
    if t==1
        w=input('Winner position = ');
        f=input('Fan = ');
        l=0;
    elseif t==0
        w=input('Winner position = ');
        l=input('Loser position = ');
        if l<1
        fprintf('Round %g position %g\nCurrent Score\nE Score = %g\nS Score = %g\nW Score = %g\nN Score = %g\n',r,p,a(1),a(2),a(3),a(4));
        error('Losing position must be between 1 and 4')
        elseif l>4
        fprintf('Round %g position %g\nCurrent Score\nE Score = %g\nS Score = %g\nW Score = %g\nN Score = %g\n',r,p,a(1),a(2),a(3),a(4));
        error('Losing position must be between 1 and 4')
        elseif w==l
        fprintf('Round %g position %g\nCurrent Score\nE Score = %g\nS Score = %g\nW Score = %g\nN Score = %g\n',r,p,a(1),a(2),a(3),a(4));
        error('Winning position and losing position must be different')
        end
        f=input('Fan = ');
    elseif t==2
        w=input('Winner position = ');
        l=input('Loser position = ');
        if l<1
        fprintf('Round %g position %g\nCurrent Score\nE Score = %g\nS Score = %g\nW Score = %g\nN Score = %g\n',r,p,a(1),a(2),a(3),a(4));
        error('Losing position must be between 1 and 4')
        elseif l>4
        fprintf('Round %g position %g\nCurrent Score\nE Score = %g\nS Score = %g\nW Score = %g\nN Score = %g\n',r,p,a(1),a(2),a(3),a(4));
        error('Losing position must be between 1 and 4')
        elseif w==l
        fprintf('Round %g position %g\nCurrent Score\nE Score = %g\nS Score = %g\nW Score = %g\nN Score = %g\n',r,p,a(1),a(2),a(3),a(4));
        error('Winning position and losing position must be different')
        end
        f=input('Fan = ');
    else
        fprintf('Round %g position %g\nCurrent Score\nE Score = %g\nS Score = %g\nW Score = %g\nN Score = %g\n',r,p,a(1),a(2),a(3),a(4));
        error('Type of win must 0,1,or 2')
    end
    if w<1
        fprintf('Round %g position %g\nCurrent Score\nE Score = %g\nS Score = %g\nW Score = %g\nN Score = %g\n',r,p,a(1),a(2),a(3),a(4));
        error('Winning position must be between 1 and 4')
    elseif w>4
        fprintf('Round %g position %g\nCurrent Score\nE Score = %g\nS Score = %g\nW Score = %g\nN Score = %g\n',r,p,a(1),a(2),a(3),a(4));
        error('Winning position must be between 1 and 4')
    elseif f<0
        fprintf('Round %g position %g\nCurrent Score\nE Score = %g\nS Score = %g\nW Score = %g\nN Score = %g\n',r,p,a(1),a(2),a(3),a(4));
        error('Fan must be between 1 and %g',len)
    elseif f>len
        fprintf('Round %g position %g\nCurrent Score\nE Score = %g\nS Score = %g\nW Score = %g\nN Score = %g\n',r,p,a(1),a(2),a(3),a(4));
        error('Fan must be between 1 and %g',len)
    end
    a=Mahjong(c,t,w,l,f,a);
    fprintf('E Score = %g\nS Score = %g\nW Score = %g\nN Score = %g\n', a(1),a(2),a(3),a(4));
    e=input('Type 0 to continue, any number to end = ');
    if w~=p
        p=p+1;
    end
    if p>4
        r=r+1;
        p=1;
    end
    if r>4
        r=1;
    end
    clc;
end
fprintf('Final Score\nE Score = %g\nS Score = %g\nW Score = %g\nN Score = %g\n', a(1),a(2),a(3),a(4));