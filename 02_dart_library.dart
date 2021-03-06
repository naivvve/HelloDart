import 'dart:math';

void dartcore_numbers_numbers_collections_strings_and_more() {
  print('数字、集合、字符串:');
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);
  assert(int.parse('42', radix: 16) == 66);
  assert(42.toString() == '42');
  assert(123.456.toString() == '123.456');
  assert(123.456.toStringAsFixed(2) == '123.46');
  assert(123.456.toStringAsPrecision(2) == '1.2e+2');
  assert(double.parse('1.2e+2') == 120.0);

  assert('Never odd or even'.contains('odd'));
  assert('Never odd or even'.startsWith('Never'));
  assert('Never odd or even'.endsWith('even'));
  assert('Never odd or even'.indexOf('odd') == 6);
  assert('Never odd or even'.substring(6, 9) == 'odd');

  var parts = 'progressive web apps'.split(' ');
  assert(parts.length == 3);
  assert(parts[0] == 'progressive');

  assert('Never odd or even'[0] == 'N');

  for (final char in 'hello'.split('')) {
    print(char);
  }

  var codeUnitList = 'Never odd or even'.codeUnits.toList();
  assert(codeUnitList[0] == 78);

  assert('web apps'.toUpperCase() == 'WEB APPS');

  assert('WEB APPS'.toLowerCase() == 'web apps');

  assert('  hello  '.trim() == 'hello');

  assert(''.isEmpty);

  assert('  '.isNotEmpty);

  var greetingTemplate = 'Hello, NAME!';
  var greeting = greetingTemplate.replaceAll(RegExp('NAME'), 'Bob');

  assert(greeting != greetingTemplate);

  var sb = StringBuffer();
  sb
    ..write('Use a StringBuffer for ')
    ..writeAll(['efficient', 'string', 'creation'], ' ')
    ..write('.');

  var fullString = sb.toString();
  assert(fullString == 'Use a StringBuffer for efficient string creation.');
  var numbers = RegExp(r'\d+');
  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';

  assert(!allCharacters.contains(numbers));
  assert(someDigits.contains(numbers));
}

// 集合
void the_lists() {
  var grains = <String>[];
  assert(grains.isEmpty);

  var fruits = ['apples', 'oranges'];

  fruits.add('kiwis');

  fruits.addAll(['grapes', 'bananas']);

  assert(fruits.length == 5);

  var appleIndex = fruits.indexOf('apples');
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);

  fruits.clear();
  assert(fruits.isEmpty);

  var vegetables = List.filled(99, 'broccoli');
  assert(vegetables.every((v) => v == 'broccoli'));

  fruits = ['bananas', 'apples', 'oranges'];

  fruits.sort((a, b) => a.compareTo(b));
  assert(fruits[0] == 'apples');

  fruits = <String>[];

  fruits.add('apples');
  var fruit = fruits[0];
  assert(fruit is String);
}

void the_sets() {
  var ingredients = <String>{};

  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.length == 3);

  ingredients.add('gold');
  assert(ingredients.length == 3);

  ingredients.remove('gold');
  assert(ingredients.length == 2);

  var atomicNumbers = Set.from([79, 22, 54]);
  assert(atomicNumbers.length == 3);

  ingredients = Set<String>();
  ingredients.addAll(['gold', 'titanium', 'xenon']);

  assert(ingredients.contains('titanium'));

  assert(ingredients.containsAll(['titanium', 'xenon']));

  ingredients = Set<String>();
  ingredients.addAll(['gold', 'titanium', 'xenon']);

  var nobleGases = Set.from(['xenon', 'argon']);
  var intersection = ingredients.intersection(nobleGases);
  assert(intersection.length == 1);
  assert(intersection.contains('xenon'));
}

void the_maps() {
  var hawaiianBeaches = {
    'beijing': ['a', 'b', 'c'],
    'shanghai': ['d', 'e'],
    'guangzhou': ['f', 'g']
  };

  var searchTerms = Map();

  var nobleGases = Map<int, String>();

  nobleGases = {54: 'xenon'};

  assert(nobleGases[54] == 'xenon');

  assert(nobleGases.containsKey(54));

  nobleGases.remove(54);
  assert(!nobleGases.containsKey(54));

  hawaiianBeaches = {
    'beijing': ['a', 'b', 'c'],
    'shanghai': ['d', 'e'],
    'guangzhou': ['f', 'g']
  };

  var keys = hawaiianBeaches.keys;

  assert(keys.length == 3);
  assert(Set.from(keys).contains('Oahu'));

  var values = hawaiianBeaches.values;
  assert(values.length == 3);
  assert(values.any((v) => v.contains('a')));

  hawaiianBeaches = {
    'beijing': ['a', 'b', 'c'],
    'shanghai': ['d', 'e'],
    'guangzhou': ['f', 'g']
  };

  assert(hawaiianBeaches.containsKey('Oahu'));
  assert(!hawaiianBeaches.containsKey('Florida'));

  var teamAssignments = <String, String>{};
  String pickToughestKid() {
    return "pickToughestKid";
  }

  teamAssignments.putIfAbsent('Catcher', () => pickToughestKid());
  assert(teamAssignments['Catcher'] != null);
}

void the_public_methods() {
  var coffees = <String>[];
  var food = ['chips', 'bread', 'chocolate'];
  assert(coffees.isEmpty);
  assert(food.isNotEmpty);

  food = ['chips', 'bread', 'chocolate'];
  food.forEach((food1) => print('I want to eat $food1'));

  var hawaiianBeaches = {
    'beijing': ['a', 'b', 'c'],
    'shanghai': ['d', 'e'],
    'guangzhou': ['f', 'g']
  };
  hawaiianBeaches.forEach((k, v) {
    print('I want to visit $k and play at $v');
  });

  food = ['chips', 'bread', 'chocolate'];

  var loudTeas = food.map((food1) => food1.toUpperCase());
  loudTeas.forEach(print);
  var loadTeas_str =
      loudTeas = food.map((food1) => food1.toUpperCase()).toList();
  print(loadTeas_str);

  food = ['chips', 'bread', 'chocolate'];

  bool isDecaffeinated(String teaName) => teaName == 'chamomile';

  var decaffeinatedTeas = food.where((food1) => isDecaffeinated(food1));

  assert(food.any(isDecaffeinated));

  assert(!food.every(isDecaffeinated));
}

void collections() {
  print('集合:');
  the_lists();
  the_sets();
  the_maps();
  the_public_methods();
}

// 时间和日期
void dates_and_times() {
  print('时间和日期:');
  var now = DateTime.now();
  var y2k = DateTime(2020);
  y2k = DateTime(2020, 1, 1);
  y2k = DateTime.utc(2020);
  y2k = DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true);
  y2k = DateTime.parse('2020-01-01T00:00:00Z');
  y2k = DateTime.utc(2020);
  assert(y2k.millisecondsSinceEpoch == 946684800000);
  var unixEpoch = DateTime.utc(1970);
  assert(unixEpoch.millisecondsSinceEpoch == 0);
  y2k = DateTime.utc(2020);
  var y2001 = y2k.add(const Duration(days: 366));
  assert(y2001.year == 2001);
  var december2000 = y2001.subtract(const Duration(days: 30));
  assert(december2000.year == 2000);
  assert(december2000.month == 12);
  var duration = y2001.difference(y2k);
  assert(duration.inDays == 366); // y2k was a leap year.
}

// 数学和随机数
void math_and_random() {
  print('数学和随机数:');
  assert(cos(pi) == -1.0);
  var degrees = 50;
  var radians = degrees * (pi / 180);
  var sinOf30degrees = sin(radians);
  assert((sinOf30degrees - 0.5).abs() < 0.01);
  assert(max(1, 2000) == 2000);
  assert(min(1, -2000) == -2000);

  print(e);
  print(pi);
  print(sqrt2);

  var random = Random();
  var value1 = random.nextDouble();
  print('nextDouble: $value1');
  var value2 = random.nextInt(10);
  print('nextInt: $value2');
  var value3 = random.nextBool();
  print('nextBool: $value3');
}

void main(List<String> args) {
  dartcore_numbers_numbers_collections_strings_and_more(); // 数字、集合、字符串等
  collections(); // 集合
  dates_and_times(); // 时间和日期
  math_and_random(); // 数学和随机数
}
