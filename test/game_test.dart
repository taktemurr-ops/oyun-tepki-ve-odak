import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_tepki_ve_odak/oyun_tepki_ve_odak.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(tepkiConfig.title.length, 33);
    expect(tepkiConfig.tagline.length, 33);
    for (final s in tepkiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(tepkiConfig.gameId, tepkiId);
    expect(tepkiRules.gameId, tepkiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(tepkiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: tepkiId, optionalMechanics: tepkiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(tepkiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
