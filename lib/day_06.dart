import 'dart:collection';
import 'dart:developer';
import 'dart:io';

Iterable<String> _input() => File('inputs/2015/day_06.txt').readAsLinesSync();

List<Map<int, int>> _area_to_list(int startX, int startY, int endX, int endY) {
	List<Map<int, int>> result = [];
	for (var j = startY; j <= endY; j++) {
		result.add({
			0: j * 1000 + startX,
			1: j * 1000 + endX
		});
	}
	return result;
}

void main() {
	/* PART A: RUN 1 */
	var lights = List<bool>.filled(1000000, false, growable: false);
	final parserA = RegExp(r'^(?<action>.*) (?<sX>\d+),(?<sY>\d+) through (?<eX>\d+),(?<eY>\d+)');
	_input()
		.where((element) => parserA.hasMatch(element))
		.map((e) {
			final m = parserA.firstMatch(e);
			return [
				m?.namedGroup('action'),
				_area_to_list(
					int.parse(m?.namedGroup('sX') ?? '0', radix: 10), int.parse(m?.namedGroup('sY') ?? '0', radix: 10),
					int.parse(m?.namedGroup('eX') ?? '0', radix: 10), int.parse(m?.namedGroup('eY') ?? '0', radix: 10)
				)
			];
		})
		.forEach((m) {
			if (m[0].startsWith('turn')) {
				m['ranges']?.cast<List<Map<int,int>>>().forEach((range) {
					// fill range with tru or false
					lights.fillRange(range[0] ?? 0, range[1] ?? 0, (m['action'] as String) == 'turn on');
				});
			}
			// replace range with switch ranged
			// lights.replaceRange(range[0], range[1], lights.slice().map(e => ! e))
		});
	stdout.write(' A: ${lights.where((l) => l == true).length}');

	/* PART B: RUN 1 */

	stdout.write(' B: ${false}');
}