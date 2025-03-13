function [Qtot,Qsen,Qlat] = air_stream_load(Tin,Tout,win,wout,m)
%% Inputs
% Tin:  inlet air temperature [°C]
% Tout: outlet air temperature [°C]
% win:  inlet air humidity ratio [kg/kg]
% wout: outlet air humidity ratio [kg/kg]
% m:    inlet air mass flow rate [kg/s]
%% Outputs
% Qtot: total load [W]
% Qsen: sensible load [W]
% Qlat: latent load [W]
%
%% Main
% properties
cpa = 1.006;
cpw = 1.86;
hwe = 2501;
% Enthalpy
hin = cpa*Tin + win.*(cpw*Tin + hwe);
hout = cpa*Tout + wout.*(cpw*Tout + hwe);
% Loads
Qtot = 1000*m.*(hout - hin);
Qsen = 1000*m.*(cpa + cpw*min(win,wout)).*(Tout - Tin);
Qlat = Qtot - Qsen;
end