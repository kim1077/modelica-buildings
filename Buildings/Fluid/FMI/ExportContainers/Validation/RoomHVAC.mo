within Buildings.Fluid.FMI.ExportContainers.Validation;
model RoomHVAC
  "Validation model for connected single thermal zone and HVAC system"
 extends Modelica.Icons.Example;

  Buildings.Fluid.FMI.ExportContainers.Examples.FMUs.HVACZone hvaCon
    "Block that encapsulates the HVAC system"
    annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Buildings.Fluid.FMI.ExportContainers.Examples.FMUs.ThermalZone rooCon
    "Block that encapsulates the thermal zone"
    annotation (Placement(transformation(extent={{20,20},{40,40}})));
  BaseCase baseCase
    annotation (Placement(transformation(extent={{-60,60},{-40,80}})));
  Modelica.Blocks.Sources.Constant TRooRad(k=295.13) "Radiative temperature"
    annotation (Placement(transformation(extent={{20,50},{0,70}})));
  Examples.FMUs.HVACZones hvaCon2(
    UA = 20E3,
    QRooInt_flow = 2000,
    fan2(each constantMassFlowRate=0))
    "Block that encapsulates the HVAC system"
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  TwoRooms rooCon2 "Model with two rooms" annotation (Placement(transformation(
          rotation=0, extent={{20,-40},{40,-20}})));

protected
    model BaseCase "Base case model used for the validation of the FMI interfaces"
    extends Buildings.Examples.Tutorial.SpaceCooling.System3(
      vol(energyDynamics=
      Modelica.Fluid.Types.Dynamics.FixedInitial),
      fan(nominalValuesDefineDefaultPressureCurve=true),
      hex(dp1_nominal=200 + 10,
          dp2_nominal=200 + 200));
    annotation (Documentation(info="<html>
<p>
This example is the base case model which is used to validate 
the coupling of a convective thermal zone with an air-based HVAC system. 
</p>
<p>
It is based on
<a href=\"modelica://Buildings.Examples.Tutorial.SpaceCooling.System3\">
Buildings.Examples.Tutorial.SpaceCooling.System3</a>,
and it assign some parameters to have the same configuration as
<a href=\"modelica://Buildings.Fluid.FMI.ExportContainers.Examples.FMUs.HVACZone\">
Buildings.Fluid.FMI.ExportContainers.Examples.FMUs.HVACZone</a>.
</p>
<p>
The model which is validated using this model is
<a href=\"modelica://Buildings.Fluid.FMI.ExportContainers.Validation.RoomHVAC\">
Buildings.Fluid.FMI.ExportContainers.Validation.RoomHVAC
</a>. 
</p>
</html>"), Icon(graphics={
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={28,108,200},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-72,-14},{56,-24}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={0,127,255}),
          Ellipse(
            extent={{-56,-2},{-22,-36}},
            lineColor={0,0,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-72,190},{70,84}},
            lineColor={0,0,255},
            textString="%name"),
          Polygon(
            points={{-28,-6},{-56,-18},{-28,-32},{-28,-6}},
            lineColor={0,0,255},
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{26,54},{-20,32},{70,32},{26,54}},
            lineColor={95,95,95},
            smooth=Smooth.None,
            fillPattern=FillPattern.Solid,
            fillColor={95,95,95}),
          Rectangle(
            extent={{-12,32},{62,-30}},
            lineColor={150,150,150},
            fillPattern=FillPattern.Solid,
            fillColor={150,150,150}),
          Rectangle(
            extent={{-2,-4},{20,26}},
            lineColor={255,255,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{34,-4},{54,26}},
            lineColor={255,255,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-74,24},{-12,16}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={0,127,255}),
          Ellipse(
            extent={{-58,36},{-24,2}},
            lineColor={0,0,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-52,32},{-24,20},{-52,6},{-52,32}},
            lineColor={0,0,255},
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid)}));
    end BaseCase;

  model TwoRooms "Model with two simple thermal zones, each having three air flow paths"
    extends
      Buildings.Fluid.FMI.ExportContainers.Examples.FMUs.ThermalZones(      nPorts=3);

    Sources.Boundary_pT bou1(
      redeclare package Medium = Medium,
      nPorts=1)
      "Boundary condition for zero mass flow of one exhaust stream for room 1"
      annotation (Placement(transformation(extent={{-140,110},{-120,130}})));
    Sources.Boundary_pT bou2(
      redeclare package Medium = Medium,
      nPorts=1)
      "Boundary condition for zero mass flow of one exhaust stream for room 2"
      annotation (Placement(transformation(extent={{-142,82},{-122,102}})));

  equation
    connect(bou1.ports[1], theZonAda[1].ports[3]) annotation (Line(points={{-120,120},
            {-112,120},{-112,160},{-102,160},{-112,160},{-120,160}},
                                    color={0,127,255}));
    connect(bou2.ports[1], theZonAda[2].ports[3]) annotation (Line(points={{-122,92},
            {-106,92},{-106,160},{-120,160}},
                                    color={0,127,255}));
    annotation (Documentation(info="<html>
<p>
This model extends
<a href=\"modelica://Buildings.Fluid.FMI.ExportContainers.Examples.FMUs.ThermalZones\">
Buildings.Fluid.FMI.ExportContainers.Examples.FMUs.ThermalZones</a>
to implement two simple thermal zones, and, in addition, it also sets a pressure
boundary condition for an exhaust air stream.
This is needed because the validation model has an HVAC system with one supply
and two exhaust air streams, one of which is configured to have zero mass flow rate
for the validation. Because of the zero mass flow rate,
adding a pressure boundary condition has no effect
on the model as there is zero mass flow rate in this flow leg.
</p>
</html>", revisions="<html>
<ul>
<li>
September 14, 2016, by Michael Wetter:<br/>
First implementation.
</li>
</ul>
</html>"));
  end TwoRooms;

equation

  connect(hvaCon.fluPor, rooCon.fluPor) annotation (Line(points={{-39.375,38.75},
          {19.375,38.75}},                                color={0,0,255}));
  connect(hvaCon.TRadZon, TRooRad.y) annotation (Line(points={{-39.3125,33.8125},
          {-20,33.8125},{-20,34},{-20,60},{-1,60}},
                                 color={0,0,127}));
  connect(hvaCon2.fluPor, rooCon2.fluPor) annotation (Line(points={{-39.375,-21.25},
          {19.375,-21.25}}, color={0,0,255}));
  connect(TRooRad.y,hvaCon2. TRadZon[1]) annotation (Line(points={{-1,60},{-18,60},
          {-18,-26.125},{-39.375,-26.125}}, color={0,0,127}));
  connect(TRooRad.y,hvaCon2. TRadZon[2]) annotation (Line(points={{-1,60},{-16,60},
          {-16,-26.125},{-39.375,-26.125}}, color={0,0,127}));
    annotation (
              Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}})),                                        Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Documentation(info="<html>
<p>
This example validates the coupling of convective thermal zones with air-based HVAC systems.
The model has the following three parts:
<ul>
<li>
The block <code>baseCase</code> is the base case model, which is adapted from
<a href=\"modelica://Buildings.Examples.Tutorial.SpaceCooling.System3\">
Buildings.Examples.Tutorial.SpaceCooling.System3</a>
to have the same flow resistances as the models that are here validated.
</li>
<li>
The blocks <code>hvaCon</code> and <code>rooCon</code> are FMU containers
that contain an HVAC system for a single zone, and a thermal model of a single
zone. Both models have the same configuration as <code>baseCase</code>,
but they are implemented such that the HVAC system and the thermal zone
are in separate blocks.
These blocks could be exported as an FMU, but here they are connected to each
other to validate whether they indeed give the same response as the base case
<code>baseCase</code>.
</li>
<li>
The blocks <code>hvaCon2</code> and <code>rooCon2</code> are again containers
for HVAC and room models, but the models that they encapsulate are an HVAC system
that serves two rooms, and a model of two thermal zones.
Hence, this case tests whether the FMU containers for multiple HVAC systems, and
for multiple thermal zones, are implemented correctly.
</li>
</ul>
<p>
When the model is simulated, one sees that the air temperatures and the water
vapor mass fraction in all four room models are the same.
Note, however, that in Dymola 2017, the base case <code>basCas</code>
reaches in the last cooling cylce of the day not quite the set point, and hence
switches the cooling on time less than the other models.
We attribute this to numerical approximation errors that causes a slightly different
temperature trajectory.
With Dymola 2017, we obtain the trajectories shown below.
</p>
<p align=\"center\">
<img alt=\"Simulation results\" src=\"modelica://Buildings/Resources/Images/Fluid/FMI/ExportContainers/Validation/RoomConvectiveHVACConvective.png\" border=\"1\" />
</p>
</html>", revisions="<html>
<ul>
<li>
May 03, 2016, by Thierry S. Nouidui:<br/>
First implementation.
</li>
</ul>
</html>"),
__Dymola_Commands(file="modelica://Buildings/Resources/Scripts/Dymola/Fluid/FMI/ExportContainers/Validation/RoomHVAC.mos"
        "Simulate and plot"),
    experiment(StartTime=1.5552e+07, StopTime=15638400));
end RoomHVAC;
