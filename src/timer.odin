package timer

import "core:c/libc"
import "core:sys/posix"

YELLOW :: "\e[1;93m"
CYAN :: "\e[1;96m"
RESET :: "\e[0m"

main :: proc() {
	minutes: i64
	libc.printf("Provide time in minutes\n")
	if libc.scanf("%d", &minutes) != 1 {
		libc.printf("Invalid input")
		return
	}

	seconds := minutes * 60
	end_time := libc.time(nil) + libc.time_t(seconds)

	remain := end_time - libc.time(nil)

	for remain > 0 {
		remain = end_time - libc.time(nil)
		print_time(&remain, &end_time)
		posix.sleep(1)
	}

	libc.printf(YELLOW + "Time is up." + RESET + "\n")
}

print_time :: proc(remain: ^libc.time_t, end_time: ^libc.time_t) {
	libc.system("clear")

	h := remain^ / 3600
	m := (remain^ % 3600) / 60
	s := remain^ % 60
	
	end_tm := libc.localtime(end_time)
	year_tm := end_tm.tm_year + 1900
	month_tm := end_tm.tm_mon + 1
	day_tm := end_tm.tm_mday
	hour_tm := end_tm.tm_hour
	min_tm := end_tm.tm_min
	sec_tm := end_tm.tm_sec

	libc.printf("Timer ends %d.%02d.%02d at %02d:%02d:%02d\n\n",
		year_tm, month_tm, day_tm, hour_tm, min_tm, sec_tm)

	libc.printf(CYAN + "Time left:\n%02d:%02d:%02d" + RESET + "\n\n", h, m, s)

}
