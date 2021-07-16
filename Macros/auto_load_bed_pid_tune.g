                                                                                  ; ------------------------------------
																				  ; get rounded bed temp
var bed_temp = 0																  ; ------------------------------------
while true
	if abs(var.bed_temp - heat.heaters[0].current) > 2.5                          ; check if temp is not within 5c range
		set var.bed_temp = var.bed_temp + 5                                       ;
	else                                                                          ; temp is within range
		break                                                                     ;  exit loop
		
                                                                                  ; ------------------------------------
																				  ; set correct pid tune for temp
if var.bed_temp <= 50                                                             ; values generated using PID autotune with the following conditions
	M307 H0 B0 R0.776 C425.3 D9.08 S1.00 V0                                       ;  default bed, default heater, lukes lab build plate kit upgrade
elif var.bed_temp <= 60                                                           ;  22c ambient temp, no airflow, fans off
	M307 H0 B0 R0.798 C317.3 D8.18 S1.00 V0                                       ; ------------------------------------
elif var.bed_temp <= 70                                                           ;
	M307 H0 B0 R0.844 C356.1 D6.71 S1.00 V0                                       ; if the room lights start flickering, you may need to change the
elif var.bed_temp <= 80                                                           ; heater frequency to one that isn't so visible.
	M307 H0 B0 R0.834 C295.3 D5.68 S1.00 V0                                       ; change M950 H0 C"bed_heat" T0 to 
elif var.bed_temp <= 90                                                           ;        M950 H0 C"bed_heat" T0 Q200
	M307 H0 B0 R0.864 C261.3 D4.79 S1.00 V0                                       ;
elif var.bed_temp <= 100                                                          ; auto calibrate with M303 H0 S{bed_temp}
	M307 H0 B0 R0.907 C246.2 D4.20 S1.00 V0                                       ; change V value to 0 if you have an AC bed
elif var.bed_temp <= 110                                                          ;
	M307 H0 B0 R0.944 C200.3 D3.75 S1.00 V0                                       ;