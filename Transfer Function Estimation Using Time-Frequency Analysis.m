%=========================================================
% main_num.m
%=========================================================
% Corinne Ilvedson
% Last Modified 7/23/98
% Calculates the information matrix M from a numerical example information vector V
%=========================================================

close all
clear all
fig=1;
u_input='n'
plots=l;

% c=chirp signal input
% n = white noise input
% 1 = plot results
% O = don't plot results

% Code parameters
noisevariance = 4;

% the variance of sensor noise to add to the measuremement (10^-(noise_variance))/dt unless equal to zero then variance equals zero

%--------------------------------
% Impulse Parameters
%--------------------------------
m=640;
% # of previous input pts the response depends on

% end of page 63


% --------------------------------
% Define numerical system
% --------------------------------
wl=50.26; % zero frequency (rad/s)
w2=40.85; % 1st peak frequency (rad/s)
w3=56.56; % 2nd peak frequency (rad/s)

%transfer function numerator
num = -200*[1 2*.05*wl w^2] ;

% transfer function denominator part 1
den1 = [1 2*.02*w2 w2^2] ;

% transfer function denominator part 2
den2 = [1 2*.02*w3 w3^2];

% transfer function denominator
den = conv(denl,den2);

clear denl den2 wl w2 w3
% --------------------------------
% Plot exact transfer function of
% numerical example
% --------------------------------
w=linspace(0,16*2*pi,500);
% frequency (rad/s)

[mag,ph,w]=bode(num,den,w);% magnitude and phase of numerical example

% frequency (Hz)
f=w/(2*pi);

if plots
    figure(fig)
    set(fig,'Position',[548 389 560 440]) fig=fig+1;
    subplot(211) plot(f,mag)
    axis([0 16 0 2]) grid
    ylabel('Gain')
    title('Transfer Function of Numerical Example')
    subplot (212) plot(f,ph)
    axis([0 16 -400 -150]) grid
    xlabel('Frequency (Hz)') ylabel('Phase (deg)')
end
% Create input and find system
% response to input
% --------------------------------

% sampling rate (Hz)
Ts = 200;

% simulation end time (s)
tend = 30;

% total # of points
n = tend*Ts+l;

% time vector (s)
t = [linspace(0,tend,n)]';

% time step (s)
dt=t(2);

% NOISE INPUT
if strcmp(u_input,'n')
    % create noise in
    u=rand_input(n,dt,35*2*pi);

    % end page 64

    y=lsim(num,den,u,t); % system response
elseif strcmp(u_input,'c') % CHIRP INPUT
    u=1.5*sin(2.51*t. 2);
    u=[zeros(m,1); u; zeros(m,l)]; % pad front with m zeros
    t=[t; t(2:2*m+l)+t(n)];     % adjust time vector accordingly


    % adjust time vector accordingly
    n=length(u); % number of data points in data to consider
    y = isim(num,den,u(m+l:n),t(1:n-m)); % system response
    y = [zeros(m, 1); y];
end

N=n;

if noise_variance==0
    Nvar=O;
else
    Nvar=(1/dt)*10^(-noisevariance); %variance of the noise
end

if Nvar -= 0 % create sensor noise
    randn('seed',42); % initialize random number generator
    v=randn(n, )*sqrt(Nvar); % sensor noise
    y=y+v; % add sensor noise to output
end

% --------------------------------
% Plot input and output
% --------------------------------

if plots
    figure(fig)
    set(fig,'Position',[548 389 560 440])
    fig=fig+1;

    subplot(211)
    plot(t,u)
    grid
    ylabel('INPUT u')

    subplot(212)
    plot(t,y)
    grid
    xlabel('time (s)')
    ylabel('OUTPUT y')
end
% --------------------------------
% Find exact impulse response
% using MATLAB's impulse.m
% --------------------------------
ttime=clock; % time the calculation
[g_matlab,t_matlab]=impulse(num,den,t(l:m)); % exact impulse response
gmatlab=gmatlab';

% end of page 65
