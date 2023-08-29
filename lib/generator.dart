//ignore_for_file: avoid-dynamic

import 'package:abc/annotation.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:source_gen/source_gen.dart';

class AbcGenerator extends GeneratorForAnnotation<Abc> {
  final BuilderOptions builderOptions;

  const AbcGenerator({required this.builderOptions});

  @override
  dynamic generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        '${element.displayName} is not a class and cannot be annotated with @Abc.',
        element: element,
        todo: 'Use @Abc annotation on a class',
      );
    }

    final constant = annotation.objectValue;
    final value = constant.getField('value')!;

    log.warning('''
type.getDisplayString: ${value.type?.getDisplayString(withNullability: true) ?? '--1'}
type.isDartCoreList: ${value.type?.isDartCoreList ?? '--2'}
type.isDartCoreRecord: ${value.type?.isDartCoreRecord ?? '--3'}
type.element.library: ${value.type?.element?.library ?? '--4'}
type.element.library.isDartCore: ${value.type?.element?.library?.isDartCore ?? '--5'}
''');

    return '';
  }
}
