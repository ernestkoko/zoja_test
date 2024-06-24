import 'package:flutter/material.dart';
import 'package:zoja_test/extension/extension.dart';
import 'package:zoja_test/route/route.dart';

import '../model/model.dart';

class TransactionListItem extends StatelessWidget {
  final Transaction transaction;
  final Function()? onTap;

  const TransactionListItem({super.key, required this.transaction, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: ListTile(
        title: Text(transaction.description!),
        subtitle: Text(transaction.date!.formatStringDate),
        trailing: Text('\$${transaction.amount}'),
      ),
    );
  }
}