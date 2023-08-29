import 'package:abc/generator.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

Builder builder(BuilderOptions options) => SharedPartBuilder(
      [AbcGenerator(builderOptions: options)],
      'abc',
    );
