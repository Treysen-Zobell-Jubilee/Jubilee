M84
M291 R"Setup (1/3)" P"Move X&Y to the center of the bed" S3
M291 R"Setup (2/3)" P"Ensure the bed has at least 25mm (1in) of clearance" S3
M291 R"Setup (3/3)" P"Move tool changer to the middle of it's range of motion" S3
M291 R"Notice!" P"GCode changes can be found in console" S3 T5
G92 X150 Y150 U100 Z25

M291 R"Rear Right XY Motor Direction Test" P"Motor should turn clockwise, then counter-clockwise." S3
G91 G1 X-100 F2000 H2
G91 G1 X100 F2000 H2
echo "If (RR-XY) motor turned the wrong direction, replace M569 P0 S0 with M569 P0 S1 in config.g"

M291 R"Rear Left XY Motor Direction Test" P"Motor should turn clockwise, then counter-clockwise." S3
G91 G1 Y-100 F2000 H2
G91 G1 Y100 F2000 H2
echo "If (RL-XY) motor turned the wrong direction, replace M569 P0 S0 with M569 P1 S1 in config.g"

M291 R"Toolchanger Motor Direction Test" P"Motor should turn clockwise, then counter-clockwise." S3
G91 G1 U-50 F2000 H2
G91 G1 U50 F2000 H2
echo "If (TC) motor turned the wrong direction, replace M569 P0 S0 with M569 P1 S1 in config.g"

M291 R"Z Motors Direction Test" P"Motor should turn clockwise, then counter-clockwise." S3
G91 G1 Z-15 F500 H2
G91 G1 Z15 F500 H2
echo "If (FL-Z) motor turned the wrong direction, replace M569 P6 S0 with M569 P6 S1 in config.g"
echo "If (FR-Z) motor turned the wrong direction, replace M569 P6 S0 with M569 P7 S1 in config.g"
echo "If (RC-Z) motor turned the wrong direction, replace M569 P6 S0 with M569 P8 S1 in config.g"