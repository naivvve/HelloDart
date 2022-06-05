import 'dart:math';
import 'dart:async';
import 'dart:io';
import '01_dart_start.dart';

// 变量
void variables() {
  print('变量:');
  var name = 'a';
  var year = 2000;
  var antennaDiameter = 2;
  var flybyObjects = ['b', 'c', 'd', 'e'];
  var image = {
    'f': ['g'],
    'h': 'i'
  };

  print(
      'name is $name, year is $year, antennaDiameter is $antennaDiameter, flybyObjects is $flybyObjects, image is $image');
}

// 控制流程
void control_flow_statements() {
  print('控制流程:');
  var year = DateTime.now().year;

  if (year >= 2001) {
    print('21s centry');
  } else if (year >= 1901) {
    print('20th centry');
  }

  var flybyObjects = ['a', 'b'];
  for (final object in flybyObjects) {
    print(object);
  }
  for (int month = 1; month <= 3; month++) {
    print(month);
  }
  year = 2009;
  while (year < 2013) {
    year += 1;
    print(year);
  }
}

// 函数
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

bool is_hit(String line, String target) {
  return line.contains(target);
}

void functions() {
  print('函数:');
  var fib = fibonacci(7);
  print('fibonacci 7 is $fib');

  var flybyObjects = [
    'hello',
    'abc',
    '123',
    'how do you do',
    'nice to meet you'
  ];
  flybyObjects.where((name) => name.contains('you')).forEach(print);

  var hit_lines = flybyObjects.where((x) => is_hit(x, 'o'));
  for (var one in hit_lines) {
    print('$one');
  }
}

// 注释
void comments() {
  print('注释:');
  print('comments.');
}

// 导入
void imports() {
  print('导入:');
  var mypi = pi;
  print('pi is $mypi');
}

// 类
class Spacecraft {
  String name;
  DateTime? launchDate;

  int? get launchYear => launchDate?.year;

  Spacecraft(this.name, this.launchDate) {}

  Spacecraft.unlaunched(String name) : this(name, null);

  // Methods.
  void describe() {
    print('Spacecraft: $name');

    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

void classes() {
  print('类:');
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  var voyager3 = Spacecraft.unlaunched('Voyager III');

  voyager.describe();
  voyager3.describe();
}

// 扩展类
class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(String name, DateTime launchDate, this.altitude)
      : super(name, launchDate);

  @override
  void describe() {
    super.describe();
    print('altitude is $altitude km');
  }
}

void inheritance() {
  print('扩展类:');

  var obt = Orbiter('天宫号', DateTime(2021, 4, 29), 389.2);
  obt.describe();
}

// Mixins
mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(String name, DateTime launchDate) : super(name, launchDate);
}

void mixins() {
  print('Mixins:');

  var plt = PilotedCraft('神舟1号', DateTime(1999, 11, 20));
  plt.describe();
  plt.describeCrew();
}

// 接口和抽象类
class MockSpaceship implements Spacecraft {
  @override
  DateTime? launchDate;

  @override
  String name;

  MockSpaceship(this.name, this.launchDate);

  @override
  void describe() {
    print('Mock Spacecraft: $name');
  }

  @override
  int? get launchYear => launchDate?.year;
}

void interface_and_abstract_classes() {
  print('接口和抽象类:');

  var mock = MockSpaceship('测试飞行器', null);
  mock.describe();
}

// 异步
Future<void> the_async() async {
  print('异步:');

  const oneSecond = Duration(seconds: 1);

  Future<void> printWithDelay1(String message) async {
    await Future.delayed(oneSecond);
    print(message);
  }

  printWithDelay1('过了1秒钟. 1');
  print('done 1.');

  Future<void> printWithDelay2(String message) {
    return Future.delayed(oneSecond).then((_) {
      print(message);
    });
  }

  printWithDelay2('过了1秒钟. 2');
  print('done 2.');

  Future<void> createDescriptions(Iterable<String> objects) async {
    for (final object in objects) {
      try {
        var file = File('$object.txt');
        if (await file.exists()) {
          var modified = await file.lastModified();
          print(
              'File for $object already exists. It was modified on $modified.');
          continue;
        }
        await file.create();
        await file.writeAsString('Start Describing $object in this file.');
        print('File for $object created.');
      } on IOException catch (e) {
        print('Cannot create description for $object: $e');
      }
    }
  }

  var the_objects = ['飞机', '火箭', '铲土车'];
  createDescriptions(the_objects);

  await Future.delayed(Duration(seconds: 5));
}

// Stream （https://www.jianshu.com/p/f9af079782af）
Future<void> the_stream() async {
  print('Stream:');

  const oneSecond = Duration(seconds: 1);

  StreamController<double> ctl = StreamController<double>();
  Stream stm = ctl.stream;

  stm.listen((event) {
    print('event from controller is: $event');
  });

  Future<void> addWithDelay(value) async {
    await Future.delayed(oneSecond);
    ctl.add(value);
  }

  addWithDelay(11.1);
  addWithDelay(22.2);
  addWithDelay(33.3);

  await Future.delayed(Duration(seconds: 5));
}

// 异常 （https://dart.cn/samples#exceptions）
Future<void> show_descriptions(flybyObjects) async {
  try {
    for (final object in flybyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  } on IOException catch (ex) {
    print('Could not describe object: $ex');
  } finally {
    flybyObjects.clear();
  }
}

void exceptions() {
  print('异常:');

  var flybyObjects = ['飞机', '火箭', '铲土车', '手机'];
  show_descriptions(flybyObjects);
}

Future<void> main(List<String> args) async {
  variables(); //变量
  control_flow_statements(); // 控制流程
  functions(); // 函数
  comments(); // 注释
  imports(); // 导入
  classes(); //类
  inheritance(); // 扩展类（继承）
  mixins();
  interface_and_abstract_classes(); // 接口和抽象类
  await the_async(); // 异步
  await the_stream(); // Steam
  exceptions(); // 异常
}
