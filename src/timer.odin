package timer

import "core:c/libc"
import "core:sys/posix"

main :: proc() {
	minutes: i64
	libc.printf("Provide time in minutes\n")
	libc.scanf("%d", &minutes)

	seconds := minutes * 60
	end_time: libc.time_t = libc.time(nil) + libc.time_t(seconds)

	remain := seconds

	for remain > 0 {
		// FIXME: desinchronisation, instead: update and then end_time - current_time
		print_time(&remain, &end_time)
		posix.sleep(1)
	}

	libc.printf("Time is up. \n")
}

print_time :: proc(remain: ^i64, end_time: ^libc.time_t) {
	libc.system("clear")

	minutes := remain^ / 60
	seconds := remain^ % 60
	
	end_tm := libc.localtime(end_time)
	year_tm := end_tm.tm_year + 1900
	month_tm := end_tm.tm_mon + 1
	day_tm := end_tm.tm_mday
	hour_tm := end_tm.tm_hour
	min_tm := end_tm.tm_min
	sec_tm := end_tm.tm_sec

	libc.printf("Timer ends %d.%02d.%02d\nat %02d:%02d:%02d\n",
		year_tm, month_tm, day_tm, hour_tm, min_tm, sec_tm)

	libc.printf("Time left: %02d:%02d\n", minutes, seconds)

}
