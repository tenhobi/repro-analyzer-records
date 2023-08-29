import 'package:abc/annotation.dart';

part 'main.g.dart';

@Abc(
  const [1, 2, 3],
)
class Xxx {}

@Abc(
  'test string',
)
class Zzz {}

@Abc(
  const (1, 2, 3),
)
class Yyy {}
