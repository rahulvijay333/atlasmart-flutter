import 'package:flutter/material.dart';

class StockUpdateSheet extends StatefulWidget {
  final String productName;
  final int currentStock;

  const StockUpdateSheet({
    super.key,
    required this.productName,
    required this.currentStock,
  });

  @override
  State<StockUpdateSheet> createState() => _StockUpdateSheetState();
}

class _StockUpdateSheetState extends State<StockUpdateSheet> {
  late int _stockChange;
  late int _newTotal;

  @override
  void initState() {
    super.initState();
    _stockChange = 0;
    _newTotal = widget.currentStock;
  }

  void _updateStock(int change) {
    setState(() {
      _stockChange += change;
      _newTotal = widget.currentStock + _stockChange;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Update Stock',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            widget.productName,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildControlButton(Icons.remove, () => _updateStock(-1)),
              Container(
                width: 120,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      '$_newTotal',
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      _stockChange > 0
                          ? '+$_stockChange'
                          : _stockChange < 0
                          ? '$_stockChange'
                          : 'No Change',
                      style: TextStyle(
                        color: _stockChange > 0
                            ? Colors.green
                            : _stockChange < 0
                            ? Colors.red
                            : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              _buildControlButton(Icons.add, () => _updateStock(1)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () {}, child: Text("Set Exact Amount")),
            ],
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                // Implement save logic locally or via callback
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: const Text('Save Changes', style: TextStyle(fontSize: 16)),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildControlButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Icon(icon, size: 28, color: Colors.black87),
      ),
    );
  }
}
