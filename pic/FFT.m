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

clear all;
close all;
clc

w = (0:1:1000-1)/1000*2*pi;
l = 20;
d = [1,1.5,2];
dtft = abs(2*sin((w-d(2)).*l./2)./sin((w-d(2))./2) + sin((w-d(3)).*l./2)./sin((w-d(3))./2) + sin((w-d(1)).*l./2)./sin((w-d(1))./2) + 2*sin((w-2*pi+d(2)).*l./2)./sin((w-2*pi+d(2))./2) + sin((w-2*pi+d(3)).*l./2)./sin((w-2*pi+d(3))./2) + sin((w-2*pi+d(1)).*l./2)./sin((w-2*pi+d(1))./2));

figure(1);
plot(w,dtft,'--','Color',[0.71,0,0],'LineWidth',1);
xlabel('Digitale Frequenz \omega');
ylabel('Magnitude Spectrum');
axis([0 2*pi 0 36]);
grid on;

hold all;
w = (0:1:50-1)/50*2*pi;
dft = abs(2*sin((w-d(2)).*l./2)./sin((w-d(2))./2) + sin((w-d(3)).*l./2)./sin((w-d(3))./2) + sin((w-d(1)).*l./2)./sin((w-d(1))./2) + 2*sin((w-2*pi+d(2)).*l./2)./sin((w-2*pi+d(2))./2) + sin((w-2*pi+d(3)).*l./2)./sin((w-2*pi+d(3))./2) + sin((w-2*pi+d(1)).*l./2)./sin((w-2*pi+d(1))./2));
stem(w,dft,'Color',[0,0,0.667],'LineWidth',1)

legend('DTFT (Physikalische Aufloesung)', 'DFT (Rechnerische Aufloesung)')
legend('location','NorthOutside')

%'Color',[0,0,0.667],[0.71,0,0],[1,0.588,0],[0,0.667,0]
