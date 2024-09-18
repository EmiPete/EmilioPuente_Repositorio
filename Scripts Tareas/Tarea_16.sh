#!bin/bash
#Umbrales de alerta
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80

#Funcion para verificar el uso del CPU
check_cpu(){
	cpu_usage=$(top -bn1 | grep "Cpus(s)" | sed "s/.*", *([0-9.]*\)%* id.*/\1/ | awk '{print 100 - $1}')
	echo "Uso del CPU: $cpu_usage%"
	if (( $(echo "$cpu_usage > $CPU_THRESHOLD" | bc -1) )); then
		echo "Alerta: Uso del CPU por encima del $CPU_THRESHOLD% !"
	fi
}

#Funcion para verificar el uso de la memoria
check_memory() {
	memory_usage=$(free | grep Mem | awk '{print #3/#2}')

}