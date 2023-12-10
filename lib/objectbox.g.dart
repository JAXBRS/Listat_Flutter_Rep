// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:listat/db.dart';
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 305716425609654849),
      name: 'Person',
      lastPropertyId: const IdUid(3, 7238078364901901109),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6059096714318408856),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 1412722625953938639),
            name: 'firstName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 7238078364901901109),
            name: 'lastName',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Shortcut for [Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [Store.new] for an explanation of all parameters.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// Returns the ObjectBox model definition for this project for use with
/// [Store.new].
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 305716425609654849),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Person: EntityDefinition<Person>(
        model: _entities[0],
        toOneRelations: (Person object) => [],
        toManyRelations: (Person object) => {},
        getId: (Person object) => object.id,
        setId: (Person object, int id) {
          object.id = id;
        },
        objectToFB: (Person object, fb.Builder fbb) {
          final firstNameOffset = fbb.writeString(object.firstName);
          final lastNameOffset = fbb.writeString(object.lastName);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, firstNameOffset);
          fbb.addOffset(2, lastNameOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final firstNameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final lastNameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final object = Person(
              id: idParam, firstName: firstNameParam, lastName: lastNameParam);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Person] entity fields to define ObjectBox queries.
class Person_ {
  /// see [Person.id]
  static final id = QueryIntegerProperty<Person>(_entities[0].properties[0]);

  /// see [Person.firstName]
  static final firstName =
      QueryStringProperty<Person>(_entities[0].properties[1]);

  /// see [Person.lastName]
  static final lastName =
      QueryStringProperty<Person>(_entities[0].properties[2]);
}
