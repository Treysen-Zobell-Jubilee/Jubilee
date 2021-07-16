                                                                                  ; run once bed is at temp, otherwise
																				  ; the wrong map will be loaded

                                                                                  ; ------------------------------------
																				  ; get rounded bed temp
var bed_temp = 0																  ; ------------------------------------
while true
	if abs(var.bed_temp - heat.heaters[0].current) >= 5                            ; check if temp is not within 10c range
		set var.bed_temp = var.bed_temp + 10                                      ;
	else                                                                          ; temp is within range
		break                                                                     ;  exit loop

                                                                                  ; ------------------------------------
                                                                                  ; load heightmap, *optional* create if it doesn't exist
                                                                                  ; ------------------------------------
G29 S1 P{"0:/sys/heightmap" ^ var.bed_temp ^ ".csv"}                              ; load heightmap for current temp
if result != 0                                                                    ; heightmap didn't exist
	M291 P"Heightmap Not Found!" R"Click Okay to Generate Heightmap Now" S3 X1 Y1 ;  request to generate a heightmap
	echo "Waiting 5 minutes for bed temp to stabilize"                            ;  inform user about wait
	G4 S300                                                                       ;  wait 5min for bed temp to stabilize
	M471 S"0:/sys/heightmap.csv" T"0:/sys/heightmap.csv.bak"                      ;  backup default heightmap
	G29 S0                                                                        ;  generate heightmap
	M471 S"0:/sys/heightmap.csv" T{"0:/sys/heightmap" ^ var.bed_temp ^ ".csv"}    ;  copy file to correct location
	M471 S"0:/sys/heightmap.csv.bak" T"0:/sys/heightmap.csv"                      ;  restore default heightmap

echo "[+] Loaded Heightmap : heightmap" ^ var.bed_temp ^ ".csv"