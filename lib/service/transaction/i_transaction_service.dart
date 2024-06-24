import 'package:zoja_test/service/service.dart';

import '../../model/model.dart';
import 'transaction_service.dart';

interface class ITransactionService {
  static final ITransactionService _instance =
      TransactionService(iSqLiteService: ISQLiteService.instance);

  static ITransactionService get instance => _instance;

  Future insertTransaction({
    required String description,
    required num amount,
  }) {
    throw UnimplementedError('insertTransaction not implement');
  }

  Future<List<Transaction>> getTransactions() {
    throw UnimplementedError('getTransactions not implement');
  }

  Future<Transaction> getTransaction({
    required int id,
  }) {
    throw UnimplementedError('getTransaction not implement');
  }

  Future updateTransaction({required Transaction transaction}) {
    throw UnimplementedError('updateTransaction not implement');
  }
}
