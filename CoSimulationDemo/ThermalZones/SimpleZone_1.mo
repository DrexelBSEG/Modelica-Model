within VirtualTestbed.NISTChillerTestbed.System.CoSimulationDemo.ThermalZones;
model SimpleZone_1 "Simplified zone model that uses external loads"
  extends Buildings.BaseClasses.BaseIcon;
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
    "Medium model";
  parameter Integer nPorts   "Number of parts" annotation (Evaluate=true,
      Dialog(
      connectorSizing=true,
      tab="General",
      group="Ports"));
  parameter Modelica.SIunits.Area AFlo "Area of the floor";
  parameter Modelica.SIunits.Height hRoo "Height of the room";
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal= AFlo*hRoo*1.2/3600
    "Nominal mass flow rate";

  parameter Modelica.Media.Interfaces.Types.Temperature T_start=293.15
    "Start value of temperature";

  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b ports[nPorts](
      redeclare each package Medium = Medium) "Fluid inlets and outlets"
    annotation (Placement(transformation(
        extent={{-38,-12},{38,12}},
        rotation=180,
        origin={0,-100}), iconTransformation(
        extent={{-40.5,-13},{40.5,13}},
        rotation=180,
        origin={4.5,-87})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow QSou
    "Heat source of the room"
    annotation (Placement(transformation(extent={{-62,-10},{-42,10}})));

  Modelica.Blocks.Interfaces.RealInput Qsen_flow
    "Sensible heat transferred to the zone. [W]"
    annotation (Placement(transformation(extent={{-142,-20},{-102,20}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heaPorAir
    "Heat port to air volume"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}}),
        iconTransformation(extent={{-10,-10},{10,10}})));

  Buildings.Fluid.MixingVolumes.MixingVolumeMoistAir vol(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    V=hRoo*AFlo,
    nPorts=nPorts)
    annotation (Placement(transformation(extent={{38,-32},{58,-12}})));
  Modelica.Blocks.Interfaces.RealInput Qlat_flow
    "Latent heat transferred to the zone. [W]"
    annotation (Placement(transformation(extent={{-140,-58},{-100,-18}})));
  Modelica.Blocks.Math.Gain gain(k=1/2401000)
    annotation (Placement(transformation(extent={{-56,-48},{-36,-28}})));
equation
  connect(QSou.Q_flow, Qsen_flow)
    annotation (Line(points={{-62,0},{-122,0}}, color={0,0,127}));
  connect(vol.heatPort, heaPorAir)
    annotation (Line(points={{38,-22},{0,-22},{0,0}}, color={191,0,0}));
  connect(QSou.port, heaPorAir) annotation (Line(points={{-42,0},{-24,0},{-24,
          -22},{0,-22},{0,0}}, color={191,0,0}));
  connect(vol.ports, ports) annotation (Line(points={{48,-32},{22,-32},{22,-100},
          {-8.88178e-16,-100}}, color={0,127,255}));
  connect(Qlat_flow, gain.u)
    annotation (Line(points={{-120,-38},{-58,-38}}, color={0,0,127}));
  connect(gain.y, vol.mWat_flow) annotation (Line(points={{-35,-38},{10,-38},{
          10,-14},{36,-14}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          lineThickness=1)}),
    Documentation(info="<html>
<p>
This is a simplified room model for a data center. There is no heat exchange between the room and ambient environment through the building envelope since it is negligible compared to the heat released by the servers.
</p></html>", revisions="<html>
<ul>
<li>
July 17, 2015, by Michael Wetter:<br/>
Added <code>prescribedHeatFlowRate=false</code> for both volumes.
This is for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/282\">
issue 282</a> of the Annex 60 library.
</li>
<li>
July 21, 2011 by Wangda Zuo:<br/>
Merge to library.
</li>
<li>
December 10, 2010 by Wangda Zuo:<br/>
First implementation.
</li>
</ul>
</html>"));
end SimpleZone_1;
