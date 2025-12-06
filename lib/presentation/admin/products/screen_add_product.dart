import 'package:flutter/material.dart';

class ScreenAddProduct extends StatefulWidget {
  final bool isEdit;
  final Map<String, dynamic>? productData;

  const ScreenAddProduct({
    super.key,
    this.isEdit = false,
    this.productData,
  });

  @override
  State<ScreenAddProduct> createState() => _ScreenAddProductState();
}

class _ScreenAddProductState extends State<ScreenAddProduct> {
  bool _isActive = true;
  late TextEditingController _nameController;
  late TextEditingController _brandController;
  late TextEditingController _descController;
  late TextEditingController _mrpController;
  late TextEditingController _priceController;
  late TextEditingController _gstController;
  late TextEditingController _stockController;
  late TextEditingController _skuController;
  String _category = 'Electronics';

  @override
  void initState() {
    super.initState();
    _isActive = widget.productData?['isActive'] ?? true;
    _nameController = TextEditingController(text: widget.productData?['name'] ?? '');
    _brandController = TextEditingController(text: widget.productData?['brand'] ?? '');
    _descController = TextEditingController(text: widget.productData?['description'] ?? '');
    _mrpController = TextEditingController(text: widget.productData?['mrp']?.toString() ?? '');
    _priceController = TextEditingController(text: widget.productData?['price']?.toString() ?? '');
    _gstController = TextEditingController(text: widget.productData?['gst']?.toString() ?? '');
    _stockController = TextEditingController(text: widget.productData?['stock']?.toString() ?? '');
    _skuController = TextEditingController(text: widget.productData?['sku'] ?? '');
    _category = widget.productData?['category'] ?? 'Electronics';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _brandController.dispose();
    _descController.dispose();
    _mrpController.dispose();
    _priceController.dispose();
    _gstController.dispose();
    _stockController.dispose();
    _skuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEdit ? 'Edit Product' : 'Add New Product'),
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: Text(widget.isEdit ? 'Update Product' : 'Save Product', 
            style: const TextStyle(fontSize: 16)),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Status Toggle (Only visible if needed, or always prominent)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: _isActive ? Colors.green.withValues(alpha: 0.1) : Colors.red.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: _isActive ? Colors.green.withValues(alpha: 0.3) : Colors.red.withValues(alpha: 0.3)),
              ),
              child: SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  _isActive ? 'Product Active' : 'Product Inactive',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _isActive ? Colors.green : Colors.red,
                  ),
                ),
                subtitle: const Text('Inactive products will be hidden from users'),
                value: _isActive,
                activeTrackColor: Colors.green,
                activeThumbColor: Colors.white,
                onChanged: (val) {
                  setState(() => _isActive = val);
                },
              ),
            ),
            const SizedBox(height: 24),

             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Product Images',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: 100,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).primaryColor, style: BorderStyle.none),
                          color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_a_photo, color: Theme.of(context).primaryColor),
                            const SizedBox(height: 4),
                            Text(
                              'Upload',
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      _buildImagePreview(),
                      _buildImagePreview(),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                const Text('Basic Details',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 16),
                _buildTextField(controller: _nameController, label: 'Product Name', hint: 'Ex. Wireless Headphones'),
                const SizedBox(height: 16),
                 _buildTextField(controller: _brandController, label: 'Brand', hint: 'Ex. Boat, Samsung'),
                const SizedBox(height: 16),
                _buildTextField(
                    controller: _descController,
                    label: 'Description',
                    hint: 'Enter product details...',
                    maxLines: 4),
                const SizedBox(height: 24),

                const Text('Pricing & Tax (Indian Market)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        controller: _mrpController,
                        label: 'MRP (₹)',
                        hint: '2999',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField(
                        controller: _priceController,
                        label: 'Selling Price (₹)',
                        hint: '1999',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        controller: _gstController,
                        label: 'GST (%)',
                        hint: '18',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 16),
                     Expanded(
                      child: DropdownButtonFormField<String>(
                        initialValue: _category,
                        decoration: InputDecoration(
                            labelText: 'Category',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        ),
                        items: const [
                           DropdownMenuItem(value: 'Electronics', child: Text('Electronics')),
                           DropdownMenuItem(value: 'Fashion', child: Text('Fashion')),
                           DropdownMenuItem(value: 'Grocery', child: Text('Grocery')),
                        ],
                        onChanged: (val) {
                          if (val != null) setState(() => _category = val);
                        },
                      ),
                    ),
                  ],
                ),
                
                 const SizedBox(height: 24),

                const Text('Inventory',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        controller: _stockController,
                        label: 'Stock Quantity',
                        hint: '100',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField(
                        controller: _skuController,
                        label: 'SKU Code',
                        hint: 'PROD-001',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePreview() {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          const Center(child: Icon(Icons.image, color: Colors.grey)),
          Positioned(
            top: 4,
            right: 4,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, size: 14, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
