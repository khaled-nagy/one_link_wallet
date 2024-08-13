import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart' as sqlite;

import '../../../exceptions/app_exceptions.dart';

enum DatabaseType { INTEGER, REAL, TEXT, BLOB }

abstract class SqliteHelper {
  Future<Either<Exception, sqlite.Database>> openDatabase({
    required String databaseName,
    required String tableName,
    required Map<String, DatabaseType> columns,
  });

  Future<Either<Exception, List<Map<String, dynamic>>>> getData({
    required sqlite.Database database,
    required String tableName,
  });

  Future<Either<Exception, Unit>> addData({
    required sqlite.Database database,
    required String tableName,
    required Map<String, dynamic> data,
  });

  Future<Either<Exception, Unit>> deleteData({
    required sqlite.Database database,
    required String tableName,
    required String keyName,
    required String keyValue,
  });
}

class SqliteHelperImpl implements SqliteHelper {
  @override
  Future<Either<Exception, sqlite.Database>> openDatabase({
    required String databaseName,
    required String tableName,
    required Map<String, DatabaseType> columns,
  }) async {
    try {
      final database = await sqlite.openDatabase(
        databaseName,
        version: 1,
        onCreate: (db, __) async {
          final query =
              columns.entries.map((e) => '${e.key} ${e.value.name}').join(', ');
          await db.execute('CREATE TABLE $tableName ($query)');
        },
      );
      return Right(database);
    } catch (e) {
      log('====================== local database error ========== \n$e');
      return Left(LocalDatabaseException());
    }
  }

  @override
  Future<Either<Exception, List<Map<String, dynamic>>>> getData({
    required sqlite.Database database,
    required String tableName,
  }) async {
    try {
      List<Map<String, dynamic>> result =
          await database.rawQuery('SELECT * FROM $tableName');
      return Right(result);
    } catch (e) {
      log('====================== local database error ========== \n$e');
      return Left(LocalDatabaseException());
    }
  }

  @override
  Future<Either<Exception, Unit>> addData({
    required sqlite.Database database,
    required String tableName,
    required Map<String, dynamic> data,
  }) async {
    try {
      final String keys = data.entries.map((e) => e.key).join(', ');
      final values = data.entries.map((e) => '?').join(', ');

      await database.rawInsert(
        'INSERT INTO $tableName ($keys) VALUES($values)',
        data.entries.map((e) => e.value).toList(),
      );

      return const Right(unit);
    } catch (e) {
      log('====================== local database error ========== \n$e');
      return Left(LocalDatabaseException());
    }
  }

  @override
  Future<Either<Exception, Unit>> deleteData({
    required sqlite.Database database,
    required String tableName,
    required String keyName,
    required String keyValue,
  }) async {
    try {
      await database
          .rawDelete('DELETE FROM $tableName WHERE $keyName = ?', [keyValue]);
      return const Right(unit);
    } catch (e) {
      log('====================== local database error ========== \n$e');
      return Left(LocalDatabaseException());
    }
  }
}
