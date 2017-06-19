within Buildings.Examples.Schedules;
model IntLoad "Schedule for time varying internal loads"
  extends Modelica.Blocks.Sources.CombiTimeTable(
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic,
    table=[0,0.1; 8*3600,0.1; 8*3600,1.0; 18*3600,1.0; 18*3600,0.1; 24*3600,0.1],
    columns={2});
end IntLoad;
