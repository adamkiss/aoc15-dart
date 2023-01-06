import 'dart:io';

import 'package:aoc15/day_01.dart' as day_01;
import 'package:aoc15/day_02.dart' as day_02;
import 'package:aoc15/day_03.dart' as day_03;
import 'package:aoc15/day_04.dart' as day_04;

void main(List<String> arguments) {
	stdout.write('Running day 01…  '); day_01.main(); stdout.writeln();
	stdout.write('Running day 02…  '); day_02.main(); stdout.writeln();
	stdout.write('Running day 03…  '); day_03.main(); stdout.writeln();
	// Takes 10 seconds to run
	// stdout.write('Running day 04…  '); day_04.main(); stdout.writeln();
}
