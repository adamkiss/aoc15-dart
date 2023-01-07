import 'dart:collection';
import 'dart:developer';
import 'dart:io';

import 'package:tuple/tuple.dart';

Iterable<String> _input() => File('inputs/2015/day_06.txt').readAsLinesSync();

List<Tuple2<int,int>> _area_to_list(int startX, int startY, int endX, int endY) {
	List<Tuple2<int,int>> result = [];
	for (var j = startY; j <= endY; j++) {
		result.add(Tuple2(j * 1000 + startX, j * 1000 + endX + 1)); // +1 changes range inclusive -> exclusive
	}
	return result;
}

void main() {
	/* PART A: RUN 1 */
	var lights = List<bool>.filled(1000000, false);
	final parserA = RegExp(r'^(?<action>.*) (?<sX>\d+),(?<sY>\d+) through (?<eX>\d+),(?<eY>\d+)');
	_input()
		.map((e) {
			final m = parserA.firstMatch(e);
			return Tuple2<String,List>(
				m!.namedGroup('action')!,
				_area_to_list(
					int.parse(m.namedGroup('sX')!, radix: 10), int.parse(m.namedGroup('sY')!, radix: 10),
					int.parse(m.namedGroup('eX')!, radix: 10), int.parse(m.namedGroup('eY')!, radix: 10)
				)
			);
		})
		.forEach((Tuple2<String, List> m) {
			if (m.item1.startsWith('turn')) {
				for (final range in m.item2) {
					lights.fillRange(range.item1, range.item2, m.item1 == 'turn on');
				}
				return;
			}

			for (final range in m.item2) {
				lights.setRange(
					range.item1, range.item2,
					lights.sublist(range.item1, range.item2).map((e) => !e)
				);
			}
		});
	stdout.write(' A: ${lights.where((l) => l == true).length}');

	/* PART B: RUN 1 */

	stdout.write(' B: ${false}');
}