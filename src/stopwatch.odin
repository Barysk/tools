package stopwatch

import "core:c/libc"
import "core:sys/posix"

main :: proc() {
	minutes: i64
	time_start := libc.time(nil)

	time_passed: libc.time_t

	for {
		time_passed = libc.time(nil) - time_start
		print_time(&time_start, &time_passed)
		posix.sleep(1)
	}
}

print_time :: proc(time_start: ^libc.time_t, time_passed: ^libc.time_t) {
	libc.system("clear")

	st_tm := libc.localtime(time_start)
	year_tm := st_tm.tm_year + 1900
	month_tm := st_tm.tm_mon + 1
	day_tm := st_tm.tm_mday
	hour_tm := st_tm.tm_hour
	min_tm := st_tm.tm_min
	sec_tm := st_tm.tm_sec
	libc.printf("Stopwatch started %d.%02d.%02d at %02d:%02d:%02d\n", year_tm, month_tm, day_tm, hour_tm, min_tm, sec_tm)

	h := time_passed^ / 3600
	m := (time_passed^ % 3600) / 60
	s := time_passed^ % 60

	libc.printf("Time passed %02d.%02d.%02d\n", h, m, s)

	libc.printf("\nUse <C-c> to terminte\n")

}
