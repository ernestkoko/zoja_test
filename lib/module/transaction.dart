import 'package:flutter/material.dart';
import 'package:zoja_test/route/route.dart';
import 'package:zoja_test/service/service.dart';

import '../model/model.dart';
import '../widgets/widget.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkResponse(
              onTap: () async {},
              child: const Icon(Icons.delete),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkResponse(
              onTap: () async {
                await ITransactionService.instance
                    .insertTransaction(description: "Groceries", amount: 50.0);
                setState(() {});
              },
              child: const Icon(Icons.add),
            ),
          )
        ],
      ),
      body: TransactionList(),
    );
  }
}

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Transaction>>(
      future: fetchTransactions(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingIndicator();
        } else if (snapshot.hasError) {
          return ErrorDisplay(error: snapshot.error.toString());
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return NoDataDisplay();
        } else {
          return TransactionListView(transactions: snapshot.data!);
        }
      },
    );
  }

  Future<List<Transaction>> fetchTransactions() async {
    return await ITransactionService.instance.getTransactions();
  }
}

class TransactionListView extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionListView({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return TransactionListItem(
          transaction: transaction,
          onTap: () {
            Navigator.of(context).pushNamed(AppRoute.transactionDetailPage,
                arguments: transaction.id!);
          },
        );
      },
    );
  }
}
