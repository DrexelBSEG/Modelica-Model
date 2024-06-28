within ;
model All_IBAL_0821
  Buildings.Fluid.Movers.SpeedControlled_y AHU2FanSup(
    redeclare package Medium = Buildings.Media.Air,
    per(
      pressure(V_flow={509,1299,2090,2881,3671,4462,5253,6043,6834,7625}*0.0001,
          dp={1221,1215,1187,1137,1065,971,855,717,558,376}),
      use_powerCharacteristic=true,
      power(V_flow={509,1299,2090,2881,3671,4462,5253,6043,6834,7625}*0.0001, P=
           {812,881,950,1019,1089,1158,1227,1296,1365,1434})),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    addPowerToMedium=true)  "Supply air fan"
    annotation (Placement(transformation(extent={{-28,-372},{-8,-352}})));
  Buildings.Fluid.FixedResistances.Junction jun(
    redeclare package Medium = Buildings.Media.Air,
    m_flow_nominal={0.7,-0.35,-0.35},
    dp_nominal={0,0,0})
    annotation (Placement(transformation(extent={{6,-372},{26,-352}})));
  Buildings.Fluid.FixedResistances.Junction jun1(
    redeclare package Medium = Buildings.Media.Air,
    m_flow_nominal={0.6,0.1,-0.7},
    dp_nominal={0,0,0})
    annotation (Placement(transformation(extent={{-90,-352},{-70,-372}})));
  Buildings.Fluid.FixedResistances.Junction jun2(
    redeclare package Medium = Buildings.Media.Air,
    m_flow_nominal={0.35,0.35,-0.7},
    dp_nominal={0,0,0})
    annotation (Placement(transformation(extent={{172,-372},{152,-352}})));
  Buildings.Fluid.Sources.Boundary_pT bou1(
    redeclare package Medium = Buildings.Media.Air,
    p(displayUnit="Pa") = 101325,
    nPorts=2)
    annotation (Placement(transformation(extent={{288,-416},{268,-396}})));
  Buildings.Fluid.FixedResistances.Junction jun3(
    redeclare package Medium = Buildings.Media.Air,
    m_flow_nominal={0.7,-0.1,-0.6},
    dp_nominal={0,0,0})
    annotation (Placement(transformation(extent={{184,-352},{204,-372}})));
  Buildings.Fluid.Movers.SpeedControlled_y AHU1FanSup(
    redeclare package Medium = Buildings.Media.Air,
    per(
      pressure(V_flow={419,1192,1966,2739,3512,4285,5058,5831,6604,7378}*0.0001,
          dp={1178,1158,1119,1061,984,888,772,638,484,312}),
      use_powerCharacteristic=true,
      power(V_flow={419,1192,1966,2739,3512,4285,5058,5831,6604,7378}*0.0001, P=
           {955,1015,1074,1134,1194,1254,1313,1373,1432,1492})),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    addPowerToMedium=true)  "Supply air fan"
    annotation (Placement(transformation(extent={{-28,-446},{-8,-426}})));
  Buildings.Fluid.FixedResistances.Junction jun4(
    redeclare package Medium = Buildings.Media.Air,
    m_flow_nominal={0.7,-0.35,-0.35},
    dp_nominal={0,0,0})
    annotation (Placement(transformation(extent={{6,-446},{26,-426}})));
  Buildings.Fluid.FixedResistances.Junction jun5(
    redeclare package Medium = Buildings.Media.Air,
    m_flow_nominal={0.6,0.1,-0.7},
    dp_nominal={0,0,0})
    annotation (Placement(transformation(extent={{-90,-446},{-70,-426}})));
  Buildings.Fluid.FixedResistances.Junction jun6(
    redeclare package Medium = Buildings.Media.Air,
    m_flow_nominal={0.35,0.35,-0.7},
    dp_nominal={0,0,0})
    annotation (Placement(transformation(extent={{172,-446},{152,-426}})));
  Buildings.Fluid.FixedResistances.Junction jun7(
    redeclare package Medium = Buildings.Media.Air,
    m_flow_nominal={0.7,-0.1,-0.6},
    dp_nominal={0,0,0})
    annotation (Placement(transformation(extent={{184,-446},{204,-426}})));
  Buildings.Fluid.Sensors.MassFlowRate m_VAV2(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{72,-396},{82,-388}})));
  Buildings.Fluid.Sensors.MassFlowRate m_VAV1(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{74,-366},{84,-358}})));
  Buildings.Fluid.Sensors.MassFlowRate m_VAV3(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{70,-440},{80,-432}})));
  Buildings.Fluid.Sensors.MassFlowRate m_AHU1_EA(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{240,-366},{250,-358}})));
  Buildings.Fluid.Sensors.MassFlowRate m_AHU2_EA(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{238,-440},{248,-432}})));
  Buildings.Fluid.Sensors.MassFlowRate m_AHU1_RA(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{-16,-334},{-6,-326}})));
  Buildings.Fluid.Sensors.MassFlowRate m_AHU2_RA(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{-16,-492},{-6,-484}})));
  Buildings.Fluid.Sensors.MassFlowRate m_AHU2_SA(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{-136,-440},{-126,-432}})));
  Buildings.Fluid.Sensors.MassFlowRate m_AHU1_SA(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{-136,-366},{-126,-358}})));
  Buildings.Fluid.Sensors.Pressure m_AHU1_air(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{-42,-362},{-32,-352}})));
  Buildings.Fluid.Sensors.Pressure senPre1(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{-6,-362},{4,-352}})));
  Buildings.Fluid.Sensors.Pressure m_AHU2_air(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{-36,-436},{-26,-426}})));
  Buildings.Fluid.Sensors.Pressure senPre3(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{-6,-436},{4,-426}})));
  Buildings.Fluid.Sensors.Pressure senPre6(redeclare package Medium =
        Buildings.Media.Air) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={267,-425})));
  Buildings.Fluid.Sensors.Pressure senPre7(redeclare package Medium =
        Buildings.Media.Air) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={267,-387})));
  Buildings.Fluid.Actuators.Dampers.Exponential DamperAHU2RA(
    redeclare package Medium = Buildings.Media.Air,
    allowFlowReversal=true,
    m_flow_nominal=0.88,
    dpDamper_nominal=21,
    a=-0.24,
    b=0.051*90,
    yL=15/90,
    yU=55/90,
    k1=0.25,
    l=0.00011)
    annotation (Placement(transformation(extent={{-56,-332},{-36,-312}})));
  Buildings.Fluid.Actuators.Dampers.Exponential DamperAHU2SA(
    redeclare package Medium = Buildings.Media.Air,
    allowFlowReversal=true,
    m_flow_nominal=0.6,
    dpDamper_nominal=34,
    a=-0.6,
    b=0.117*90,
    yL=15/90,
    yU=55/90,
    k1=0.51,
    l=0.00005)
    annotation (Placement(transformation(extent={{-120,-372},{-100,-352}})));
  Buildings.Fluid.Actuators.Dampers.Exponential DamperAHU2EA(
    redeclare package Medium = Buildings.Media.Air,
    allowFlowReversal=true,
    m_flow_nominal=0.5,
    dpDamper_nominal=83,
    a=-1.17,
    b=0.101*90,
    yL=15/90,
    yU=65/90,
    k1=0.33,
    l=0.00009)
    annotation (Placement(transformation(extent={{212,-372},{232,-352}})));
  Buildings.Fluid.Actuators.Dampers.Exponential DamVAV1(
    redeclare package Medium = Buildings.Media.Air,
    allowFlowReversal=true,
    m_flow_nominal=0.36,
    dpDamper_nominal=38,
    a=-1.9,
    b=0.089*90,
    yL=15/90,
    yU=55/90,
    k1=0.49,
    l=0.0003)
    annotation (Placement(transformation(extent={{42,-372},{62,-352}})));
  Buildings.Fluid.Actuators.Dampers.Exponential DamVAV2(
    redeclare package Medium = Buildings.Media.Air,
    allowFlowReversal=true,
    m_flow_nominal=0.55,
    dpDamper_nominal=35,
    a=-0.54,
    b=0.08*90,
    yL=15/90,
    yU=65/90,
    k1=0.72,
    l=0.00007)
    annotation (Placement(transformation(extent={{38,-402},{58,-382}})));
  Buildings.Fluid.Actuators.Dampers.Exponential DamperAHU1SA(
    redeclare package Medium = Buildings.Media.Air,
    allowFlowReversal=true,
    m_flow_nominal=0.53,
    dpDamper_nominal=17,
    a=-2.57,
    b=0.117*90,
    yL=15/90,
    yU=55/90,
    k1=0.52,
    l=0.00012)
    annotation (Placement(transformation(extent={{-120,-446},{-100,-426}})));
  Buildings.Fluid.Actuators.Dampers.Exponential DamperAHU1RA(
    redeclare package Medium = Buildings.Media.Air,
    allowFlowReversal=true,
    m_flow_nominal=55,
    dpDamper_nominal=56,
    a=-1.36,
    b=0.16*90,
    yL=15/90,
    yU=65/90,
    k1=0.21,
    l=0.00012)
    annotation (Placement(transformation(extent={{-58,-498},{-38,-478}})));
  Buildings.Fluid.Actuators.Dampers.Exponential DamperAHU1EA(
    redeclare package Medium = Buildings.Media.Air,
    allowFlowReversal=true,
    m_flow_nominal=0.07,
    dpDamper_nominal=2,
    a=-1.33,
    b=0.006*90,
    yL=15/90,
    yU=55/90,
    k1=0.3,
    l=0.00007)
    annotation (Placement(transformation(extent={{210,-446},{230,-426}})));
  Buildings.Fluid.Actuators.Dampers.Exponential DamVAV3(
    redeclare package Medium = Buildings.Media.Air,
    allowFlowReversal=true,
    m_flow_nominal=0.4,
    dpDamper_nominal=100,
    a=-0.49,
    b=0.066*90,
    yL=15/90,
    yU=55/90,
    k1=0.84,
    l=0.00004)
    annotation (Placement(transformation(extent={{42,-446},{62,-426}})));
  Buildings.Fluid.Actuators.Dampers.Exponential DamVAV4(
    redeclare package Medium = Buildings.Media.Air,
    allowFlowReversal=true,
    m_flow_nominal=0.45,
    dpDamper_nominal=39,
    a=-1.08,
    b=0.086*90,
    yL=15/90,
    yU=55/90,
    k1=0.68,
    l=0.00001)
    annotation (Placement(transformation(extent={{42,-476},{62,-456}})));
  Buildings.Fluid.Sources.MassFlowSource_T Air_AHU2_out(
    use_Xi_in=true,
    use_m_flow_in=true,
    redeclare package Medium = Buildings.Media.Air,
    use_T_in=true,
    m_flow=0.3,
    T=298.15,
    nPorts=2)
    annotation (Placement(transformation(extent={{-198,-372},{-178,-352}})));
  Buildings.Fluid.Sources.MassFlowSource_T Air_AHU1_out(
    use_Xi_in=true,
    use_m_flow_in=true,
    redeclare package Medium = Buildings.Media.Air,
    use_T_in=true,
    m_flow=0.3,
    T=298.15,
    nPorts=2)
    annotation (Placement(transformation(extent={{-198,-446},{-178,-426}})));
  Buildings.Fluid.Sensors.Temperature senTem(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{-160,-360},{-148,-348}})));
  Buildings.Fluid.Sensors.Temperature senTem1(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{-158,-446},{-146,-434}})));
  Buildings.Fluid.Sensors.Temperature senTem2(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{152,-316},{164,-304}})));
  Buildings.Fluid.Sensors.Temperature senTem3(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{68,-508},{80,-496}})));
  Buildings.Fluid.Sensors.Temperature senTem4(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{-94,-346},{-82,-334}})));
  Buildings.Fluid.Sensors.Temperature senTem5(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{-44,-378},{-32,-366}})));
  Buildings.Fluid.Sensors.Temperature senTem6(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{-78,-430},{-66,-418}})));
  Buildings.Fluid.Sensors.Temperature senTem7(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{-40,-452},{-28,-440}})));
  Buildings.Fluid.Sensors.Temperature senTem8(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{64,-348},{76,-336}})));
  Buildings.Fluid.Sensors.Temperature senTem9(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{60,-386},{72,-374}})));
  Buildings.Fluid.Sensors.Temperature senTem10(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{64,-428},{76,-416}})));
  Buildings.Fluid.Sensors.Temperature senTem11(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{70,-460},{82,-448}})));
  Buildings.Fluid.Sensors.Temperature senTem12(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{130,-346},{142,-334}})));
  Buildings.Fluid.Sensors.Temperature senTem13(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{132,-378},{144,-366}})));
  Buildings.Fluid.Sensors.Temperature senTem14(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{132,-420},{144,-408}})));
  Buildings.Fluid.Sensors.Temperature senTem15(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{134,-462},{146,-450}})));
  Buildings.Fluid.Sensors.Temperature senTem16(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{228,-346},{240,-334}})));
  Buildings.Fluid.Sensors.Temperature senTem17(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{230,-422},{242,-410}})));
  Buildings.Fluid.Sensors.MassFraction senMasFra(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{-154,-384},{-142,-372}})));
  Buildings.Fluid.Sensors.MassFraction senMasFra1(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{-148,-424},{-136,-412}})));
  Buildings.Fluid.Sensors.MassFraction senMasFra2(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{-60,-382},{-48,-370}})));
  Buildings.Fluid.Sensors.MassFraction senMasFra3(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{-58,-450},{-46,-438}})));
  Buildings.Fluid.Sensors.MassFraction senMasFra4(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{78,-348},{90,-336}})));
  Buildings.Fluid.Sensors.MassFraction senMasFra5(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{80,-386},{92,-374}})));
  Buildings.Fluid.Sensors.MassFraction senMasFra6(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{88,-432},{100,-420}})));
  Buildings.Fluid.Sensors.MassFraction senMasFra7(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{84,-454},{96,-442}})));
  Buildings.Fluid.HeatExchangers.WetCoilCounterFlow AHU2coil(
    redeclare package Medium1 = Buildings.Media.Antifreeze.PropyleneGlycolWater
        (property_T=293.15, X_a=0.40),
    redeclare package Medium2 = Buildings.Media.Air,
    m1_flow_nominal=0.5,
    m2_flow_nominal=0.8,
    dp1_nominal=0,
    dp2_nominal=0,
    UA_nominal=2000,
    r_nominal=0.2,
    nEle=2) annotation (Placement(transformation(extent={{-62,-362},{-48,-350}})));
  Buildings.Fluid.HeatExchangers.WetCoilCounterFlow AHU1coil(
    redeclare package Medium1 = Buildings.Media.Antifreeze.PropyleneGlycolWater
        (property_T=293.15, X_a=0.40),
    redeclare package Medium2 = Buildings.Media.Air,
    m1_flow_nominal=0.1,
    m2_flow_nominal=0.4,
    dp1_nominal=0,
    dp2_nominal=0,
    UA_nominal=1000,
    r_nominal=0.2,
    nEle=2)
    annotation (Placement(transformation(extent={{-54,-438},{-40,-424}})));
  VirtualTestbed.NISTChillerTestbed.System.CoSimulationDemo.ThermalZones.SimpleZone_1
    VAV1(
    redeclare package Medium = Buildings.Media.Air,
    AFlo=0.1,
    hRoo=0.1,
    nPorts=2) annotation (Placement(transformation(extent={{104,-364},{124,-344}})));
  VirtualTestbed.NISTChillerTestbed.System.CoSimulationDemo.ThermalZones.SimpleZone_1
    VAV2(
    redeclare package Medium = Buildings.Media.Air,
    AFlo=0.1,
    hRoo=0.1,
    nPorts=2) annotation (Placement(transformation(extent={{104,-392},{124,-372}})));
  VirtualTestbed.NISTChillerTestbed.System.CoSimulationDemo.ThermalZones.SimpleZone_1
    VAV3(
    redeclare package Medium = Buildings.Media.Air,
    AFlo=0.1,
    hRoo=0.1,
    nPorts=2) annotation (Placement(transformation(extent={{108,-440},{128,-420}})));
  VirtualTestbed.NISTChillerTestbed.System.CoSimulationDemo.ThermalZones.SimpleZone_1
    VAV4(
    redeclare package Medium = Buildings.Media.Air,
    AFlo=0.1,
    hRoo=0.1,
    nPorts=2)
    annotation (Placement(transformation(extent={{104,-470},{124,-450}})));
  Modelica.Blocks.Interfaces.RealOutput Power_ahu2_fan
    annotation (Placement(transformation(extent={{350,-316},{370,-296}})));
  Modelica.Blocks.Interfaces.RealOutput Power_ahu1_fan
    annotation (Placement(transformation(extent={{350,-332},{370,-312}})));
  Modelica.Blocks.Interfaces.RealOutput m_vav1
    annotation (Placement(transformation(extent={{350,-358},{370,-338}})));
  Modelica.Blocks.Interfaces.RealOutput T_vav1
    annotation (Placement(transformation(extent={{352,-376},{372,-356}})));
  Modelica.Blocks.Interfaces.RealOutput w_vav1
    annotation (Placement(transformation(extent={{352,-396},{372,-376}})));
  Modelica.Blocks.Interfaces.RealOutput m_vav2
    annotation (Placement(transformation(extent={{350,-418},{370,-398}})));
  Modelica.Blocks.Interfaces.RealOutput T_vav2
    annotation (Placement(transformation(extent={{352,-436},{372,-416}})));
  Modelica.Blocks.Interfaces.RealOutput w_vav2
    annotation (Placement(transformation(extent={{352,-456},{372,-436}})));
  Modelica.Blocks.Interfaces.RealOutput m_vav3
    annotation (Placement(transformation(extent={{348,-472},{368,-452}})));
  Modelica.Blocks.Interfaces.RealOutput T_vav3
    annotation (Placement(transformation(extent={{350,-490},{370,-470}})));
  Modelica.Blocks.Interfaces.RealOutput w_vav3
    annotation (Placement(transformation(extent={{350,-510},{370,-490}})));
  Modelica.Blocks.Interfaces.RealOutput T_vav4
    annotation (Placement(transformation(extent={{354,-546},{374,-526}})));
  Modelica.Blocks.Interfaces.RealOutput w_vav4
    annotation (Placement(transformation(extent={{354,-566},{374,-546}})));
  Modelica.Blocks.Interfaces.RealOutput m_ahu2_SA
    annotation (Placement(transformation(extent={{398,-360},{418,-340}})));
  Modelica.Blocks.Interfaces.RealOutput m_ahu2_RA
    annotation (Placement(transformation(extent={{398,-376},{418,-356}})));
  Modelica.Blocks.Interfaces.RealOutput m_ahu2_EA
    annotation (Placement(transformation(extent={{398,-394},{418,-374}})));
  Modelica.Blocks.Interfaces.RealOutput m_ahu1_SA
    annotation (Placement(transformation(extent={{406,-452},{426,-432}})));
  Modelica.Blocks.Interfaces.RealOutput m_ahu1_RA
    annotation (Placement(transformation(extent={{404,-472},{424,-452}})));
  Modelica.Blocks.Interfaces.RealOutput m_ahu1_EA
    annotation (Placement(transformation(extent={{412,-496},{432,-476}})));
  Modelica.Blocks.Interfaces.RealOutput T_ahu2_SA
    annotation (Placement(transformation(extent={{460,-358},{480,-338}})));
  Modelica.Blocks.Interfaces.RealOutput T_ahu2_RA
    annotation (Placement(transformation(extent={{464,-374},{484,-354}})));
  Modelica.Blocks.Interfaces.RealOutput T_ahu2_EA
    annotation (Placement(transformation(extent={{464,-392},{484,-372}})));
  Modelica.Blocks.Interfaces.RealOutput T_ahu1_SA
    annotation (Placement(transformation(extent={{466,-452},{486,-432}})));
  Modelica.Blocks.Interfaces.RealOutput T_ahu1_RA
    annotation (Placement(transformation(extent={{462,-470},{482,-450}})));
  Modelica.Blocks.Interfaces.RealOutput T_ahu1_EA
    annotation (Placement(transformation(extent={{470,-486},{490,-466}})));
  Buildings.Fluid.Sensors.MassFraction senMasFra8(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{-80,-386},{-68,-374}})));
  Buildings.Fluid.Sensors.MassFraction senMasFra9(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{-72,-460},{-60,-448}})));
  Modelica.Blocks.Interfaces.RealOutput T_ahu2coil_ain
    annotation (Placement(transformation(extent={{532,-354},{552,-334}})));
  Modelica.Blocks.Interfaces.RealOutput T_ahu2coil_aout
    annotation (Placement(transformation(extent={{614,-350},{634,-330}})));
  Modelica.Blocks.Interfaces.RealOutput w_ahu2coil_ain
    annotation (Placement(transformation(extent={{534,-378},{554,-358}})));
  Modelica.Blocks.Interfaces.RealOutput w_ahu2coil_aout
    annotation (Placement(transformation(extent={{618,-382},{638,-362}})));
  Modelica.Blocks.Interfaces.RealOutput T_ahu1coil_ain
    annotation (Placement(transformation(extent={{536,-444},{556,-424}})));
  Modelica.Blocks.Interfaces.RealOutput w_ahu1coil_ain
    annotation (Placement(transformation(extent={{536,-464},{556,-444}})));
  Modelica.Blocks.Interfaces.RealOutput T_ahu1coil_aout
    annotation (Placement(transformation(extent={{620,-438},{640,-418}})));
  Modelica.Blocks.Interfaces.RealOutput w_ahu1coil_aout
    annotation (Placement(transformation(extent={{622,-458},{642,-438}})));
  Buildings.Fluid.Sensors.MassFlowRate m_VAV4(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{82,-470},{92,-462}})));
  Modelica.Blocks.Interfaces.RealOutput m_vav4
    annotation (Placement(transformation(extent={{352,-528},{372,-508}})));
  Modelica.Blocks.Interfaces.RealInput AHU2F
    annotation (Placement(transformation(extent={{-408,-244},{-368,-204}})));
  Modelica.Blocks.Interfaces.RealInput AHU1F
    annotation (Placement(transformation(extent={{-408,-274},{-368,-234}})));
  Modelica.Blocks.Interfaces.RealInput AHU2SAD
    annotation (Placement(transformation(extent={{-410,-314},{-370,-274}})));
  Modelica.Blocks.Interfaces.RealInput AHU2RAD
    annotation (Placement(transformation(extent={{-408,-344},{-368,-304}})));
  Modelica.Blocks.Interfaces.RealInput AHU2EAD
    annotation (Placement(transformation(extent={{-408,-372},{-368,-332}})));
  Modelica.Blocks.Interfaces.RealInput AHU1SAD
    annotation (Placement(transformation(extent={{-372,-332},{-332,-292}})));
  Modelica.Blocks.Interfaces.RealInput AHU1RAD
    annotation (Placement(transformation(extent={{-374,-362},{-334,-322}})));
  Modelica.Blocks.Interfaces.RealInput AHU1EAD
    annotation (Placement(transformation(extent={{-374,-400},{-334,-360}})));
  Modelica.Blocks.Interfaces.RealInput VAV1D
    annotation (Placement(transformation(extent={{-420,-410},{-380,-370}})));
  Modelica.Blocks.Interfaces.RealInput VAV2D
    annotation (Placement(transformation(extent={{-420,-438},{-380,-398}})));
  Modelica.Blocks.Interfaces.RealInput VAV3D
    annotation (Placement(transformation(extent={{-420,-464},{-380,-424}})));
  Modelica.Blocks.Interfaces.RealInput VAV4D
    annotation (Placement(transformation(extent={{-420,-490},{-380,-450}})));
  Modelica.Blocks.Interfaces.RealInput m_ahu2_OA
    annotation (Placement(transformation(extent={{-258,-354},{-218,-314}})));
  Modelica.Blocks.Interfaces.RealInput T_ahu2_OA
    annotation (Placement(transformation(extent={{-260,-378},{-220,-338}})));
  Modelica.Blocks.Interfaces.RealInput w_ahu2_OA
    annotation (Placement(transformation(extent={{-264,-404},{-224,-364}})));
  Modelica.Blocks.Interfaces.RealInput m_ahu1_OA
    annotation (Placement(transformation(extent={{-266,-434},{-226,-394}})));
  Modelica.Blocks.Interfaces.RealInput T_ahu1_OA
    annotation (Placement(transformation(extent={{-266,-458},{-226,-418}})));
  Modelica.Blocks.Interfaces.RealInput w_ahu1_OA
    annotation (Placement(transformation(extent={{-268,-482},{-228,-442}})));
  Modelica.Blocks.Interfaces.RealInput Qs_z1_ahu2
    annotation (Placement(transformation(extent={{120,-184},{160,-144}})));
  Modelica.Blocks.Interfaces.RealInput Qs_z2_ahu2
    annotation (Placement(transformation(extent={{118,-216},{158,-176}})));
  Modelica.Blocks.Interfaces.RealInput Qs_z1_ahu1
    annotation (Placement(transformation(extent={{120,-244},{160,-204}})));
  Modelica.Blocks.Interfaces.RealInput Qs_z2_ahu1
    annotation (Placement(transformation(extent={{122,-270},{162,-230}})));
  Modelica.Blocks.Interfaces.RealInput Ql_z1_ahu2
    annotation (Placement(transformation(extent={{186,-180},{226,-140}})));
  Modelica.Blocks.Interfaces.RealInput Ql_z2_ahu2
    annotation (Placement(transformation(extent={{190,-208},{230,-168}})));
  Modelica.Blocks.Interfaces.RealInput Ql_z1_ahu1
    annotation (Placement(transformation(extent={{190,-234},{230,-194}})));
  Modelica.Blocks.Interfaces.RealInput Ql_z2_ahu1
    annotation (Placement(transformation(extent={{188,-260},{228,-220}})));
  Modelica.Blocks.Interfaces.RealOutput Tz_vav1
    annotation (Placement(transformation(extent={{430,-546},{450,-526}})));
  Modelica.Blocks.Interfaces.RealOutput Tz_vav2
    annotation (Placement(transformation(extent={{432,-564},{452,-544}})));
  Modelica.Blocks.Interfaces.RealOutput Tz_vav3
    annotation (Placement(transformation(extent={{430,-582},{450,-562}})));
  Modelica.Blocks.Interfaces.RealOutput Tz_vav4
    annotation (Placement(transformation(extent={{430,-602},{450,-582}})));
  Buildings.Fluid.Sensors.MassFraction senMasFra10(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{140,-318},{152,-306}})));
  Modelica.Blocks.Interfaces.RealOutput wz_vav1
    annotation (Placement(transformation(extent={{220,-322},{240,-302}})));
  Buildings.Fluid.Sensors.MassFraction senMasFra11(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{164,-402},{176,-390}})));
  Modelica.Blocks.Interfaces.RealOutput wz_vav2
    annotation (Placement(transformation(extent={{196,-406},{216,-386}})));
  Buildings.Fluid.Sensors.MassFraction senMasFra12(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{146,-424},{158,-412}})));
  Modelica.Blocks.Interfaces.RealOutput wz_vav3
    annotation (Placement(transformation(extent={{188,-428},{208,-408}})));
  Buildings.Fluid.Sensors.MassFraction senMasFra13(redeclare package Medium =
        Buildings.Media.Air)
    annotation (Placement(transformation(extent={{166,-476},{178,-464}})));
  Modelica.Blocks.Interfaces.RealOutput wz_vav4
    annotation (Placement(transformation(extent={{202,-478},{222,-458}})));
  Buildings.Fluid.FixedResistances.Junction jun8(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={2,-1,-1},
    dp_nominal={0,0,0})
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},
        rotation=90,
        origin={160,318})));
  Buildings.Fluid.FixedResistances.Junction jun9(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={-2,1,1},
    dp_nominal={0,0,0})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-82,306})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear val3(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=1,
    dpValve_nominal=100,
    riseTime=1)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-44,306})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear val4(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=1,
    dpValve_nominal=100,
    riseTime=1)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-38,338})));
  Buildings.Fluid.Movers.FlowControlled_m_flow pump1test(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    m_flow_nominal=1.276,
    per(
      pressure(V_flow={0.001230,0.001278,0.001325}, dp={177900,177800,177700}),
      use_powerCharacteristic=true,
      power(V_flow={0,0.001230,0.001278,0.001325}, P={0,925.6,929.3,933.00})),
    inputType=Buildings.Fluid.Types.InputType.Continuous,
    addPowerToMedium=false,
    dp_nominal(displayUnit="kPa") = 177800)
    annotation (Placement(transformation(extent={{58,326},{78,346}})));

  Buildings.Fluid.FixedResistances.Junction jun10(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={2,-1,-1},
    dp_nominal={0,0,0})
    annotation (Placement(transformation(extent={{10,10},{-10,-10}},
        rotation=90,
        origin={160,294})));
  Buildings.Fluid.FixedResistances.Junction jun11(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={-2,1,1},
    dp_nominal={0,0,0})
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-82,270})));
  Buildings.Fluid.FixedResistances.PressureDrop Bypass(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=0.5,
    dp_nominal=21800,
    deltaM=0.2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={14,270})));
  Buildings.Fluid.Movers.FlowControlled_m_flow pump2test(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    m_flow_nominal=1.490,
    per(
      pressure(V_flow={0.001483,0.001492,0.001501}, dp={151300,151100,150900}),
      use_powerCharacteristic=true,
      power(V_flow={0,0.001483,0.001492,0.001501}, P={0,1200,1201,1202})),
    inputType=Buildings.Fluid.Types.InputType.Continuous,
    addPowerToMedium=false,
    dp_nominal(displayUnit="kPa") = 151200)
    annotation (Placement(transformation(extent={{58,296},{78,316}})));

  Buildings.Fluid.FixedResistances.Junction jun12(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={-2,1,1},
    dp_nominal={0,0,0})
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-82,238})));
  Buildings.Fluid.FixedResistances.Junction jun13(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={2,-1,-1},
    dp_nominal={0,0,0})
    annotation (Placement(transformation(extent={{10,10},{-10,-10}},
        rotation=90,
        origin={160,238})));
  Buildings.Fluid.FixedResistances.PressureDrop HXBypass(
    redeclare package Medium = Buildings.Media.Water,
    allowFlowReversal=false,
    m_flow_nominal=0.6,
    dp_nominal=148000,
    deltaM=0.2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={26,238})));
  Buildings.Fluid.Movers.SpeedControlled_y pump3test(redeclare package Medium =
        Buildings.Media.Water, per(
      pressure(V_flow={0.000828,0.001032,0.001235,0.001440,0.001644}, dp={
            147700,147600,147400,147100,146700}),
      use_powerCharacteristic=true,
      power(V_flow={0.000828,0.001032,0.001235,0.001440,0.001644}, P={731,769,
            807,844,882}))) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={160,268})));
  Buildings.Fluid.FixedResistances.CheckValve cheVal(
    redeclare package Medium = Buildings.Media.Water,
    allowFlowReversal=false,
    m_flow_nominal=10,
    dpValve_nominal=0.1)
    annotation (Placement(transformation(extent={{108,228},{88,248}})));
  Buildings.Fluid.FixedResistances.Junction jun16(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={-2,1,1},
    dp_nominal={0,0,0})
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-62,188})));
  Buildings.Fluid.FixedResistances.Junction jun17(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={2,-1,-1},
    dp_nominal={0,0,0})
    annotation (Placement(transformation(extent={{10,10},{-10,-10}},
        rotation=0,
        origin={114,188})));
  Buildings.Fluid.Actuators.Valves.TwoWayEqualPercentage AHU2Valve(
    redeclare package Medium = Buildings.Media.Water,
    allowFlowReversal=false,
    m_flow_nominal=0.45,
    dpValve_nominal=17100,
    l=0.00012,
    R=50,
    delta0=0.013)
    annotation (Placement(transformation(extent={{54,178},{34,198}})));
  Buildings.Fluid.FixedResistances.CheckValve cheVal4(
    redeclare package Medium = Buildings.Media.Water,
    allowFlowReversal=false,
    m_flow_nominal=10,
    dpValve_nominal=0.1)
    annotation (Placement(transformation(extent={{88,178},{68,198}})));
  Buildings.Fluid.FixedResistances.CheckValve cheVal5(
    redeclare package Medium = Buildings.Media.Water,
    allowFlowReversal=false,
    m_flow_nominal=10,
    dpValve_nominal=0.1)
    annotation (Placement(transformation(extent={{92,218},{72,238}})));
  Buildings.Fluid.Actuators.Valves.TwoWayEqualPercentage AHU1Valve(
    redeclare package Medium = Buildings.Media.Water,
    allowFlowReversal=false,
    m_flow_nominal=0.45,
    dpValve_nominal=125700,
    l=0.00008,
    R=50,
    delta0=0.004)
    annotation (Placement(transformation(extent={{52,218},{32,238}})));
  Buildings.Fluid.Sensors.MassFlowRate senMasFlo(redeclare package Medium =
        Buildings.Media.Water)
    annotation (Placement(transformation(extent={{112,326},{132,346}})));
  Buildings.Fluid.Sensors.MassFlowRate senMasFlo1(redeclare package Medium =
        Buildings.Media.Water)
    annotation (Placement(transformation(extent={{94,296},{114,316}})));
  Buildings.Fluid.Sensors.MassFlowRate senMasFlo2(redeclare package Medium =
        Buildings.Media.Water)
    annotation (Placement(transformation(extent={{90,260},{70,280}})));
  Buildings.Fluid.Sensors.MassFlowRate senMasFlo3(redeclare package Medium =
        Buildings.Media.Water)
    annotation (Placement(transformation(extent={{-34,228},{-54,248}})));
  Buildings.Fluid.Sensors.MassFlowRate senMasFlo4(redeclare package Medium =
        Buildings.Media.Water)
    annotation (Placement(transformation(extent={{-10,208},{-30,228}})));
  Buildings.Fluid.Sensors.MassFlowRate senMasFlo5(redeclare package Medium =
        Buildings.Media.Water)
    annotation (Placement(transformation(extent={{-28,178},{-48,198}})));
  Modelica.Blocks.Interfaces.RealOutput Ch1Pump_Power
    annotation (Placement(transformation(extent={{326,366},{346,386}})));
  Modelica.Blocks.Interfaces.RealOutput Ch2Pump_Power
    annotation (Placement(transformation(extent={{326,344},{346,364}})));
  Modelica.Blocks.Interfaces.RealOutput SLPump_Power
    annotation (Placement(transformation(extent={{326,328},{346,348}})));
  Modelica.Blocks.Interfaces.RealOutput Ch1_f
    annotation (Placement(transformation(extent={{326,292},{346,312}})));
  Modelica.Blocks.Interfaces.RealOutput Ch2_f
    annotation (Placement(transformation(extent={{326,272},{346,292}})));
  Modelica.Blocks.Interfaces.RealOutput Bypass_f
    annotation (Placement(transformation(extent={{326,252},{346,272}})));
  Modelica.Blocks.Interfaces.RealOutput HX_f
    annotation (Placement(transformation(extent={{326,234},{346,254}})));
  Modelica.Blocks.Interfaces.RealOutput AHU1_f
    annotation (Placement(transformation(extent={{326,214},{346,234}})));
  Modelica.Blocks.Interfaces.RealOutput AHU2_f
    annotation (Placement(transformation(extent={{326,196},{346,216}})));
  Modelica.Blocks.Interfaces.RealInput Ch1_status
    annotation (Placement(transformation(extent={{-250,414},{-210,454}})));
  Modelica.Blocks.Interfaces.RealInput Ch2_status
    annotation (Placement(transformation(extent={{-250,384},{-210,424}})));
  Modelica.Blocks.Interfaces.RealInput Ch1Pump_m
    annotation (Placement(transformation(extent={{-250,338},{-210,378}})));
  Modelica.Blocks.Interfaces.RealInput Ch2Pump_m
    annotation (Placement(transformation(extent={{-250,308},{-210,348}})));
  Modelica.Blocks.Interfaces.RealInput SLPump_v
    annotation (Placement(transformation(extent={{-250,278},{-210,318}})));
  Modelica.Blocks.Interfaces.RealInput AHU1Valve_y
    annotation (Placement(transformation(extent={{-252,232},{-212,272}})));
  Modelica.Blocks.Interfaces.RealInput AHU2Valve_y
    annotation (Placement(transformation(extent={{-252,200},{-212,240}})));
  Buildings.Fluid.Chillers.ElectricEIR chi1(
    redeclare package Medium1 = Buildings.Media.Water,
    redeclare package Medium2 = Buildings.Media.Antifreeze.PropyleneGlycolWater
        (property_T=293.15, X_a=0.40),
    m1_flow_nominal=1.467,
    m2_flow_nominal=1,
    per=per1,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    dp1_nominal=221100,
    dp2_nominal=0) "Chiller model"
    annotation (Placement(transformation(extent={{20,336},{0,356}})));
  Buildings.Fluid.Chillers.ElectricEIR chi2(
    redeclare package Medium1 = Buildings.Media.Water,
    redeclare package Medium2 = Buildings.Media.Antifreeze.PropyleneGlycolWater
        (property_T=293.15, X_a=0.40),
    m1_flow_nominal=2.167,
    m2_flow_nominal=1,
    per=per2,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    dp1_nominal=197500,
    dp2_nominal=0) "Chiller model"
    annotation (Placement(transformation(extent={{16,296},{-4,316}})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear val7(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=1,
    dpValve_nominal=100,
    riseTime=120)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={40,360})));
  Buildings.Fluid.Movers.FlowControlled_m_flow pump1(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    m_flow_nominal=2.167,
    per(
      pressure(V_flow={0.001420,0.001450,0.001481,0.002110,0.002159,0.002208},
          dp={222600,221600,220600,199500,197800,196200}),
      use_powerCharacteristic=true,
      power(V_flow={0.001420,0.001450,0.001481,0.002110,0.002159,0.002208}, P={
            2061,2071,2082,2300,2317,2334})),
    inputType=Buildings.Fluid.Types.InputType.Continuous,
    addPowerToMedium=false,
    dp_nominal(displayUnit="kPa") = 197500)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={70,398})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear val8(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=1,
    dpValve_nominal=100,
    riseTime=120)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={40,316})));
  Buildings.Fluid.FixedResistances.Junction jun20(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={2,-1,-1},
    dp_nominal={0,0,0})
    annotation (Placement(transformation(extent={{10,10},{-10,-10}},
        rotation=90,
        origin={70,372})));
  Buildings.Fluid.FixedResistances.Junction jun21(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={-2,1,1},
    dp_nominal={0,0,0})
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-14,360})));
  Buildings.Fluid.Sources.Boundary_pT sin5(redeclare package Medium =
        Buildings.Media.Water, nPorts=1)
                                        annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        origin={-14,394},
        rotation=90)));
  Buildings.Fluid.Sources.Boundary_pT bou2(
    redeclare package Medium = Buildings.Media.Water,
    p(displayUnit="Pa") = 300000,
    use_T_in=true,
    nPorts=1)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={70,422})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant2(k=true)
    annotation (Placement(transformation(extent={{-162,386},{-142,406}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant3(k=true)
    annotation (Placement(transformation(extent={{-160,418},{-140,438}})));
  Modelica.Blocks.Interfaces.RealInput Teva_out_set_chiller1 annotation (
      Placement(transformation(extent={{-164,362},{-146,380}}),
        iconTransformation(extent={{-180,54},{-162,72}})));
  Modelica.Blocks.Interfaces.RealInput Teva_out_set_chiller2 annotation (
      Placement(transformation(extent={{-164,330},{-146,348}}),
        iconTransformation(extent={{-180,54},{-162,72}})));
  Modelica.Blocks.Interfaces.RealInput Tw annotation (Placement(transformation(
          extent={{-236,494},{-218,512}}), iconTransformation(extent={{-180,54},
            {-162,72}})));
  Modelica.Blocks.Interfaces.RealInput m_pump_conden annotation (Placement(
        transformation(extent={{-228,464},{-210,482}}), iconTransformation(
          extent={{-180,54},{-162,72}})));
  Buildings.Fluid.Sensors.Temperature senTem28(redeclare package Medium =
        Buildings.Media.Antifreeze.PropyleneGlycolWater (property_T=293.15, X_a=
           0.40))
    annotation (Placement(transformation(extent={{140,384},{160,404}})));
  Buildings.Fluid.Sensors.Temperature senTem29(redeclare package Medium =
        Buildings.Media.Antifreeze.PropyleneGlycolWater (property_T=293.15, X_a=
           0.40))
    annotation (Placement(transformation(extent={{138,356},{158,376}})));
  Modelica.Blocks.Interfaces.RealOutput Tw_Ch1_outlet
    annotation (Placement(transformation(extent={{370,304},{390,324}})));
  Modelica.Blocks.Interfaces.RealOutput Tw_Ch2_outlet
    annotation (Placement(transformation(extent={{370,264},{390,284}})));
  Buildings.Fluid.Sensors.Temperature senTem30(redeclare package Medium =
        Buildings.Media.Antifreeze.PropyleneGlycolWater (property_T=293.15, X_a=
           0.40))
    annotation (Placement(transformation(extent={{-56,362},{-36,382}})));
  Buildings.Fluid.Sensors.Temperature senTem31(redeclare package Medium =
        Buildings.Media.Antifreeze.PropyleneGlycolWater (property_T=293.15, X_a=
           0.40))
    annotation (Placement(transformation(extent={{-68,354},{-48,374}})));
  Modelica.Blocks.Interfaces.RealOutput Tw_Ch1_inlet
    annotation (Placement(transformation(extent={{368,332},{388,352}})));
  Modelica.Blocks.Interfaces.RealOutput Tw_Ch2_inlet
    annotation (Placement(transformation(extent={{374,286},{394,306}})));
  parameter
    Buildings.Fluid.Chillers.Data.ElectricEIR.ElectricEIRChiller_McQuay_WSC_471kW_5_89COP_Vanes
    per2(
    QEva_flow_nominal=-37800,
    COP_nominal=6,
    PLRMax=1.012,
    PLRMinUnl=0.124,
    PLRMin=0.124,
    mEva_flow_nominal=1.5,
    mCon_flow_nominal=2.2,
    TEvaLvg_nominal=281.85,
    capFunT={0.5681,0.0451,-0.0011,0,0,0},
    EIRFunT={2.1794,-0.0482,0.0007,0,0,0},
    EIRFunPLR={0.2287,-0.6274,1.4211},
    TEvaLvgMin=276.52,
    TEvaLvgMax=289.15,
    TConEnt_nominal=302.55,
    TConEntMin=302.59,
    TConEntMax=303.71) "Chiller performance data"
    annotation (Placement(transformation(extent={{278,426},{298,446}})));
  parameter
    Buildings.Fluid.Chillers.Data.ElectricEIR.ElectricEIRChiller_McQuay_WSC_471kW_5_89COP_Vanes
    per1(
    QEva_flow_nominal=-26400,
    COP_nominal=4.4,
    PLRMax=1.022,
    PLRMinUnl=0.10,
    PLRMin=0.10,
    mEva_flow_nominal=0.9464,
    mCon_flow_nominal=1.4511,
    TEvaLvg_nominal=280.93,
    capFunT={0.7518,0.0225,0.0001,0,0,0},
    EIRFunT={1.9627,-0.0577,0.0012,0,0,0},
    EIRFunPLR={0.0432,0.2404,0.8034},
    TEvaLvgMin=278.15,
    TEvaLvgMax=281.48,
    TConEnt_nominal=302.55,
    TConEntMin=302.59,
    TConEntMax=303.71) "Chiller performance data"
    annotation (Placement(transformation(extent={{276,460},{296,480}})));
  Buildings.Fluid.Sources.Boundary_pT sou5(
    redeclare package Medium = Buildings.Media.Water,
    use_p_in=false,
    p(displayUnit="Pa") = 300000,
    T=293.15,
    nPorts=1) annotation (Placement(transformation(extent={{218,130},{198,150}})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear val2(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=1,
    deltaM=1,
    dpValve_nominal=1000000,
    riseTime=1,
    l=0.0000000001)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={156,158})));
  Buildings.Fluid.FixedResistances.Junction jun14(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={2,-1,-1},
    dp_nominal={0,0,0})
    annotation (Placement(transformation(extent={{10,10},{-10,-10}},
        rotation=90,
        origin={158,186})));
  Buildings.Fluid.Sources.Boundary_pT sou4(
    redeclare package Medium = Buildings.Media.Water,
    use_p_in=false,
    p(displayUnit="Pa") = 300000,
    T=293.15,
    nPorts=1) annotation (Placement(transformation(extent={{-122,112},{-102,132}})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear val1(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=1,
    deltaM=1,
    dpValve_nominal=100000,
    riseTime=1,
    l=0.0000000001)
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-88,146})));
  Buildings.Fluid.FixedResistances.Junction jun15(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={-2,1,1},
    dp_nominal={0,0,0})
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-88,188})));
  Modelica.Blocks.Sources.Constant const6(k=0.001)
    annotation (Placement(transformation(extent={{-82,106},{-62,126}})));
  Modelica.Blocks.Interfaces.RealOutput CondPump_Power
    annotation (Placement(transformation(extent={{326,316},{346,336}})));
  Modelica.Blocks.Interfaces.RealOutput Chiller1_Power
    annotation (Placement(transformation(extent={{390,232},{410,252}})));
  Modelica.Blocks.Interfaces.RealOutput Chiller2_Power
    annotation (Placement(transformation(extent={{388,208},{408,228}})));
equation
  connect(AHU2FanSup.port_b,jun. port_1)
    annotation (Line(points={{-8,-362},{6,-362}},color={0,127,255}));
  connect(jun2.port_1,jun3. port_1)
    annotation (Line(points={{172,-362},{184,-362}},
                                               color={0,127,255}));
  connect(AHU1FanSup.port_b,jun4. port_1)
    annotation (Line(points={{-8,-436},{6,-436}},  color={0,127,255}));
  connect(jun6.port_1,jun7. port_1)
    annotation (Line(points={{172,-436},{184,-436}},
                                               color={0,127,255}));
  connect(m_AHU1_EA.port_b,bou1. ports[1]) annotation (Line(points={{250,-362},
          {262,-362},{262,-404},{268,-404}},
                                        color={0,127,255}));
  connect(m_AHU2_EA.port_b,bou1. ports[2]) annotation (Line(points={{248,-436},
          {262,-436},{262,-408},{268,-408}},
                                         color={0,127,255}));
  connect(jun3.port_3,m_AHU1_RA. port_b)
    annotation (Line(points={{194,-352},{194,-330},{-6,-330}},
                                                         color={0,127,255}));
  connect(m_AHU2_RA.port_b,jun7. port_3) annotation (Line(points={{-6,-488},{
          194,-488},{194,-446}},color={0,127,255}));
  connect(AHU2FanSup.port_b,senPre1. port)
    annotation (Line(points={{-8,-362},{-1,-362}},
                                                 color={0,127,255}));
  connect(AHU1FanSup.port_b,senPre3. port)
    annotation (Line(points={{-8,-436},{-1,-436}}, color={0,127,255}));
  connect(m_AHU2_EA.port_b,senPre6. port) annotation (Line(points={{248,-436},{
          262,-436},{262,-425}},
                               color={0,127,255}));
  connect(m_AHU1_EA.port_b,senPre7. port)
    annotation (Line(points={{250,-362},{262,-362},{262,-387}},
                                                           color={0,127,255}));
  connect(DamperAHU2RA.port_b,m_AHU1_RA. port_a) annotation (Line(points={{-36,
          -322},{-26,-322},{-26,-330},{-16,-330}},
                                           color={0,127,255}));
  connect(DamperAHU2RA.port_a,jun1. port_3)
    annotation (Line(points={{-56,-322},{-80,-322},{-80,-352}},
                                                           color={0,127,255}));
  connect(DamperAHU2SA.port_b,jun1. port_1)
    annotation (Line(points={{-100,-362},{-90,-362}},
                                                   color={0,127,255}));
  connect(DamperAHU2SA.port_a,m_AHU1_SA. port_b)
    annotation (Line(points={{-120,-362},{-126,-362}},
                                                   color={0,127,255}));
  connect(jun3.port_2,DamperAHU2EA. port_a)
    annotation (Line(points={{204,-362},{212,-362}},
                                                 color={0,127,255}));
  connect(DamperAHU2EA.port_b,m_AHU1_EA. port_a)
    annotation (Line(points={{232,-362},{240,-362}},
                                                 color={0,127,255}));
  connect(jun.port_2,DamVAV1. port_a)
    annotation (Line(points={{26,-362},{42,-362}},
                                               color={0,127,255}));
  connect(DamVAV1.port_b,m_VAV1. port_a)
    annotation (Line(points={{62,-362},{74,-362}},
                                               color={0,127,255}));
  connect(jun.port_3,DamVAV2. port_a) annotation (Line(points={{16,-372},{26,
          -372},{26,-392},{38,-392}},
                                   color={0,127,255}));
  connect(DamVAV2.port_b,m_VAV2. port_a)
    annotation (Line(points={{58,-392},{72,-392}},
                                                color={0,127,255}));
  connect(DamperAHU1SA.port_b,jun5. port_1)
    annotation (Line(points={{-100,-436},{-90,-436}},color={0,127,255}));
  connect(m_AHU2_SA.port_b,DamperAHU1SA. port_a)
    annotation (Line(points={{-126,-436},{-120,-436}},
                                                     color={0,127,255}));
  connect(jun5.port_3,DamperAHU1RA. port_a) annotation (Line(points={{-80,-446},
          {-80,-488},{-58,-488}},  color={0,127,255}));
  connect(DamperAHU1RA.port_b,m_AHU2_RA. port_a)
    annotation (Line(points={{-38,-488},{-16,-488}}, color={0,127,255}));
  connect(jun7.port_2,DamperAHU1EA. port_a)
    annotation (Line(points={{204,-436},{210,-436}},
                                                   color={0,127,255}));
  connect(DamperAHU1EA.port_b,m_AHU2_EA. port_a)
    annotation (Line(points={{230,-436},{238,-436}},
                                                   color={0,127,255}));
  connect(jun4.port_2,DamVAV3. port_a)
    annotation (Line(points={{26,-436},{42,-436}},
                                                 color={0,127,255}));
  connect(DamVAV3.port_b,m_VAV3. port_a)
    annotation (Line(points={{62,-436},{70,-436}},
                                                 color={0,127,255}));
  connect(jun4.port_3,DamVAV4. port_a) annotation (Line(points={{16,-446},{16,
          -466},{42,-466}}, color={0,127,255}));
  connect(m_AHU1_air.port,AHU2FanSup. port_a)
    annotation (Line(points={{-37,-362},{-28,-362}},
                                                 color={0,127,255}));
  connect(m_AHU2_air.port,AHU1FanSup. port_a)
    annotation (Line(points={{-31,-436},{-28,-436}},
                                                   color={0,127,255}));
  connect(Air_AHU2_out.ports[1],m_AHU1_SA. port_a) annotation (Line(points={{-178,
          -360},{-158,-360},{-158,-362},{-136,-362}},
                                              color={0,127,255}));
  connect(Air_AHU1_out.ports[1],m_AHU2_SA. port_a)
    annotation (Line(points={{-178,-434},{-158,-434},{-158,-436},{-136,-436}},
                                                     color={0,127,255}));
  connect(senTem.port,Air_AHU2_out. ports[2]) annotation (Line(points={{-154,
          -360},{-154,-364},{-178,-364}},
                                color={0,127,255}));
  connect(senTem1.port,Air_AHU1_out. ports[2]) annotation (Line(points={{-152,
          -446},{-152,-438},{-178,-438}},
                                       color={0,127,255}));
  connect(senTem2.port,m_AHU1_RA. port_b) annotation (Line(points={{158,-316},{
          160,-316},{160,-330},{-6,-330}},
                                      color={0,127,255}));
  connect(senTem3.port,jun7. port_3) annotation (Line(points={{74,-508},{64,
          -508},{64,-488},{194,-488},{194,-446}},color={0,127,255}));
  connect(senTem8.port,m_VAV1. port_a) annotation (Line(points={{70,-348},{68,
          -348},{68,-362},{74,-362}},
                           color={0,127,255}));
  connect(senTem9.port,m_VAV2. port_a)
    annotation (Line(points={{66,-386},{66,-392},{72,-392}},
                                                          color={0,127,255}));
  connect(senTem10.port,m_VAV3. port_a)
    annotation (Line(points={{70,-428},{70,-436}},        color={0,127,255}));
  connect(senTem12.port,jun2. port_2) annotation (Line(points={{136,-346},{144,
          -346},{144,-362},{152,-362}},
                             color={0,127,255}));
  connect(senTem13.port,jun2. port_3) annotation (Line(points={{138,-378},{152,
          -378},{152,-372},{162,-372}},
                                     color={0,127,255}));
  connect(senTem14.port,jun6. port_2) annotation (Line(points={{138,-420},{146,
          -420},{146,-436},{152,-436}},
                               color={0,127,255}));
  connect(senTem15.port,jun6. port_3) annotation (Line(points={{140,-462},{152,
          -462},{152,-446},{162,-446}},
                                      color={0,127,255}));
  connect(senTem16.port,m_AHU1_EA. port_a) annotation (Line(points={{234,-346},
          {236,-346},{236,-362},{240,-362}},
                                      color={0,127,255}));
  connect(senTem17.port,m_AHU2_EA. port_a) annotation (Line(points={{236,-422},
          {236,-436},{238,-436}},
                               color={0,127,255}));
  connect(senMasFra1.port,m_AHU2_SA. port_a) annotation (Line(points={{-142,
          -424},{-140,-424},{-140,-436},{-136,-436}},
                                             color={0,127,255}));
  connect(senMasFra.port,m_AHU1_SA. port_a) annotation (Line(points={{-148,-384},
          {-142,-384},{-142,-362},{-136,-362}},
                                           color={0,127,255}));
  connect(senMasFra4.port,m_VAV1. port_a) annotation (Line(points={{84,-348},{
          76,-348},{76,-362},{74,-362}},
                            color={0,127,255}));
  connect(senMasFra5.port,m_VAV2. port_b) annotation (Line(points={{86,-386},{
          84,-386},{84,-392},{82,-392}},
                                   color={0,127,255}));
  connect(senMasFra6.port,m_VAV3. port_b) annotation (Line(points={{94,-432},{
          88,-432},{88,-436},{80,-436}},
                                   color={0,127,255}));
  connect(AHU2coil.port_a2,m_AHU1_air. port) annotation (Line(points={{-48,
          -359.6},{-44,-359.6},{-44,-362},{-37,-362}},
                                               color={0,127,255}));
  connect(AHU2coil.port_b2,jun1. port_2) annotation (Line(points={{-62,-359.6},
          {-66,-359.6},{-66,-362},{-70,-362}},
                                           color={0,127,255}));
  connect(senTem4.port,jun1. port_2) annotation (Line(points={{-88,-346},{-70,
          -346},{-70,-362}},
                          color={0,127,255}));
  connect(senTem5.port,AHU2coil. port_a2) annotation (Line(points={{-38,-378},{
          -44,-378},{-44,-359.6},{-48,-359.6}},
                                            color={0,127,255}));
  connect(senMasFra2.port,AHU2coil. port_a2) annotation (Line(points={{-54,-382},
          {-48,-382},{-48,-359.6}},color={0,127,255}));
  connect(AHU1coil.port_b2,jun5. port_2) annotation (Line(points={{-54,-435.2},
          {-62,-435.2},{-62,-436},{-70,-436}}, color={0,127,255}));
  connect(AHU1coil.port_a2,m_AHU2_air. port) annotation (Line(points={{-40,
          -435.2},{-36,-435.2},{-36,-436},{-31,-436}},
                                                   color={0,127,255}));
  connect(senMasFra3.port,AHU1coil. port_a2) annotation (Line(points={{-52,-450},
          {-44,-450},{-44,-435.2},{-40,-435.2}},
                                              color={0,127,255}));
  connect(senTem7.port,AHU1coil. port_a2) annotation (Line(points={{-34,-452},{
          -38,-452},{-38,-435.2},{-40,-435.2}},
                                             color={0,127,255}));
  connect(senTem6.port,AHU1coil. port_b2) annotation (Line(points={{-72,-430},{
          -64,-430},{-64,-435.2},{-54,-435.2}}, color={0,127,255}));
  connect(m_VAV1.port_b,VAV1. ports[1]) annotation (Line(points={{84,-362},{100,
          -362},{100,-362.7},{116.475,-362.7}},
                                    color={0,127,255}));
  connect(VAV1.ports[2],jun2. port_2) annotation (Line(points={{112.425,-362.7},
          {133.225,-362.7},{133.225,-362},{152,-362}},
                                              color={0,127,255}));
  connect(m_VAV2.port_b,VAV2. ports[1]) annotation (Line(points={{82,-392},{100,
          -392},{100,-390.7},{116.475,-390.7}},
                                           color={0,127,255}));
  connect(VAV2.ports[2],jun2. port_3) annotation (Line(points={{112.425,-390.7},
          {162.225,-390.7},{162.225,-372},{162,-372}},
                                                   color={0,127,255}));
  connect(m_VAV3.port_b,VAV3. ports[1]) annotation (Line(points={{80,-436},{100,
          -436},{100,-438.7},{120.475,-438.7}},
                                           color={0,127,255}));
  connect(VAV3.ports[2],jun6. port_2) annotation (Line(points={{116.425,-438.7},
          {136.225,-438.7},{136.225,-436},{152,-436}},
                                                 color={0,127,255}));
  connect(VAV4.ports[1],jun6. port_3) annotation (Line(points={{116.475,-468.7},
          {161.225,-468.7},{161.225,-446},{162,-446}},
                                                     color={0,127,255}));
  connect(AHU2FanSup.P,Power_ahu2_fan)  annotation (Line(points={{-7,-353},{76,
          -353},{76,-352},{158,-352},{158,-328},{326,-328},{326,-306},{360,-306}},
                                              color={0,0,127}));
  connect(AHU1FanSup.P,Power_ahu1_fan)  annotation (Line(points={{-7,-427},{166,
          -427},{166,-428},{302,-428},{302,-322},{360,-322}},
                                                       color={0,0,127}));
  connect(m_VAV1.m_flow,m_vav1)  annotation (Line(points={{79,-357.6},{84,
          -357.6},{84,-358},{90,-358},{90,-350},{202,-350},{202,-344},{286,-344},
          {286,-348},{360,-348}},
                              color={0,0,127}));
  connect(senTem8.T,T_vav1)  annotation (Line(points={{74.2,-342},{216,-342},{
          216,-366},{362,-366}},
                           color={0,0,127}));
  connect(senMasFra4.X,w_vav1)  annotation (Line(points={{90.6,-342},{150,-342},
          {150,-344},{208,-344},{208,-386},{362,-386}},
                               color={0,0,127}));
  connect(m_VAV2.m_flow,m_vav2)  annotation (Line(points={{77,-387.6},{214.5,
          -387.6},{214.5,-408},{360,-408}},
                                         color={0,0,127}));
  connect(senTem9.T,T_vav2)  annotation (Line(points={{70.2,-380},{212,-380},{
          212,-426},{362,-426}},
                           color={0,0,127}));
  connect(senMasFra5.X,w_vav2)  annotation (Line(points={{92.6,-380},{222,-380},
          {222,-446},{362,-446}},
                               color={0,0,127}));
  connect(m_VAV3.m_flow,m_vav3)  annotation (Line(points={{75,-431.6},{213.5,
          -431.6},{213.5,-462},{358,-462}},color={0,0,127}));
  connect(senTem10.T,T_vav3)  annotation (Line(points={{74.2,-422},{216,-422},{
          216,-480},{360,-480}}, color={0,0,127}));
  connect(senMasFra6.X,w_vav3)  annotation (Line(points={{100.6,-426},{226,-426},
          {226,-500},{360,-500}},color={0,0,127}));
  connect(senTem11.T,T_vav4)  annotation (Line(points={{80.2,-454},{215.1,-454},
          {215.1,-536},{364,-536}},color={0,0,127}));
  connect(senMasFra7.X,w_vav4)  annotation (Line(points={{96.6,-448},{228,-448},
          {228,-556},{364,-556}},color={0,0,127}));
  connect(m_AHU1_EA.m_flow,m_ahu2_EA)  annotation (Line(points={{245,-357.6},{
          324.5,-357.6},{324.5,-384},{408,-384}},
                                              color={0,0,127}));
  connect(m_AHU1_RA.m_flow,m_ahu2_RA)  annotation (Line(points={{-11,-325.6},{
          196.5,-325.6},{196.5,-366},{408,-366}},
                                              color={0,0,127}));
  connect(m_AHU1_SA.m_flow,m_ahu2_SA)  annotation (Line(points={{-131,-357.6},{
          -18,-357.6},{-18,-358},{94,-358},{94,-336},{270,-336},{270,-350},{408,
          -350}},                       color={0,0,127}));
  connect(m_AHU2_EA.m_flow,m_ahu1_EA)  annotation (Line(points={{243,-431.6},{
          330.5,-431.6},{330.5,-486},{422,-486}},color={0,0,127}));
  connect(m_AHU2_RA.m_flow,m_ahu1_RA)  annotation (Line(points={{-11,-483.6},{
          198.5,-483.6},{198.5,-462},{414,-462}}, color={0,0,127}));
  connect(m_AHU2_SA.m_flow,m_ahu1_SA)  annotation (Line(points={{-131,-431.6},{
          139.5,-431.6},{139.5,-442},{416,-442}},
                                             color={0,0,127}));
  connect(senTem.T,T_ahu2_SA)  annotation (Line(points={{-149.8,-354},{10,-354},
          {10,-332},{470,-332},{470,-348}},
                                 color={0,0,127}));
  connect(senTem2.T,T_ahu2_RA)  annotation (Line(points={{162.2,-310},{208,-310},
          {208,-326},{474,-326},{474,-364}},
                                      color={0,0,127}));
  connect(senTem16.T,T_ahu2_EA)  annotation (Line(points={{238.2,-340},{354,
          -340},{354,-382},{474,-382}},
                               color={0,0,127}));
  connect(senTem17.T,T_ahu1_EA)  annotation (Line(points={{240.2,-416},{356,
          -416},{356,-476},{480,-476}},
                                  color={0,0,127}));
  connect(senTem3.T,T_ahu1_RA)  annotation (Line(points={{78.2,-502},{270,-502},
          {270,-460},{472,-460}}, color={0,0,127}));
  connect(senTem1.T,T_ahu1_SA)  annotation (Line(points={{-147.8,-440},{-26,
          -440},{-26,-504},{476,-504},{476,-442}},
                                            color={0,0,127}));
  connect(senMasFra8.port,jun1. port_2) annotation (Line(points={{-74,-386},{
          -72,-386},{-72,-362},{-70,-362}},
                                          color={0,127,255}));
  connect(senMasFra9.port,AHU1coil. port_b2) annotation (Line(points={{-66,-460},
          {-60,-460},{-60,-435.2},{-54,-435.2}},        color={0,127,255}));
  connect(senTem4.T,T_ahu2coil_ain)  annotation (Line(points={{-83.8,-340},{26,
          -340},{26,-320},{542,-320},{542,-344}},
                                           color={0,0,127}));
  connect(senMasFra8.X,w_ahu2coil_ain)  annotation (Line(points={{-67.4,-380},{
          -46,-380},{-46,-384},{544,-384},{544,-368}},
                                                   color={0,0,127}));
  connect(senTem5.T,T_ahu2coil_aout)  annotation (Line(points={{-33.8,-372},{
          -12,-372},{-12,-342},{624,-342},{624,-340}},
                                          color={0,0,127}));
  connect(senMasFra2.X,w_ahu2coil_aout)  annotation (Line(points={{-47.4,-376},
          {-16,-376},{-16,-390},{628,-390},{628,-372}},
                                                   color={0,0,127}));
  connect(senTem6.T,T_ahu1coil_ain)  annotation (Line(points={{-67.8,-424},{-66,
          -424},{-66,-412},{240,-412},{240,-434},{546,-434}},
                                   color={0,0,127}));
  connect(senMasFra9.X,w_ahu1coil_ain)  annotation (Line(points={{-59.4,-454},{
          6,-454},{6,-472},{546,-472},{546,-454}}, color={0,0,127}));
  connect(senTem7.T,T_ahu1coil_aout)  annotation (Line(points={{-29.8,-446},{74,
          -446},{74,-428},{630,-428}},
                                    color={0,0,127}));
  connect(senMasFra3.X,w_ahu1coil_aout)  annotation (Line(points={{-45.4,-444},
          {-8,-444},{-8,-458},{632,-458},{632,-448}},color={0,0,127}));
  connect(senTem11.port,DamVAV4. port_b) annotation (Line(points={{76,-460},{70,
          -460},{70,-466},{62,-466}}, color={0,127,255}));
  connect(senMasFra7.port,DamVAV4. port_b) annotation (Line(points={{90,-454},{
          78,-454},{78,-466},{62,-466}}, color={0,127,255}));
  connect(DamVAV4.port_b,m_VAV4. port_a)
    annotation (Line(points={{62,-466},{82,-466}}, color={0,127,255}));
  connect(m_VAV4.port_b,VAV4. ports[2]) annotation (Line(points={{92,-466},{102,
          -466},{102,-468.7},{112.425,-468.7}},
                                              color={0,127,255}));
  connect(m_VAV4.m_flow,m_vav4)  annotation (Line(points={{87,-461.6},{220.5,
          -461.6},{220.5,-518},{362,-518}}, color={0,0,127}));
  connect(AHU2F,AHU2FanSup. y)
    annotation (Line(points={{-388,-224},{-18,-224},{-18,-350}},
                                                            color={0,0,127}));
  connect(AHU1F,AHU1FanSup. y) annotation (Line(points={{-388,-254},{-180,-254},
          {-180,-394},{-100,-394},{-100,-424},{-18,-424}},
                                color={0,0,127}));
  connect(AHU2SAD,DamperAHU2SA. y)
    annotation (Line(points={{-390,-294},{-110,-294},{-110,-350}},
                                                            color={0,0,127}));
  connect(AHU2RAD,DamperAHU2RA. y) annotation (Line(points={{-388,-324},{-256,
          -324},{-256,-282},{-46,-282},{-46,-310}},
                                        color={0,0,127}));
  connect(DamperAHU2EA.y,AHU2EAD)  annotation (Line(points={{222,-350},{222,
          -338},{-24,-338},{-24,-352},{-388,-352}},
                                     color={0,0,127}));
  connect(AHU1SAD,DamperAHU1SA. y) annotation (Line(points={{-352,-312},{-120,
          -312},{-120,-404},{-110,-404},{-110,-424}},
                                             color={0,0,127}));
  connect(AHU1RAD,DamperAHU1RA. y) annotation (Line(points={{-354,-342},{-268,
          -342},{-268,-466},{-48,-466},{-48,-476}},
                                                color={0,0,127}));
  connect(DamperAHU1EA.y,AHU1EAD)  annotation (Line(points={{220,-424},{220,
          -404},{4,-404},{4,-380},{-354,-380}},
                                           color={0,0,127}));
  connect(VAV3D,DamVAV3. y) annotation (Line(points={{-400,-444},{-174,-444},{
          -174,-424},{52,-424}},
                              color={0,0,127}));
  connect(VAV2D,DamVAV2. y) annotation (Line(points={{-400,-418},{16,-418},{16,
          -374},{48,-374},{48,-380}},
                                   color={0,0,127}));
  connect(VAV1D,DamVAV1. y) annotation (Line(points={{-400,-390},{-174,-390},{
          -174,-344},{52,-344},{52,-350}},
                                  color={0,0,127}));
  connect(VAV4D,DamVAV4. y) annotation (Line(points={{-400,-470},{-174,-470},{
          -174,-454},{52,-454}},
                              color={0,0,127}));
  connect(m_ahu2_OA,Air_AHU2_out. m_flow_in) annotation (Line(points={{-238,
          -334},{-220,-334},{-220,-354},{-200,-354}},
                                        color={0,0,127}));
  connect(T_ahu2_OA,Air_AHU2_out. T_in)
    annotation (Line(points={{-240,-358},{-200,-358}},
                                                   color={0,0,127}));
  connect(w_ahu2_OA,Air_AHU2_out. Xi_in[1]) annotation (Line(points={{-244,-384},
          {-224,-384},{-224,-366},{-200,-366}},
                                             color={0,0,127}));
  connect(m_ahu1_OA,Air_AHU1_out. m_flow_in) annotation (Line(points={{-246,
          -414},{-224,-414},{-224,-428},{-200,-428}},
                                             color={0,0,127}));
  connect(T_ahu1_OA,Air_AHU1_out. T_in) annotation (Line(points={{-246,-438},{
          -224,-438},{-224,-432},{-200,-432}},
                                            color={0,0,127}));
  connect(w_ahu1_OA,Air_AHU1_out. Xi_in[1]) annotation (Line(points={{-248,-462},
          {-224,-462},{-224,-440},{-200,-440}},
                                              color={0,0,127}));
  connect(VAV1.Qsen_flow,Qs_z1_ahu2)  annotation (Line(points={{101.8,-354},{
          101.8,-262},{178,-262},{178,-164},{140,-164}},
                                            color={0,0,127}));
  connect(VAV2.Qsen_flow,Qs_z2_ahu2)  annotation (Line(points={{101.8,-382},{
          170,-382},{170,-196},{138,-196}},
                                    color={0,0,127}));
  connect(VAV3.Qsen_flow,Qs_z1_ahu1)  annotation (Line(points={{105.8,-430},{
          174,-430},{174,-224},{140,-224}},
                                    color={0,0,127}));
  connect(VAV4.Qsen_flow,Qs_z2_ahu1)  annotation (Line(points={{101.8,-460},{
          208,-460},{208,-250},{142,-250}},
                                     color={0,0,127}));
  connect(VAV1.Qlat_flow,Ql_z1_ahu2)  annotation (Line(points={{102,-357.8},{88,
          -357.8},{88,-296},{248,-296},{248,-160},{206,-160}},
                                                       color={0,0,127}));
  connect(VAV2.Qlat_flow,Ql_z2_ahu2)  annotation (Line(points={{102,-385.8},{
          102,-386},{94,-386},{94,-288},{240,-288},{240,-188},{210,-188}},
                                                               color={0,0,127}));
  connect(Ql_z1_ahu1,VAV3. Qlat_flow) annotation (Line(points={{210,-214},{210,
          -324},{106,-324},{106,-433.8}},
                                   color={0,0,127}));
  connect(Ql_z2_ahu1,VAV4. Qlat_flow) annotation (Line(points={{208,-240},{156,
          -240},{156,-463.8},{102,-463.8}},
                                          color={0,0,127}));
  connect(senTem12.T,Tz_vav1)  annotation (Line(points={{140.2,-340},{154,-340},
          {154,-408},{408,-408},{408,-536},{440,-536}},
                                                 color={0,0,127}));
  connect(senTem13.T,Tz_vav2)  annotation (Line(points={{142.2,-372},{148,-372},
          {148,-370},{214,-370},{214,-554},{442,-554}},
                                 color={0,0,127}));
  connect(senTem14.T,Tz_vav3)  annotation (Line(points={{142.2,-414},{288,-414},
          {288,-572},{440,-572}},color={0,0,127}));
  connect(senTem15.T,Tz_vav4)  annotation (Line(points={{144.2,-456},{290,-456},
          {290,-592},{440,-592}}, color={0,0,127}));
  connect(senMasFra10.port,jun2. port_2) annotation (Line(points={{146,-318},{
          150,-318},{150,-362},{152,-362}},
                                 color={0,127,255}));
  connect(senMasFra10.X,wz_vav1)
    annotation (Line(points={{152.6,-312},{230,-312}},
                                                   color={0,0,127}));
  connect(wz_vav1,wz_vav1)
    annotation (Line(points={{230,-312},{230,-312}},
                                                 color={0,0,127}));
  connect(senMasFra11.port,jun2. port_3) annotation (Line(points={{170,-402},{
          166,-402},{166,-372},{162,-372}},
                                         color={0,127,255}));
  connect(senMasFra11.X,wz_vav2)
    annotation (Line(points={{176.6,-396},{206,-396}},
                                                     color={0,0,127}));
  connect(senMasFra12.port,jun6. port_2)
    annotation (Line(points={{152,-424},{152,-436}},
                                                   color={0,127,255}));
  connect(senMasFra12.X,wz_vav3)
    annotation (Line(points={{158.6,-418},{198,-418}},
                                                     color={0,0,127}));
  connect(senMasFra13.port,jun6. port_3) annotation (Line(points={{172,-476},{
          168,-476},{168,-446},{162,-446}},
                                          color={0,127,255}));
  connect(senMasFra13.X,wz_vav4)  annotation (Line(points={{178.6,-470},{192,
          -470},{192,-468},{212,-468}}, color={0,0,127}));
  connect(val4.port_a,jun9. port_2) annotation (Line(points={{-48,338},{-82,338},
          {-82,316}}, color={0,127,255}));
  connect(val3.port_a,jun9. port_3)
    annotation (Line(points={{-54,306},{-72,306}},color={0,127,255}));
  connect(jun11.port_1,jun9. port_1)
    annotation (Line(points={{-82,280},{-82,296}},   color={0,127,255}));
  connect(jun10.port_1,jun8. port_1)
    annotation (Line(points={{160,304},{160,308}},
                                                 color={0,127,255}));
  connect(Bypass.port_b,jun11. port_3)
    annotation (Line(points={{4,270},{-72,270}},    color={0,127,255}));
  connect(jun12.port_1,jun11. port_2)
    annotation (Line(points={{-82,248},{-82,260}},   color={0,127,255}));
  connect(jun10.port_2,pump3test. port_a)
    annotation (Line(points={{160,284},{160,278}},
                                                 color={0,127,255}));
  connect(pump3test.port_b,jun13. port_1)
    annotation (Line(points={{160,258},{160,248}},
                                                 color={0,127,255}));
  connect(HXBypass.port_a,cheVal. port_b)
    annotation (Line(points={{36,238},{88,238}},color={0,127,255}));
  connect(cheVal.port_a,jun13. port_3)
    annotation (Line(points={{108,238},{150,238}},
                                                 color={0,127,255}));
  connect(AHU2Valve.port_a,cheVal4. port_b)
    annotation (Line(points={{54,188},{68,188}},   color={0,127,255}));
  connect(cheVal4.port_a,jun17. port_2)
    annotation (Line(points={{88,188},{104,188}},  color={0,127,255}));
  connect(cheVal5.port_b,AHU1Valve. port_a)
    annotation (Line(points={{72,228},{52,228}}, color={0,127,255}));
  connect(cheVal5.port_a,jun17. port_3)
    annotation (Line(points={{92,228},{114,228},{114,198}},color={0,127,255}));
  connect(pump1test.port_b,senMasFlo. port_a)
    annotation (Line(points={{78,336},{112,336}},
                                               color={0,127,255}));
  connect(senMasFlo.port_b,jun8. port_2)
    annotation (Line(points={{132,336},{160,336},{160,328}},
                                                          color={0,127,255}));
  connect(pump2test.port_b,senMasFlo1. port_a)
    annotation (Line(points={{78,306},{94,306}},
                                               color={0,127,255}));
  connect(senMasFlo1.port_b,jun8. port_3) annotation (Line(points={{114,306},{
          132,306},{132,318},{150,318}},
                                   color={0,127,255}));
  connect(Bypass.port_a,senMasFlo2. port_b)
    annotation (Line(points={{24,270},{70,270}},
                                               color={0,127,255}));
  connect(senMasFlo2.port_a,jun10. port_3) annotation (Line(points={{90,270},{
          120,270},{120,294},{150,294}},
                                      color={0,127,255}));
  connect(jun12.port_3,senMasFlo3. port_b)
    annotation (Line(points={{-72,238},{-54,238}},   color={0,127,255}));
  connect(senMasFlo3.port_a,HXBypass. port_b)
    annotation (Line(points={{-34,238},{16,238}},  color={0,127,255}));
  connect(senMasFlo4.port_b,jun16. port_3) annotation (Line(points={{-30,218},{
          -62,218},{-62,198}},  color={0,127,255}));
  connect(jun16.port_2,senMasFlo5. port_b)
    annotation (Line(points={{-52,188},{-48,188}},   color={0,127,255}));
  connect(Ch1Pump_Power,pump1test. P) annotation (Line(points={{336,376},{106,
          376},{106,345},{79,345}},
                                 color={0,0,127}));
  connect(Ch2Pump_Power,pump2test. P) annotation (Line(points={{336,354},{110,
          354},{110,315},{79,315}},
                                 color={0,0,127}));
  connect(SLPump_Power,pump3test. P) annotation (Line(points={{336,338},{242,
          338},{242,156},{169,156},{169,257}}, color={0,0,127}));
  connect(Ch1_f,senMasFlo. m_flow) annotation (Line(points={{336,302},{234,302},
          {234,347},{122,347}},
                              color={0,0,127}));
  connect(Ch2_f,senMasFlo1. m_flow) annotation (Line(points={{336,282},{226,282},
          {226,317},{104,317}},
                             color={0,0,127}));
  connect(senMasFlo2.m_flow,Bypass_f)  annotation (Line(points={{80,281},{130,
          281},{130,262},{336,262}},
                             color={0,0,127}));
  connect(AHU1_f,senMasFlo4. m_flow) annotation (Line(points={{336,224},{256,
          224},{256,148},{-20,148},{-20,229}},
                                          color={0,0,127}));
  connect(Ch1_status,val4. y) annotation (Line(points={{-230,434},{-178,434},{
          -178,310},{-38,310},{-38,350}},
                     color={0,0,127}));
  connect(Ch2_status,val3. y) annotation (Line(points={{-230,404},{-126,404},{
          -126,280},{-44,280},{-44,318}},
                                       color={0,0,127}));
  connect(pump1test.m_flow_in,Ch1Pump_m)  annotation (Line(points={{68,348},{68,
          332},{-88,332},{-88,358},{-230,358}}, color={0,0,127}));
  connect(Ch2Pump_m,pump2test. m_flow_in) annotation (Line(points={{-230,328},{
          -150,328},{-150,276},{68,276},{68,318}},
                                                 color={0,0,127}));
  connect(pump3test.y,SLPump_v)  annotation (Line(points={{172,268},{182,268},{
          182,234},{-156,234},{-156,298},{-230,298}},
                                                  color={0,0,127}));
  connect(AHU1Valve_y,AHU1Valve. y) annotation (Line(points={{-232,252},{-192,
          252},{-192,202},{42,202},{42,240}},
                                       color={0,0,127}));
  connect(AHU2Valve.y,AHU2Valve_y)  annotation (Line(points={{44,200},{32,200},
          {32,168},{-202,168},{-202,220},{-232,220}}, color={0,0,127}));
  connect(val4.port_b,chi1. port_a2) annotation (Line(points={{-28,338},{-14,
          338},{-14,340},{0,340}},    color={0,127,255}));
  connect(pump1test.port_a,chi1. port_b2) annotation (Line(points={{58,336},{40,
          336},{40,340},{20,340}},       color={0,127,255}));
  connect(val3.port_b,chi2. port_a2) annotation (Line(points={{-34,306},{-20,
          306},{-20,300},{-4,300}},   color={0,127,255}));
  connect(chi2.port_b2,pump2test. port_a) annotation (Line(points={{16,300},{30,
          300},{30,306},{58,306}},       color={0,127,255}));
  connect(pump1.port_b,jun20. port_1)
    annotation (Line(points={{70,388},{70,382}},   color={0,127,255}));
  connect(jun20.port_3,val7. port_b) annotation (Line(points={{60,372},{54,372},
          {54,360},{50,360}},        color={0,127,255}));
  connect(jun20.port_2,val8. port_b) annotation (Line(points={{70,362},{62,362},
          {62,316},{50,316}},        color={0,127,255}));
  connect(val8.port_a,chi2. port_a1) annotation (Line(points={{30,316},{28,316},
          {28,312},{16,312}},        color={0,127,255}));
  connect(val7.port_a,chi1. port_a1) annotation (Line(points={{30,360},{24,360},
          {24,352},{20,352}},        color={0,127,255}));
  connect(chi2.port_b1,jun21. port_2) annotation (Line(points={{-4,312},{-14,
          312},{-14,350}},  color={0,127,255}));
  connect(chi1.port_b1,jun21. port_3) annotation (Line(points={{0,352},{0,360},
          {-4,360}},       color={0,127,255}));
  connect(sin5.ports[1],jun21. port_1) annotation (Line(points={{-14,384},{-16,
          384},{-16,370},{-14,370}},        color={0,127,255}));
  connect(bou2.ports[1],pump1. port_a)
    annotation (Line(points={{70,412},{70,408}},   color={0,127,255}));
  connect(booleanConstant2.y,chi1. on) annotation (Line(points={{-141,396},{-80,
          396},{-80,349},{22,349}},        color={255,0,255}));
  connect(booleanConstant3.y,chi2. on) annotation (Line(points={{-139,428},{-70,
          428},{-70,309},{18,309}},        color={255,0,255}));
  connect(Teva_out_set_chiller1,chi1. TSet) annotation (Line(points={{-155,371},
          {-76.5,371},{-76.5,343},{22,343}},    color={0,0,127}));
  connect(Teva_out_set_chiller2,chi2. TSet) annotation (Line(points={{-155,339},
          {-79.5,339},{-79.5,303},{18,303}},    color={0,0,127}));
  connect(bou2.T_in,Tw)  annotation (Line(points={{74,434},{-38,434},{-38,503},
          {-227,503}},      color={0,0,127}));
  connect(pump1.m_flow_in,m_pump_conden)  annotation (Line(points={{82,398},{
          128,398},{128,473},{-219,473}},
                                        color={0,0,127}));
  connect(senMasFlo3.m_flow,HX_f)  annotation (Line(points={{-44,249},{142,249},
          {142,244},{336,244}},color={0,0,127}));
  connect(senMasFlo5.m_flow,AHU2_f)  annotation (Line(points={{-38,199},{144,
          199},{144,206},{336,206}},color={0,0,127}));
  connect(senTem28.port, chi1.port_b2) annotation (Line(points={{150,384},{84,
          384},{84,340},{20,340}}, color={0,127,255}));
  connect(senTem29.port, chi2.port_b2) annotation (Line(points={{148,356},{82,
          356},{82,300},{16,300}}, color={0,127,255}));
  connect(senTem28.T, Tw_Ch1_outlet) annotation (Line(points={{157,394},{266,
          394},{266,314},{380,314}}, color={0,0,127}));
  connect(senTem29.T, Tw_Ch2_outlet) annotation (Line(points={{155,366},{264,
          366},{264,274},{380,274}}, color={0,0,127}));
  connect(senTem30.port,chi1. port_a2) annotation (Line(points={{-46,362},{-24,
          362},{-24,340},{0,340}},         color={0,127,255}));
  connect(senTem31.port,chi2. port_a2) annotation (Line(points={{-58,354},{-32,
          354},{-32,300},{-4,300}},        color={0,127,255}));
  connect(senTem30.T,Tw_Ch1_inlet)  annotation (Line(points={{-39,372},{166,372},
          {166,342},{378,342}},color={0,0,127}));
  connect(senTem31.T,Tw_Ch2_inlet)  annotation (Line(points={{-51,364},{162,364},
          {162,296},{384,296}},color={0,0,127}));
  connect(val7.y,val4. y) annotation (Line(points={{40,372},{-70,372},{-70,434},
          {-178,434},{-178,310},{-38,310},{-38,350}},        color={0,0,127}));
  connect(val8.y,val3. y) annotation (Line(points={{40,328},{-44,328},{-44,388},
          {-126,388},{-126,280},{-44,280},{-44,318}},        color={0,0,127}));
  connect(sou5.ports[1],val2. port_a) annotation (Line(points={{198,140},{156,
          140},{156,148}},   color={0,127,255}));
  connect(jun14.port_2, val2.port_b) annotation (Line(points={{158,176},{158,
          168},{156,168}}, color={0,127,255}));
  connect(jun14.port_3, jun17.port_1) annotation (Line(points={{148,186},{138,
          186},{138,188},{124,188}}, color={0,127,255}));
  connect(jun14.port_1, jun13.port_2) annotation (Line(points={{158,196},{160,
          196},{160,228}}, color={0,127,255}));
  connect(sou4.ports[1],val1. port_a) annotation (Line(points={{-102,122},{-88,
          122},{-88,136}},         color={0,127,255}));
  connect(jun15.port_2, val1.port_b)
    annotation (Line(points={{-88,178},{-88,156}}, color={0,127,255}));
  connect(jun15.port_3, jun16.port_1)
    annotation (Line(points={{-78,188},{-72,188}}, color={0,127,255}));
  connect(jun15.port_1, jun12.port_2) annotation (Line(points={{-88,198},{-86,
          198},{-86,228},{-82,228}}, color={0,127,255}));
  connect(const6.y,val1. y) annotation (Line(points={{-61,116},{-61,132},{-76,
          132},{-76,146}},color={0,0,127}));
  connect(const6.y,val2. y) annotation (Line(points={{-61,116},{40,116},{40,158},
          {144,158}},
                    color={0,0,127}));
  connect(pump1.P,CondPump_Power)  annotation (Line(points={{79,387},{202.5,387},
          {202.5,326},{336,326}},      color={0,0,127}));
  connect(chi1.P,Chiller1_Power)  annotation (Line(points={{-1,355},{195.5,355},
          {195.5,242},{400,242}}, color={0,0,127}));
  connect(chi2.P,Chiller2_Power)  annotation (Line(points={{-5,315},{193.5,315},
          {193.5,218},{398,218}}, color={0,0,127}));
  connect(AHU2Valve.port_b, AHU2coil.port_b1) annotation (Line(points={{34,188},
          {24,188},{24,76},{-48,76},{-48,-352.4}}, color={0,127,255}));
  connect(AHU2coil.port_a1, senMasFlo5.port_a) annotation (Line(points={{-62,
          -352.4},{-62,152},{-28,152},{-28,188}}, color={0,127,255}));
  connect(AHU1Valve.port_b, AHU1coil.port_b1) annotation (Line(points={{32,228},
          {24,228},{24,202},{-40,202},{-40,-426.8}}, color={0,127,255}));
  connect(AHU1coil.port_a1, senMasFlo4.port_a) annotation (Line(points={{-54,
          -426.8},{-54,138},{-10,138},{-10,218}}, color={0,127,255}));
  annotation (
    uses(                            Modelica(version="3.2.3"),
      Buildings(version="8.1.3"),
      VirtualTestbed(version="2")),
    Diagram(coordinateSystem(extent={{-340,-320},{420,340}})),
    Icon(coordinateSystem(extent={{-340,-320},{420,340}})),
    version="3",
    conversion(noneFromVersion="", noneFromVersion="1",
      noneFromVersion="2"));
end All_IBAL_0821;
