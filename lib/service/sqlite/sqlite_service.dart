import 'dart:ffi';
import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:zoja_test/model/model.dart' as model;
import './i_sqlite_service.dart';

abstract class TableKey {
  static const transactionTableName = 'user_transaction';
  static const transactionId = 'id';
  static const transactionDescription = 'description';
  static const transactionAmount = 'amount';
  static const transactionDate = 'date';
}

class SQLiteService implements ISQLiteService {
  static Future<Database> _database() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'zoja_test.db');

    return openDatabase(
      path,
      onCreate: (Database db, int version) => _onCreate(db),
      version: 1,
    );
  }

  static void _onCreate(Database db) async {
    //Create the transaction table.
    await db.execute(
      "CREATE TABLE ${TableKey.transactionTableName} (${TableKey.transactionId} INTEGER  PRIMARY KEY AUTOINCREMENT, ${TableKey.transactionDescription} TEXT NOT NULL, ${TableKey.transactionAmount} REAL NOT NULL, ${TableKey.transactionDate} TEXT NOT NULL)",
    );
  }

  ///Insert transaction in the db
  @override
  Future insertTransaction({
    required String description,
    required num amount,
  }) async {
    final date = DateTime.now().toString();

    final db = await SQLiteService._database();
    await db.insert(
      TableKey.transactionTableName,
      {
        TableKey.transactionDescription: description,
        TableKey.transactionAmount: amount,
        TableKey.transactionDate: date
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  ///Get a list off all the transaction in the db.
  @override
  Future<List<model.Transaction>> getTransactions() async {
    final db = await SQLiteService._database();
    final rawTransactions =
        await db.rawQuery("SELECT * FROM ${TableKey.transactionTableName}");
    final List<model.Transaction> transactions = [];
    for (final t in rawTransactions) {
      final transaction = model.Transaction();
      transaction.id = t[TableKey.transactionId] as int;
      transaction.description = t[TableKey.transactionDescription] as String;
      transaction.date = t[TableKey.transactionDate] as String;
      transaction.amount = t[TableKey.transactionAmount] as double;

      transactions.add(transaction);
    }
    return transactions;
  }

  @override
  Future<model.Transaction> getTransaction({
    required int id,
  }) async {
    final db = await SQLiteService._database();
    final r = await db.rawQuery(
        "SELECT * FROM ${TableKey.transactionTableName} WHERE id =$id"); //since id is unique no need to add limit
    if (r.isEmpty) throw const HttpException("Transaction is not found");
    final firstT = r[0];
    final transaction = model.Transaction();
    transaction.id = firstT[TableKey.transactionId] as int;
    transaction.description = firstT[TableKey.transactionDescription] as String;
    transaction.date = firstT[TableKey.transactionDate] as String;
    transaction.amount = firstT[TableKey.transactionAmount] as double;

    return transaction;
  }

  @override
  Future updateTransaction({required model.Transaction transaction}) async {
    final db = await SQLiteService._database();
    await db.rawUpdate(
      'UPDATE ${TableKey.transactionTableName} SET ${TableKey.transactionDescription} = ?, ${TableKey.transactionAmount} = ? WHERE ${TableKey.transactionId} = ?',
      [
        transaction.description,
        transaction.amount,
        transaction.id,
      ],
    );
  }


}
