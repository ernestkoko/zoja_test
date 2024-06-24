import '../../model/model.dart';
import './sqlite_service.dart';

interface class ISQLiteService {
  static final ISQLiteService _instance = SQLiteService();

  static ISQLiteService get instance => _instance;

  Future insertTransaction({
    required String description,
    required num amount,
  }) {
    throw UnimplementedError('insertTransaction not implemented yet');
  }

  Future<List<Transaction>> getTransactions() {
    throw UnimplementedError('getTransactions not implemented yet');
  }

  Future<Transaction> getTransaction({
    required int id,
  }) {
    throw UnimplementedError('getTransaction not implemented yet');
  }

  Future updateTransaction({required Transaction transaction}) {
    throw UnimplementedError('updateTransaction not implemented yet');
  }
}
