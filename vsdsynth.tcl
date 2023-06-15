#! /bin/env tclsh

set filename [lindex $argv 0]
package require csv
package require struct::matrix
struct::matrix m
set f [open $filename]
csv::read2matrix $f m , auto
close $f
set columns [m columns]
m link arr
set rows [m rows]
puts $columns
puts $rows
set i 0
while {$i < $rows} {
	puts "\n setting $arr(0,$i) as $arr(1,$i)"
	if {$i == 0} {
		set [string map {" " _} $arr(0,$i)] $arr(1,$i)
	} else {
		set [string map {" " _} $arr(0,$i)] [file normalize $arr(1,$i)]		
	}
	set i [expr {$i + 1}]
}
puts $design_name
puts $early_lib_path
puts $late_lib_path
