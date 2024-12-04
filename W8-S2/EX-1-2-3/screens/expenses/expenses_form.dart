import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/expense.dart';
import 'package:intl/intl.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  Category _selectedValue = Category.food;
  DateTime _selectedDate = DateTime.now();

  String get title => _titleController.text;

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void onCancel() {
    // Close modal
    Navigator.pop(context);
  }

  Future<void> showErrorTitleDialog() async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Title must not be empty!"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"))
            ],
          );
        });
  }

  Future<void> showErrorAmountDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Amount cannot be negative or empty"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Ok"))
            ],
          );
        });
  }

  void onAdd() {
    // 1- Get the values from inputs

    String title = _titleController.text;
    if (_titleController.text.isEmpty) {
      showErrorTitleDialog();
      return;
    }

    double? amount = double.parse(_valueController.text);
    if (amount < 0 || amount == null) {
      showErrorAmountDialog();
      return;
    }

    Category selectedCategory = _selectedValue;
    DateTime selectedDate = _selectedDate;

    // 2- Create the expense
    Expense expense = Expense(
        title: title,
        amount: amount,
        date: selectedDate, //  TODO :  For now it s a fake data
        category: selectedCategory); //  TODO :  For now it s a fake data

    // 3- Ask the parent to add the expense
    widget.onCreated(expense);

    // 4- Close modal
    Navigator.pop(context);
  }

  Future<void> _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  String showDate() {
    if (_selectedDate == null) {
      return 'No date selected';
    } else {
      return 'Date: ${_selectedDate!.toLocal()}'.split(' ')[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            controller: _valueController,
            maxLength: 50,
            decoration: const InputDecoration(
              prefix: Text('\$ '),
              label: Text('Amount'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: onCancel, child: const Text('Cancel')),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(onPressed: onAdd, child: const Text('Create')),
            ],
          ),
          DropdownButton(
              value: _selectedValue,
              items: Category.values.map((Category category) {
                return DropdownMenuItem<Category>(
                    value: category, child: Text(category.name));
              }).toList(),
              onChanged: (Category? newValue) {
                setState(() {
                  if (newValue != null) {
                    _selectedValue = newValue;
                  }
                });
              }),
          //Select date
          Row(
            children: [
              Expanded(
                child: Text(DateFormat('yyyy-MM-dd').format(_selectedDate)),
              ),
              ElevatedButton(
                onPressed: _pickDate,
                child: const Text('Pick Date'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
