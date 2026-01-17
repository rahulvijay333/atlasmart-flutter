import 'package:flutter/material.dart';

class StockUpdateDialog extends StatefulWidget {
  final String productName;
  final int currentStock;

  const StockUpdateDialog({
    super.key,
    required this.productName,
    required this.currentStock,
  });

  @override
  State<StockUpdateDialog> createState() => _StockUpdateDialogState();
}

class _StockUpdateDialogState extends State<StockUpdateDialog> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: '0');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Update Stock: ${widget.productName}'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Current Stock: ${widget.currentStock}'),
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Quantity Adjustment',
              helperText: 'Positive to add, negative to reduce',
              border: OutlineInputBorder(),
            ),
            keyboardType: const TextInputType.numberWithOptions(signed: true),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            // Implement stock update logic here
            Navigator.pop(context);
          },
          child: const Text('Update'),
        ),
      ],
    );
  }
}
