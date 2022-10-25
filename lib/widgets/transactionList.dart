import 'package:flutter/material.dart';

import './transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: transactions.isEmpty
            ? LayoutBuilder(builder: (context, constraints) {
                return Column(
                  children: [
                    Text(
                      'No transaction has been added yet.',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: constraints.maxHeight * 0.6,
                        child: Image.asset(
                          'assets/images/waiting.png',
                          fit: BoxFit.cover,
                        ))
                  ],
                );
              })
            : ListView(
                children: transactions
                    .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                          transaction: tx,
                          deleteTx: deleteTx,
                        ))
                    .toList(),
              ));
  }
}
