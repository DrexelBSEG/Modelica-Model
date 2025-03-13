clc,clear all
% the case name of IBAL historical data
CaliCaseName=[{'Atlanta_Eff_TypSum_RB_2004_TypOcc_TypBehav_NoTES_LoadBalance_05282023_070250'}];

for Case_i=1:size(CaliCaseName,1)
    RawData{1,Case_i}=load(char(CaliCaseName(Case_i,1)));
end
%%
for N_cases=1:size(RawData,2)
    CaseName_temp=strsplit(char(CaliCaseName(N_cases)),'_');
    CaseName=[CaseName_temp{1:3}];
    
    processData2=0;
    scaledData2=0;
    scaledData2_sim=0;
    processData2 = table2struct(RawData{1,N_cases}.HardwareData.processData2);
    scaledData2 = table2struct(RawData{1,N_cases}.HardwareData.scaledData2);
    [scaledData2_sim,processData2_sim,delay_all] = hwdata_sent(scaledData2,processData2,RawData{1,N_cases}.Measurements);
    for i=1:1441
        % Control Signal
        ConSig_temp(i).case=CaseName;
        ConSig_temp(i).time=i;
        % air loop
        ConSig_temp(i).AHU1SAD=min(max(scaledData2_sim(i).d6_pos_c/7.4,0),1); %[V] to % 
        ConSig_temp(i).AHU2SAD=min(max(scaledData2_sim(i).d7_pos_c,0),1);
        ConSig_temp(i).AHU1RAD=min(max(scaledData2_sim(i).d5_pos_c/9,0),1);
        ConSig_temp(i).AHU2RAD=min(max(scaledData2_sim(i).d8_pos_c/9,0),1);
        ConSig_temp(i).AHU1EAD=min(max(scaledData2_sim(i).d10_pos_c/0.02,0),1);  %[mA] to % 
        ConSig_temp(i).AHU2EAD=min(max(scaledData2_sim(i).d11_pos_c/0.02,0),1);
        ConSig_temp(i).VAV1D=min(max(((RawData{1,N_cases}.Measurements(i).d1_ahu2)-2)/8,0),1); %[V] to % 
        ConSig_temp(i).VAV2D=min(max(((RawData{1,N_cases}.Measurements(i).d2_ahu2)-2)/8,0),1);
        ConSig_temp(i).VAV3D=min(max(((RawData{1,N_cases}.Measurements(i).d1_ahu1)-2)/8,0),1);
        ConSig_temp(i).VAV4D=min(max(((RawData{1,N_cases}.Measurements(i).d2_ahu1)-2)/8,0),1);
        ConSig_temp(i).AHU1F=min(max(RawData{1,N_cases}.Measurements(i).vfd_ahu1/(60-4),0),1); %[Hz] to % 
        ConSig_temp(i).AHU2F=min(max(RawData{1,N_cases}.Measurements(i).vfd_ahu2/(60-4),0),1);
        % water loop
        ConSig_temp(i).v12_pos=min(max((scaledData2_sim(i).v12_pos_c-2)/6,0),1); %[V] to % 
        ConSig_temp(i).v13_pos=min(max((scaledData2_sim(i).v13_pos_c-2)/6,0),1);
        ConSig_temp(i).pump3_sped=(scaledData2_sim(i).pump3_vfd)/10; %[V] to %
        if scaledData2_sim(i).pump1_power>50 || scaledData2_sim(i).pump2_power>50
            if scaledData2_sim(i).pump1_power>scaledData2_sim(i).pump2_power
                ConSig_temp(i).WhichChillerOn=1;
            else
                ConSig_temp(i).WhichChillerOn=2;
            end
        else
            ConSig_temp(i).WhichChillerOn=0;
        end
        % thermal
        ConSig_temp(i).ch1_Tset=(scaledData2_sim(i).ch1_e_out_rtd-32)/1.8; %F to C
        ConSig_temp(i).ch2_Tset=(scaledData2_sim(i).ch2_e_out_rtd-32)/1.8;
        
        % Measurements
        Meas_temp(i).case=CaseName;
        Meas_temp(i).time=i;
        % air loop
        Meas_temp(i).T_z1_ahu1=RawData{1,N_cases}.Measurements(i).T_z1_ahu1;
        Meas_temp(i).T_z2_ahu1=RawData{1,N_cases}.Measurements(i).T_z2_ahu1;
        Meas_temp(i).T_z1_ahu2=RawData{1,N_cases}.Measurements(i).T_z1_ahu2;
        Meas_temp(i).T_z2_ahu2=RawData{1,N_cases}.Measurements(i).T_z2_ahu2;
        Meas_temp(i).w_z1_ahu1=RawData{1,N_cases}.Measurements(i).w_z1_ahu1;
        Meas_temp(i).w_z2_ahu1=RawData{1,N_cases}.Measurements(i).w_z2_ahu1;
        Meas_temp(i).w_z1_ahu2=RawData{1,N_cases}.Measurements(i).w_z1_ahu2;
        Meas_temp(i).w_z2_ahu2=RawData{1,N_cases}.Measurements(i).w_z2_ahu2;
        
        Meas_temp(i).m_vav1=RawData{1,N_cases}.Measurements(i).m_sup_vav1_ahu2;
        Meas_temp(i).m_vav2=RawData{1,N_cases}.Measurements(i).m_sup_vav2_ahu2;
        Meas_temp(i).m_vav3=RawData{1,N_cases}.Measurements(i).m_sup_vav1_ahu1;
        Meas_temp(i).m_vav4=RawData{1,N_cases}.Measurements(i).m_sup_vav2_ahu1;
        Meas_temp(i).m_ahu1_SA=cfm2kgs([scaledData2_sim(i).ahu1_f_sa]);
        Meas_temp(i).m_ahu1_RA=Meas_temp(i).m_vav3+Meas_temp(i).m_vav4-Meas_temp(i).m_ahu1_SA;
        Meas_temp(i).m_ahu1_EA=Meas_temp(i).m_ahu1_SA; 
        Meas_temp(i).m_ahu2_SA=cfm2kgs([scaledData2_sim(i).ahu2_f_sa]);
        Meas_temp(i).m_ahu2_RA=Meas_temp(i).m_vav1+Meas_temp(i).m_vav2-Meas_temp(i).m_ahu2_SA; 
        Meas_temp(i).m_ahu2_EA=Meas_temp(i).m_ahu2_SA;        
        Meas_temp(i).T_vav1=RawData{1,N_cases}.Measurements(i).T_sup_vav1_ahu2;
        Meas_temp(i).T_vav2=RawData{1,N_cases}.Measurements(i).T_sup_vav2_ahu2;
        Meas_temp(i).T_vav3=RawData{1,N_cases}.Measurements(i).T_sup_vav1_ahu1;
        Meas_temp(i).T_vav4=RawData{1,N_cases}.Measurements(i).T_sup_vav2_ahu1;
        Meas_temp(i).w_vav1=RawData{1,N_cases}.Measurements(i).w_sup_vav1_ahu2;
        Meas_temp(i).w_vav2=RawData{1,N_cases}.Measurements(i).w_sup_vav2_ahu2;
        Meas_temp(i).w_vav3=RawData{1,N_cases}.Measurements(i).w_sup_vav1_ahu1;
        Meas_temp(i).w_vav4=RawData{1,N_cases}.Measurements(i).w_sup_vav2_ahu1;
        
        Meas_temp(i).T_ahu1_SA=[scaledData2_sim(i).ahu1_tdb_sa-32]/1.8;
        Meas_temp(i).T_ahu1_RA=[scaledData2_sim(i).ahu1_tdb_ra-32]/1.8;
        Meas_temp(i).T_ahu1_EA=[scaledData2_sim(i).exf1_t_in-32]/1.8;
        Meas_temp(i).T_ahu2_SA=[scaledData2_sim(i).ahu2_t_sa-32]/1.8;
        Meas_temp(i).T_ahu2_RA=[scaledData2_sim(i).ahu2_t_ra-32]/1.8;
        Meas_temp(i).T_ahu2_EA=[scaledData2_sim(i).exf2_t_in-32]/1.8;  
        
        Meas_temp(i).w_ahu1_SA=rh2w_ashrae2021_si(scaledData2_sim(i).ahu1_rh_sa,Meas_temp(i).T_ahu1_SA,101);
        Meas_temp(i).w_ahu2_SA=rh2w_ashrae2021_si(scaledData2_sim(i).ahu1_rh_sa,Meas_temp(i).T_ahu2_SA,101);
        
        Meas_temp(i).T_ahu1coil_ain=[scaledData2_sim(i).ahu1_in_rtd-32]/1.8;        
        Meas_temp(i).RH_ahu1coil_ain=scaledData2_sim(i).ahu1_rh_up;
        Meas_temp(i).w_ahu1coil_ain=rh2w_ashrae2021_si(Meas_temp(i).RH_ahu1coil_ain,Meas_temp(i).T_ahu1coil_ain,101);
        
        Meas_temp(i).T_ahu1coil_aout=[scaledData2_sim(i).ahu1_out_rtd-32]/1.8;        
        Meas_temp(i).RH_ahu1coil_aout=scaledData2_sim(i).ahu1_rh_down;
        Meas_temp(i).w_ahu1coil_aout=rh2w_ashrae2021_si(Meas_temp(i).RH_ahu1coil_aout,Meas_temp(i).T_ahu1coil_aout,101);
        
        Meas_temp(i).T_ahu2coil_ain=[scaledData2_sim(i).ahu2_in_rtd-32]/1.8;        
        Meas_temp(i).RH_ahu2coil_ain=scaledData2_sim(i).ahu2_rh_up;
        Meas_temp(i).w_ahu2coil_ain=rh2w_ashrae2021_si(Meas_temp(i).RH_ahu2coil_ain,Meas_temp(i).T_ahu2coil_ain,101);
        
        Meas_temp(i).T_ahu2coil_aout=[scaledData2_sim(i).ahu2_out_rtd-32]/1.8;         
        Meas_temp(i).RH_ahu2coil_aout=scaledData2_sim(i).ahu2_rh_down;
        Meas_temp(i).w_ahu2coil_aout=rh2w_ashrae2021_si(Meas_temp(i).RH_ahu2coil_aout,Meas_temp(i).T_ahu2coil_aout,101);
        
        Meas_temp(i).Power_ahu1_fan=scaledData2_sim(i).ahu1_fan_power;
        Meas_temp(i).Power_ahu2_fan=scaledData2_sim(i).ahu2_fan_power;
        % water loop
        Meas_temp(i).m_ahu1_w=gpm2kgs([scaledData2_sim(i).ahu1_f_cc]);
        Meas_temp(i).m_ahu2_w=gpm2kgs([scaledData2_sim(i).ahu2_f_cc]);
        Meas_temp(i).m_hx_w=gpm2kgs([scaledData2_sim(i).hx1_f_pg]);
        Meas_temp(i).m_ch1e_w=gpm2kgs([scaledData2_sim(i).ch1_f_e]);
        Meas_temp(i).m_ch2e_w=gpm2kgs([scaledData2_sim(i).ch2_f_e]);
        Meas_temp(i).m_sl_w=gpm2kgs([scaledData2_sim(i).sl_f]);
        Meas_temp(i).m_ch1c_w=gpm2kgs([scaledData2_sim(i).ch1_f_c]);
        Meas_temp(i).m_ch2c_w=gpm2kgs([scaledData2_sim(i).ch2_f_c]);        
        Meas_temp(i).T_ahu1coil_win=[scaledData2_sim(i).pump3_out_rtd-32]/1.8;
        Meas_temp(i).T_ahu1coil_wout=[scaledData2_sim(i).ahu1_cc_out_rtd-32]/1.8;
        Meas_temp(i).T_ahu2coil_win=[scaledData2_sim(i).ahu2_cc_in_rtd-32]/1.8;
        Meas_temp(i).T_ahu2coil_wout=[scaledData2_sim(i).ahu2_cc_out_rtd-32]/1.8;        
        Meas_temp(i).T_chi1_con_in=[scaledData2_sim(i).pump4_out_rtd-32]/1.8;
        Meas_temp(i).T_chi1_con_out=[scaledData2_sim(i).ch1_c_out_rtd-32]/1.8;
        Meas_temp(i).T_chi1_eva_in=[scaledData2_sim(i).ch1_e_in_rtd-32]/1.8;
        Meas_temp(i).T_chi1_eva_out=[scaledData2_sim(i).ch1_e_out_rtd-32]/1.8;        
        Meas_temp(i).T_chi2_con_in=[scaledData2_sim(i).pump4_out_rtd-32]/1.8;
        Meas_temp(i).T_chi2_con_out=[scaledData2_sim(i).ch2_c_out_rtd-32]/1.8;
        Meas_temp(i).T_chi2_eva_in=[scaledData2_sim(i).ch1_e_in_rtd-32]/1.8;
        Meas_temp(i).T_chi2_eva_out=[scaledData2_sim(i).ch2_e_out_rtd-32]/1.8;        
        Meas_temp(i).Power_chi1=scaledData2_sim(i).ch1_power;
        Meas_temp(i).Power_chi2=scaledData2_sim(i).ch2_power;
        Meas_temp(i).Power_pump1=scaledData2_sim(i).pump1_power;
        Meas_temp(i).Power_pump2=scaledData2_sim(i).pump2_power;
        Meas_temp(i).Power_pump3=scaledData2_sim(i).pump3_power;
        Meas_temp(i).Power_pump4=scaledData2_sim(i).pump4_power;  
        
        % Boundary condition
        BouCon_temp(i).case=CaseName;
        BouCon_temp(i).time=i;
        BouCon_temp(i).Ta_out=(scaledData2_sim(i).oau_t_out-32)/1.8; %F to C
        BouCon_temp(i).wa_out=processData2_sim(i).oau_c_t_pv_f;
        BouCon_temp(i).Tw_out=(scaledData2_sim(i).pump4_out_rtd-32)/1.8; %F to C
        
        % the supply air cooling load
        [~,BouCon_temp(i).Qs_z1_ahu1,BouCon_temp(i).Ql_z1_ahu1]=...
            air_stream_load(Meas_temp(i).T_vav1,Meas_temp(i).T_z1_ahu1,...
            Meas_temp(i).w_vav3,Meas_temp(i).w_z1_ahu1,Meas_temp(i).m_vav3);
        [~,BouCon_temp(i).Qs_z2_ahu1,BouCon_temp(i).Ql_z2_ahu1]=...
            air_stream_load(Meas_temp(i).T_vav2,Meas_temp(i).T_z2_ahu1,...
            Meas_temp(i).w_vav4,Meas_temp(i).w_z2_ahu1,Meas_temp(i).m_vav4);
        [~,BouCon_temp(i).Qs_z1_ahu2,BouCon_temp(i).Ql_z1_ahu2]=...
            air_stream_load(Meas_temp(i).T_vav3,Meas_temp(i).T_z1_ahu2,...
            Meas_temp(i).w_vav1,Meas_temp(i).w_z1_ahu2,Meas_temp(i).m_vav1);
        [~,BouCon_temp(i).Qs_z2_ahu2,BouCon_temp(i).Ql_z2_ahu2]=...
            air_stream_load(Meas_temp(i).T_vav4,Meas_temp(i).T_z2_ahu2,...
            Meas_temp(i).w_vav2,Meas_temp(i).w_z2_ahu2,Meas_temp(i).m_vav2);
        
        % supervisory control signal
        SupCtrl_temp(i).Tsp_z1_ahu1=RawData{1,N_cases}.SimData(i).Tz_cspt_z1_ahu1;
        SupCtrl_temp(i).Tsp_z2_ahu1=RawData{1,N_cases}.SimData(i).Tz_cspt_z2_ahu1;
        SupCtrl_temp(i).Tsp_z1_ahu2=RawData{1,N_cases}.SimData(i).Tz_cspt_z1_ahu2;
        SupCtrl_temp(i).Tsp_z2_ahu2=RawData{1,N_cases}.SimData(i).Tz_cspt_z2_ahu2;
        
        SupCtrl_temp(i).P_sp_ahu1=RawData{1,N_cases}.SupvCtrlSig(i).P_sp_ahu1(2);
        SupCtrl_temp(i).P_sp_ahu2=RawData{1,N_cases}.SupvCtrlSig(i).P_sp_ahu2(2);
        
        SupCtrl_temp(i).T_SA_ahu1=RawData{1,N_cases}.SupvCtrlSig(i).T_SA_ahu1(2);
        SupCtrl_temp(i).T_SA_ahu2=RawData{1,N_cases}.SupvCtrlSig(i).T_SA_ahu2(2);
        
        SupCtrl_temp(i).DP_slSP=RawData{1,N_cases}.SupvCtrlSig(i).DP_slSP(2);
        SupCtrl_temp(i).T_chwst=RawData{1,N_cases}.SupvCtrlSig(i).T_chwst(2);   
    end
    
    AllData{N_cases,1}=ConSig_temp;
    AllData{N_cases,2}=BouCon_temp;
    AllData{N_cases,3}=Meas_temp;
    AllData{N_cases,4}=SupCtrl_temp;
end
save('AllData.mat','AllData')