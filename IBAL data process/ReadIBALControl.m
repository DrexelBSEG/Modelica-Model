clc,clear all
load('AllData.mat')
%%
IBALConrtol_all=[];
for timestep=1:1440
    
    IBALConrtol=zeros(1,29);
    
    IBALConrtol(1)=AllData{1,1}(timestep).AHU2F; % AHU2F
    IBALConrtol(2)=AllData{1,1}(timestep).AHU1F; % AHU1F
    
    IBALConrtol(3)=AllData{1,1}(timestep).AHU2SAD; % AHU2SAD
    IBALConrtol(4)=AllData{1,1}(timestep).AHU2RAD; % AHU2RAD
    IBALConrtol(5)=AllData{1,1}(timestep).AHU2EAD; % AHU2EAD
    IBALConrtol(6)=AllData{1,1}(timestep).AHU1SAD; % AHU1SAD
    IBALConrtol(7)=AllData{1,1}(timestep).AHU1RAD; % AHU1RAD
    IBALConrtol(8)=AllData{1,1}(timestep).AHU1EAD; % AHU1EAD
    
    IBALConrtol(9)=AllData{1,1}(timestep).VAV1D; % VAV1D
    IBALConrtol(10)=AllData{1,1}(timestep).VAV2D; % VAV2D
    IBALConrtol(11)=AllData{1,1}(timestep).VAV3D; % VAV3D
    IBALConrtol(12)=AllData{1,1}(timestep).VAV4D; % VAV4D
    
    IBALConrtol(13)=AllData{1,3}(timestep).m_ahu2_SA; % m_ahu2_OA
    IBALConrtol(14)=AllData{1,3}(timestep).T_ahu2_SA+273.15; % T_ahu2_OA
    IBALConrtol(15)=AllData{1,3}(timestep).w_ahu2_SA; % w_ahu2_OA
    IBALConrtol(16)=AllData{1,3}(timestep).m_ahu1_SA; % m_ahu1_OA
    IBALConrtol(17)=AllData{1,3}(timestep).T_ahu1_SA+273.15; % T_ahu1_OA
    IBALConrtol(18)=AllData{1,3}(timestep).w_ahu1_SA; % w_ahu1_OA
    
    % based on the power of the chiller pump, determine the operation status of chiller
    % and then determine the flow rate in the chiller and condensor loop
    % IBALConrtol(19:22) corresponding to Ch1_status, Ch2_status,Ch1Pump_m, and Ch2Pump_m in the input of Modelica
    % IBALConrtol(29) corresponding to m_pump_conden in the input of Modelica
    if AllData{1,3}(timestep).Power_pump1>50 || AllData{1,3}(timestep).Power_pump2>50
        ChillerNum= find([AllData{1,3}(timestep).Power_pump1 AllData{1,3}(timestep).Power_pump2]==...
            max([AllData{1,3}(timestep).Power_pump1 AllData{1,3}(timestep).Power_pump2]));
        if ChillerNum==1
            IBALConrtol(19:22)=[1 0 1.38 0];
            IBALConrtol(29)=1.467;
        else
            IBALConrtol(19:22)=[0 1 0 1.490];
            IBALConrtol(29)=2.167;
        end
    else
        IBALConrtol(19:22)=[0 0 0 0];
        IBALConrtol(29)=0;
    end
    
    IBALConrtol(23)=AllData{1,1}(timestep).pump3_sped; % SLPump_v
    IBALConrtol(24)=min(AllData{1,1}(timestep).v12_pos+0.6,1); % AHU1Valve_y
    IBALConrtol(25)=min(0.4*(AllData{1,1}(timestep).v13_pos)+0.7,1); % AHU2Valve_y
    IBALConrtol(26)=AllData{1,1}(timestep).ch1_Tset+273.15; % Teva_out_set_chiller1
    IBALConrtol(27)=AllData{1,1}(timestep).ch2_Tset+273.15; % Teva_out_set_chiller2
    IBALConrtol(28)=AllData{1,2}(timestep).Tw_out+273.15; % Tw
    
    IBALConrtol_all=[IBALConrtol_all; IBALConrtol];
end
