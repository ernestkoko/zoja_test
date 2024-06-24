import 'package:zoja_test/service/service.dart';

import '../../model/model.dart';

class TransactionService implements ITransactionService {
  final ISQLiteService iSqLiteService;

  TransactionService({required this.iSqLiteService});

  @override
  Future insertTransaction({
    required String description,
    required num amount,
  }) async {
    await iSqLiteService.insertTransaction(
        description: description, amount: amount);
  }

  @override
  Future<List<Transaction>> getTransactions() async {
    return await iSqLiteService.getTransactions();
  }

  @override
  Future<Transaction> getTransaction({
    required int id,
  }) async {
    return await iSqLiteService.getTransaction(id: id);
  }

  @override
  Future updateTransaction({required Transaction transaction}) async {
    await ISQLiteService.instance.updateTransaction(transaction: transaction);
  }
}
