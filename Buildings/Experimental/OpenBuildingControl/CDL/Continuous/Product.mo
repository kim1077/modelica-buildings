within Buildings.Experimental.OpenBuildingControl.CDL.Continuous;
block Product "Output product of the two inputs"

  Modelica.Blocks.Interfaces.RealInput u1 "Connector of Real input signal 1"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));

  Modelica.Blocks.Interfaces.RealInput u2 "Connector of Real input signal 2"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));

  Modelica.Blocks.Interfaces.RealOutput y "Connector of Real output signal"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));

equation
  y = u1 * u2;

annotation (
Documentation(info="<html>
<p>
Block that outputs <code>y = u1 * u2</code>,
where
<code>u1</code> and <code>u2</code> are inputs.
</p>
</html>"),
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(
        extent={{-100,-100},{100,100}},
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid),
        Line(points={{-100,60},{-40,60},{-30,40}}, color={0,0,127}),
        Line(points={{-100,-60},{-40,-60},{-30,-40}}, color={0,0,127}),
        Line(points={{50,0},{100,0}}, color={0,0,127}),
        Line(points={{-30,0},{30,0}}),
        Line(points={{-15,25.99},{15,-25.99}}),
        Line(points={{-15,-25.99},{15,25.99}}),
        Ellipse(lineColor={0,0,127}, extent={{-50,-50},{50,50}}),
        Text(
        extent={{-150,150},{150,110}},
        textString="%name",
        lineColor={0,0,255})}),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
            100,100}})));
end Product;
