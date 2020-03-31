% rand_input.m PAGE 75
% Corinne Ilvedson
% Last Modified 7/13/98
% Generate White Noise Input with a frequency rolloff at a
% specified corner frequency.

% INPUT ARGUMENTS
% n : # of points desired in input vector
% dt: time step
% wc: corner frequency for rolloff (rad/s)

% OUTPUT
% u : input vector
% function Eu]=randinput(n,dt,wc)

function [u]=rand_input(n,dt,wc)

randn('seed',0)
u=randn(n,1); % random numbers

w=[-n/2:n/2-1]'*2*pi/(n*dt); % frequency (rad/s)

% ----------------------------
% Create filter with rolloff
% at wc rad/s
% ----------------------------

gain_num=1; % the filter
gain_den=[1/wc 1];
gain=nyquist(gainnum,gain_den,w);
gain=fftshift(gain);

f=[0:n-1]'/(n*dt); % in case want to plot filter to get input

u=real(ifft(fft(u).*gain));
