import 'dart:io';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/adaptive_flat_btn.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _descController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  void _addFromKeyboard() {
    widget.addTx(_descController.text, double.parse(_amountController.text),
        _selectedDate);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 4,
        child: Container(
          height: 500,
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Description'),
                  controller: _descController,
                  onSubmitted: (_) => _addFromKeyboard,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: _amountController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (_) => _addFromKeyboard,
                ),
                Row(
                  children: [
                    Text(_selectedDate == null
                        ? "No Date Chosen!"
                        : DateFormat.yMMMd()
                            .format(_selectedDate ?? DateTime.now())),
                    AdaptiveFlatBtn("Choose Date", _presentDatePicker),
                  ],
                ),
                ElevatedButton(
                    onPressed: _addFromKeyboard,
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor),
                    child:
                        Text('Add', style: Theme.of(context).textTheme.button))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
