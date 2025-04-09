function [ModelicaData]=RunSimulinkValiDetail(Model_name,tstart,tend)
%%
% input:
%   Model_name: The Simulink file used to run the Modelica FMU, e.g., 'SimuRun_Day1_Val'
%   tstart: Simulation start time, e.g., 360*60
%   tend: Simulation end time, e.g., 1200*60
% output: 
%   ModelicaData: Modelica simulation results under time series in struct format
%%
% specify model
model = Model_name;
load_system(model);
cs = getActiveConfigSet(model);
model_cs = cs.copy;
set_param(model_cs,...
    'StartTime',string(tstart), 'StopTime',string(tend),...
    'SaveState','on','StateSaveName','xout',...
    'SaveOutput','on','OutputSaveName','yout');
% % load some dependency data structure due to Modelica FMU weather bus
% load('weaBus.mat');

% perform simulation and get output from Simulink
out = sim(model,model_cs);
logs = out.get('logsout');

Power_ahu1_fan=logs.get('Power_ahu1_fan').Values;
Power_ahu2_fan=logs.get('Power_ahu2_fan').Values;
T_z1_ahu1=logs.get('T_z1_ahu1').Values;
T_z2_ahu1=logs.get('T_z2_ahu1').Values;
T_z1_ahu2=logs.get('T_z1_ahu2').Values;
T_z2_ahu2=logs.get('T_z2_ahu2').Values;
w_z1_ahu1=logs.get('w_z1_ahu1').Values;
w_z2_ahu1=logs.get('w_z2_ahu1').Values;
w_z1_ahu2=logs.get('w_z1_ahu2').Values;
w_z2_ahu2=logs.get('w_z2_ahu2').Values;
m_vav1=logs.get('m_vav1').Values;
m_vav2=logs.get('m_vav2').Values;
m_vav3=logs.get('m_vav3').Values;
m_vav4=logs.get('m_vav4').Values;
m_ahu1_SA=logs.get('m_ahu1_SA').Values;
m_ahu1_RA=logs.get('m_ahu1_RA').Values;
m_ahu1_EA=logs.get('m_ahu1_EA').Values;
m_ahu2_SA=logs.get('m_ahu2_SA').Values;
m_ahu2_RA=logs.get('m_ahu2_RA').Values;
m_ahu2_EA=logs.get('m_ahu2_EA').Values;
T_vav1=logs.get('T_vav1').Values;
T_vav2=logs.get('T_vav2').Values;
T_vav3=logs.get('T_vav3').Values;
T_vav4=logs.get('T_vav4').Values;
w_vav1=logs.get('w_vav1').Values;
w_vav2=logs.get('w_vav2').Values;
w_vav3=logs.get('w_vav3').Values;
w_vav4=logs.get('w_vav4').Values;
T_ahu1_SA=logs.get('T_ahu1_SA').Values;
T_ahu1_RA=logs.get('T_ahu1_RA').Values;
T_ahu1_EA=logs.get('T_ahu1_EA').Values;
T_ahu2_SA=logs.get('T_ahu2_SA').Values;
T_ahu2_RA=logs.get('T_ahu2_RA').Values;
T_ahu2_EA=logs.get('T_ahu2_EA').Values;
T_ahu1coil_ain=logs.get('T_ahu1coil_ain').Values;
T_ahu1coil_aout=logs.get('T_ahu1coil_aout').Values;
T_ahu2coil_ain=logs.get('T_ahu2coil_ain').Values;
T_ahu2coil_aout=logs.get('T_ahu2coil_aout').Values;
w_ahu1coil_ain=logs.get('w_ahu1coil_ain').Values;
w_ahu1coil_aout=logs.get('w_ahu1coil_aout').Values;
w_ahu2coil_ain=logs.get('w_ahu2coil_ain').Values;
w_ahu2coil_aout=logs.get('w_ahu2coil_aout').Values;

m_ahu1_w=logs.get('m_ahu1_w').Values;
m_ahu2_w=logs.get('m_ahu2_w').Values;
m_hx_w=logs.get('m_hx_w').Values;
m_ch1e_w=logs.get('m_ch1e_w').Values;
m_ch2e_w=logs.get('m_ch2e_w').Values;
T_chi1_eva_in=logs.get('T_chi1_eva_in').Values;
T_chi1_eva_out=logs.get('T_chi1_eva_out').Values;
T_chi2_eva_in=logs.get('T_chi2_eva_in').Values;
T_chi2_eva_out=logs.get('T_chi2_eva_out').Values;
Power_pump1=logs.get('Power_pump1').Values;
Power_pump2=logs.get('Power_pump2').Values;
Power_pump3=logs.get('Power_pump3').Values;
Power_pump4=logs.get('Power_pump4').Values;
Power_chi1=logs.get('Power_chi1').Values;
Power_chi2=logs.get('Power_chi2').Values;

Power_ahu1_fan=[zeros(360,1); Power_ahu1_fan.Data; zeros(240,1)];
Power_ahu2_fan=[zeros(360,1); Power_ahu2_fan.Data; zeros(240,1)];
T_z1_ahu1=[zeros(360,1); [T_z1_ahu1.Data]-273.15; zeros(240,1)];
T_z2_ahu1=[zeros(360,1); [T_z2_ahu1.Data]-273.15; zeros(240,1)];
T_z1_ahu2=[zeros(360,1); [T_z1_ahu2.Data]-273.15; zeros(240,1)];
T_z2_ahu2=[zeros(360,1); [T_z2_ahu2.Data]-273.15; zeros(240,1)];
w_z1_ahu1=[zeros(360,1); w_z1_ahu1.Data; zeros(240,1)];
w_z2_ahu1=[zeros(360,1); w_z2_ahu1.Data; zeros(240,1)];
w_z1_ahu2=[zeros(360,1); w_z1_ahu2.Data; zeros(240,1)];
w_z2_ahu2=[zeros(360,1); w_z2_ahu2.Data; zeros(240,1)];
m_vav1=[zeros(360,1); m_vav1.Data; zeros(240,1)];
m_vav2=[zeros(360,1); m_vav2.Data; zeros(240,1)];
m_vav3=[zeros(360,1); m_vav3.Data; zeros(240,1)];
m_vav4=[zeros(360,1); m_vav4.Data; zeros(240,1)];
m_ahu1_SA=[zeros(360,1); m_ahu1_SA.Data; zeros(240,1)];
m_ahu1_RA=[zeros(360,1); m_ahu1_RA.Data; zeros(240,1)];
m_ahu1_EA=[zeros(360,1); m_ahu1_EA.Data; zeros(240,1)];
m_ahu2_SA=[zeros(360,1); m_ahu2_SA.Data; zeros(240,1)];
m_ahu2_RA=[zeros(360,1); m_ahu2_RA.Data; zeros(240,1)];
m_ahu2_EA=[zeros(360,1); m_ahu2_EA.Data; zeros(240,1)];
T_vav1=[zeros(360,1); [T_vav1.Data]-273.15; zeros(240,1)];
T_vav2=[zeros(360,1); [T_vav2.Data]-273.15; zeros(240,1)];
T_vav3=[zeros(360,1); [T_vav3.Data]-273.15; zeros(240,1)];
T_vav4=[zeros(360,1); [T_vav4.Data]-273.15; zeros(240,1)];
w_vav1=[zeros(360,1); w_vav1.Data; zeros(240,1)];
w_vav2=[zeros(360,1); w_vav2.Data; zeros(240,1)];
w_vav3=[zeros(360,1); w_vav3.Data; zeros(240,1)];
w_vav4=[zeros(360,1); w_vav4.Data; zeros(240,1)];
T_ahu1_SA=[zeros(360,1); [T_ahu1_SA.Data]-273.15; zeros(240,1)];
T_ahu1_RA=[zeros(360,1); [T_ahu1_RA.Data]-273.15; zeros(240,1)];
T_ahu1_EA=[zeros(360,1); [T_ahu1_EA.Data]-273.15; zeros(240,1)];
T_ahu2_SA=[zeros(360,1); [T_ahu2_SA.Data]-273.15; zeros(240,1)];
T_ahu2_RA=[zeros(360,1); [T_ahu2_RA.Data]-273.15; zeros(240,1)];
T_ahu2_EA=[zeros(360,1); [T_ahu2_EA.Data]-273.15; zeros(240,1)];
T_ahu1coil_ain=[zeros(360,1); [T_ahu1coil_ain.Data]-273.15; zeros(240,1)];
T_ahu1coil_aout=[zeros(360,1); [T_ahu1coil_aout.Data]-273.15; zeros(240,1)];
T_ahu2coil_ain=[zeros(360,1); [T_ahu2coil_ain.Data]-273.15; zeros(240,1)];
T_ahu2coil_aout=[zeros(360,1); [T_ahu2coil_aout.Data]-273.15; zeros(240,1)];
w_ahu1coil_ain=[zeros(360,1); w_ahu1coil_ain.Data; zeros(240,1)];
w_ahu1coil_aout=[zeros(360,1); w_ahu1coil_aout.Data; zeros(240,1)];
w_ahu2coil_ain=[zeros(360,1); w_ahu2coil_ain.Data; zeros(240,1)];
w_ahu2coil_aout=[zeros(360,1); w_ahu2coil_aout.Data; zeros(240,1)];

m_ahu1_w=[zeros(360,1); m_ahu1_w.Data; zeros(240,1)];
m_ahu2_w=[zeros(360,1); m_ahu2_w.Data; zeros(240,1)];
m_hx_w=[zeros(360,1); m_hx_w.Data; zeros(240,1)];
m_ch1e_w=[zeros(360,1); m_ch1e_w.Data; zeros(240,1)];
m_ch2e_w=[zeros(360,1); m_ch2e_w.Data; zeros(240,1)];
T_chi1_eva_in=[zeros(360,1); [T_chi1_eva_in.Data]-273.15; zeros(240,1)];
T_chi1_eva_out=[zeros(360,1); [T_chi1_eva_out.Data]-273.15; zeros(240,1)];
T_chi2_eva_in=[zeros(360,1); [T_chi2_eva_in.Data]-273.15; zeros(240,1)];
T_chi2_eva_out=[zeros(360,1); [T_chi2_eva_out.Data]-273.15; zeros(240,1)];
Power_pump1=[zeros(360,1); Power_pump1.Data; zeros(240,1)];
Power_pump2=[zeros(360,1); Power_pump2.Data; zeros(240,1)];
Power_pump3=[zeros(360,1); Power_pump3.Data; zeros(240,1)];
Power_pump4=[zeros(360,1); Power_pump4.Data; zeros(240,1)];
Power_chi1=[zeros(360,1); Power_chi1.Data; zeros(240,1)];
Power_chi2=[zeros(360,1); Power_chi2.Data; zeros(240,1)];
%%
ModelicaData=struct('Power_ahu1_fan',{},'Power_ahu2_fan',{},...
    'T_z1_ahu1',{},'T_z2_ahu1',{},'T_z1_ahu2',{},'T_z2_ahu2',{},...
    'w_z1_ahu1',{},'w_z2_ahu1',{},'w_z1_ahu2',{},'w_z2_ahu2',{},...
    'm_vav1',{},'m_vav2',{},'m_vav3',{},'m_vav4',{},...
    'm_ahu1_SA',{},'m_ahu1_RA',{},'m_ahu1_EA',{},'m_ahu2_SA',{},'m_ahu2_RA',{},'m_ahu2_EA',{},...
    'T_vav1',{},'T_vav2',{},'T_vav3',{},'T_vav4',{},...
    'w_vav1',{},'w_vav2',{},'w_vav3',{},'w_vav4',{},...
    'T_ahu1_SA',{},'T_ahu1_RA',{},'T_ahu1_EA',{},'T_ahu2_SA',{},'T_ahu2_RA',{},'T_ahu2_EA',{},...
    'T_ahu1coil_ain',{},'T_ahu1coil_aout',{},'T_ahu2coil_ain',{},'T_ahu2coil_aout',{},...
    'w_ahu1coil_ain',{},'w_ahu1coil_aout',{},'w_ahu2coil_ain',{},'w_ahu2coil_aout',{},...
    'm_ahu1_w',{},'m_ahu2_w',{},'m_hx_w',{},'m_ch1e_w',{},'m_ch2e_w',{},...
    'T_chi1_eva_in',{},'T_chi1_eva_out',{},'T_chi2_eva_in',{},'T_chi2_eva_out',{},...
    'Power_pump1',{},'Power_pump2',{},'Power_pump3',{},'Power_pump4',{},'Power_chi1',{},'Power_chi2',{});

for i=1:1441
    ModelicaData(i).Power_ahu1_fan=Power_ahu1_fan(i);
    ModelicaData(i).Power_ahu2_fan=Power_ahu2_fan(i);
    ModelicaData(i).T_z1_ahu1=T_z1_ahu1(i);
    ModelicaData(i).T_z2_ahu1=T_z2_ahu1(i);
    ModelicaData(i).T_z1_ahu2=T_z1_ahu2(i);
    ModelicaData(i).T_z2_ahu2=T_z2_ahu2(i);
    ModelicaData(i).w_z1_ahu1=w_z1_ahu1(i);
    ModelicaData(i).w_z2_ahu1=w_z2_ahu1(i);
    ModelicaData(i).w_z1_ahu2=w_z1_ahu2(i);
    ModelicaData(i).w_z2_ahu2=w_z2_ahu2(i);
    ModelicaData(i).m_vav1=m_vav1(i);
    ModelicaData(i).m_vav2=m_vav2(i);
    ModelicaData(i).m_vav3=m_vav3(i);
    ModelicaData(i).m_vav4=m_vav4(i);
    ModelicaData(i).m_ahu1_SA=m_ahu1_SA(i);
    ModelicaData(i).m_ahu1_RA=m_ahu1_RA(i);
    ModelicaData(i).m_ahu1_EA=m_ahu1_EA(i);
    ModelicaData(i).m_ahu2_SA=m_ahu2_SA(i);
    ModelicaData(i).m_ahu2_RA=m_ahu2_RA(i);
    ModelicaData(i).m_ahu2_EA=m_ahu2_EA(i);
    ModelicaData(i).T_vav1=T_vav1(i);
    ModelicaData(i).T_vav2=T_vav2(i);
    ModelicaData(i).T_vav3=T_vav3(i);
    ModelicaData(i).T_vav4=T_vav4(i);
    ModelicaData(i).w_vav1=w_vav1(i);
    ModelicaData(i).w_vav2=w_vav2(i);
    ModelicaData(i).w_vav3=w_vav3(i);
    ModelicaData(i).w_vav4=w_vav4(i);
    ModelicaData(i).T_ahu1_SA=T_ahu1_SA(i);
    ModelicaData(i).T_ahu1_RA=T_ahu1_RA(i);
    ModelicaData(i).T_ahu1_EA=T_ahu1_EA(i);
    ModelicaData(i).T_ahu2_SA=T_ahu2_SA(i);
    ModelicaData(i).T_ahu2_RA=T_ahu2_RA(i);
    ModelicaData(i).T_ahu2_EA=T_ahu2_EA(i);
    ModelicaData(i).T_ahu1coil_ain=T_ahu1coil_ain(i);
    ModelicaData(i).T_ahu1coil_aout=T_ahu1coil_aout(i);
    ModelicaData(i).T_ahu2coil_ain=T_ahu2coil_ain(i);
    ModelicaData(i).T_ahu2coil_aout=T_ahu2coil_aout(i);
    ModelicaData(i).w_ahu1coil_ain=w_ahu1coil_ain(i);
    ModelicaData(i).w_ahu1coil_aout=w_ahu1coil_aout(i);
    ModelicaData(i).w_ahu2coil_ain=w_ahu2coil_ain(i);
    ModelicaData(i).w_ahu2coil_aout=w_ahu2coil_aout(i);
    
    ModelicaData(i).m_ahu1_w=m_ahu1_w(i); 
    ModelicaData(i).m_ahu2_w=m_ahu2_w(i);
    ModelicaData(i).m_hx_w=m_hx_w(i); 
    ModelicaData(i).m_ch1e_w=m_ch1e_w(i);
    ModelicaData(i).m_ch2e_w=m_ch2e_w(i);    
    ModelicaData(i).T_chi1_eva_in=T_chi1_eva_in(i); 
    ModelicaData(i).T_chi1_eva_out=T_chi1_eva_out(i); 
    ModelicaData(i).T_chi2_eva_in=T_chi2_eva_in(i); 
    ModelicaData(i).T_chi2_eva_out=T_chi2_eva_out(i); 
    ModelicaData(i).Power_chi1=Power_chi1(i); 
    ModelicaData(i).Power_chi2=Power_chi2(i); 
    if ModelicaData(i).m_ch1e_w>0.2 || ModelicaData(i).m_ch2e_w>0.2
        ChillerNum=find([ModelicaData(i).m_ch1e_w ModelicaData(i).m_ch2e_w]==...
            max([ModelicaData(i).m_ch1e_w ModelicaData(i).m_ch2e_w]));
        if ChillerNum==1
            ModelicaData(i).Power_pump1=945;
            ModelicaData(i).Power_pump2=0;
        else
            ModelicaData(i).Power_pump1=0;
            ModelicaData(i).Power_pump2=1201;
        end
    else
        ModelicaData(i).Power_pump1=0;
        ModelicaData(i).Power_pump2=0;
    end
    ModelicaData(i).Power_pump3=max(Power_pump3(i)-50,0); 
    ModelicaData(i).Power_pump4=Power_pump4(i); 
    ModelicaData(i).Power_chi1=Power_chi1(i); 
    ModelicaData(i).Power_chi2=Power_chi2(i); 
end
end