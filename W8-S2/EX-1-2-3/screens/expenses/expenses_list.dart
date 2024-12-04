import 'dart:math';

import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expenses_item.dart';

class ExpensesList extends StatefulWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onExpenseRemoved});

  final List<Expense> expenses;
  final Function(Expense) onExpenseRemoved;

  @override
  State<ExpensesList> createState() => _ExpensesListState();
}

class _ExpensesListState extends State<ExpensesList> {
  void _removeExpense(Expense expense) {
    setState(() {
      widget.expenses.remove(expense);
    });

    // Clear any existing snack bars
    ScaffoldMessenger.of(context).clearSnackBars();

    // Show snack bar with undo option
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${expense.title} removed.'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            setState(() {
                  
              widget.expenses.insert(0, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: widget.expenses.isEmpty
          ? Center(
              child: Text(
                'No expenses added yet!',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            )
          : ListView.builder(
              itemCount: widget.expenses.length,
              itemBuilder: (context, index) => Dismissible(
                key: Key(widget.expenses[index].id),
                onDismissed: (direction) {
                  _removeExpense(widget.expenses[index]);
                  widget.onExpenseRemoved(widget.expenses[index]);
                },
                child: ExpenseItem(widget.expenses[index]),
              ),
            ),
    );
  }
}


