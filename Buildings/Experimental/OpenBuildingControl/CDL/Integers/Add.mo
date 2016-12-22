within Buildings.Experimental.OpenBuildingControl.CDL.Integers;
block Add "Output the sum of the two inputs"

  parameter Integer k1=+1 "Gain of upper input";

  parameter Integer k2=+1 "Gain of lower input";

  Modelica.Blocks.Interfaces.IntegerInput u1 "Connector of Integer input signal 1"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));

  Modelica.Blocks.Interfaces.IntegerInput u2 "Connector of Integer input signal 2"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));

  Modelica.Blocks.Interfaces.IntegerOutput y "Connector of Integer output signal"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));

equation
  y = k1*u1 + k2*u2;

annotation (
Documentation(info="<html>
<p>
Block that outputs <code>y</code> as the weighted <i>sum</i> of the
two Integer input signals <code>u1</code> and <code>u2</code>,
</p>
<pre>
    y = k1*u1 + k2*u2;
</pre>
<p>
where <code>k1</code> and <code>k2</code> are Integer parameters.
</b>
</html>"),
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={
                                            Text(
            extent={{-150,150},{150,110}},
            textString="%name",
            lineColor={0,0,255}),          Rectangle(
            extent={{-100,-100},{100,100}},
            lineColor={255,127,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
        Line(points={{-100,60},{-74,24},{-44,24}}, color={255,127,0}),
        Line(points={{-100,-60},{-74,-28},{-42,-28}}, color={255,127,0}),
        Ellipse(lineColor={255,127,0}, extent={{-50,-50},{50,50}}),
        Line(points={{50,0},{100,0}}, color={255,127, 0}),
        Text(extent={{-40,-20},{36,48}}, textString="+"),
        Text(extent={{-100,52},{5,92}}, textString="%k1"),
        Text(extent={{-100,-92},{5,-52}}, textString="%k2")}),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
            100,100}})));
end Add;
