import 'package:flutter/material.dart';
import 'package:zoja_test/model/model.dart';
import 'package:zoja_test/module/module.dart';
import 'package:zoja_test/route/route.dart';

abstract class AppPage {
  static get generateRoute => (RouteSettings setting) {
        if (setting.name == AppRoute.transactionDetailPage) {
          return PageRouteBuilder(
              pageBuilder: (context, p, s) => TransactionDetail(
                    id: setting.arguments as int,
                  ),
              transitionsBuilder: (_, a, __, c) => FadeTransition(
                    opacity: a,
                    child: c,
                  ));
        }
        if (setting.name == AppRoute.editTransactionPage) {
          return PageRouteBuilder(
              pageBuilder: (context, p, s) => EditTransaction(
                    transaction: setting.arguments as Transaction,
                  ),
              transitionsBuilder: (_, a, __, c) => FadeTransition(
                    opacity: a,
                    child: c,
                  ));
        }

        ///This is the fallback page
        return PageRouteBuilder(
            pageBuilder: (context, p, s) => const TransactionsPage(),
            transitionsBuilder: (_, a, __, c) => FadeTransition(
                  opacity: a,
                  child: c,
                ));
      };
}
