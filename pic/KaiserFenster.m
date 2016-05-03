% 
% (c) Copyright 2016 Tabea Mendez
% 
% This source is free: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% This source is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this source.  If not, see <http://www.gnu.org/licenses/>.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear all
close all

anzSamp = 241;
n = 0:1:anzSamp-1;
alpha = [0, 1,5,10];
[N, Alpha] = meshgrid(n,alpha);
M = (length(n)-1)/2;

delta = 60;
Kaiser = zeros(length(alpha),length(n)+delta);


zaehler = Alpha.*sqrt(N.*(2.*M-N))./M;

Kaiser(:,delta/2+1:length(n)+delta/2) = besseli(0,zaehler)./besseli(0,Alpha);

figure
xachse = [-delta/2:-1, n, anzSamp:anzSamp-1+delta/2];
plot(xachse,Kaiser(1,:),'Color',[0,0,0.667],'LineWidth',1.5);
hold all
plot(xachse,Kaiser(2,:),'Color',[0.71,0,0],'LineWidth',1.5);
hold all
plot(xachse,Kaiser(3,:),'Color',[1,0.588,0],'LineWidth',1.5);
hold all
plot(xachse,Kaiser(4,:),'Color',[0,0.667,0],'LineWidth',1.5);

ylabel('w(n)')
xlabel('n')
axis([-delta/2 anzSamp-1+delta/2 0 1.05])
legend('\alpha = 0','\alpha = 1','\alpha = 5','\alpha = 10',...
        'location','EastOutside')
grid on
%'Color',[0,0,0.667],[0.71,0,0],[1,0.588,0],[0,0.667,0]
