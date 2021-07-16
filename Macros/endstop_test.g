M84 X Y Z U
M291 P"Switch To Console View For Instructions" S3

if sensors.endstops[0].triggered
  M291 R"X Axis Error" P"X Endstop is already triggered! Either it's depressed, wired wrong, or broken." S3
if sensors.endstops[1].triggered
  M291 R"Y Axis Error" P"Y Endstop is already triggered! Either it's depressed, wired wrong, or broken." S3
if sensors.probes[0].value[0] != 0
  M291 R"Z Axis Error" P"Z Probe is already triggered! Either it's depressed, wired wrong, or broken." S3
if sensors.endstops[3].triggered
  M291 R"U Axis Error" P"U Endstop is already triggered! Either it's depressed, wired wrong, or broken." S3

; X
echo "Please depress X endstop for 1s"
M577 X S1
echo "X endstop test passed"

; Y
echo "Please depress Y endstop for 1s"
M577 Y S1
echo "Y endstop test passed"

; Z
echo "Please depress Z probe for 1s"
while sensors.probes[0].value[0] == 0
  G4 P500
echo "Z probe test passed"

; U
echo "Rotate U axis to minimum (visible endstop, CW)"
M577 U S1
echo "Rotate U Axis to maximum (internal endstop, CCW)"
M577 U S0
M577 U S1
echo "U endstop test passed"

M291 R"Endstop Checks" P"All endstop checks passed!" S3