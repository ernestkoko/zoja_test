import 'package:flutter/material.dart';
import 'package:zoja_test/route/route.dart';
import 'package:zoja_test/service/service.dart';

import '../model/model.dart';
import '../widgets/widget.dart';

class TransactionDetail extends StatelessWidget {
  const TransactionDetail({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkResponse(
          onTap: () {
            Navigator.of(context).popAndPushNamed(AppRoute.transactionPage);
          },
          child: const Icon(Icons.arrow_back_rounded),
        ),
        title: Text('Transaction ID: $id'),
      ),
      body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: FutureBuilder<Transaction>(
            future: fetchTransaction(id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingIndicator();
              } else if (snapshot.hasError) {
                return ErrorDisplay(error: snapshot.error.toString());
              } else if (!snapshot.hasData) {
                return NoDataDisplay();
              } else {
                final transaction = snapshot.data;
                return Column(
                  children: [
                    TransactionListItem(transaction: transaction!),
                    InkResponse(
                      onTap: () {
                        ///Edit
                        Navigator.of(context).pushNamed(
                            AppRoute.editTransactionPage,
                            arguments: snapshot.data!);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        child: const Icon(Icons.edit),
                      ),
                    ),
                  ],
                );
              }
            },
          )),
    );
  }

  Future<Transaction> fetchTransaction(int id) async {
    return await ITransactionService.instance.getTransaction(id: id);
  }
}
