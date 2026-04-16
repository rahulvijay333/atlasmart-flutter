import 'package:atlasmart/application/customer/address/address_bloc.dart';
import 'package:atlasmart/application/customer/checkout/checkout_bloc.dart';
import 'package:atlasmart/domain/customer/address/model/address_model.dart';
import 'package:atlasmart/presentation/common/snack_bar.dart';
import 'package:atlasmart/presentation/customer/address/screen_add_update_address.dart';
import 'package:atlasmart/presentation/customer/cart/screen_checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenAddressSelect extends StatefulWidget {
  const ScreenAddressSelect({super.key});

  @override
  State<ScreenAddressSelect> createState() => _ScreenAddressSelectState();
}

class _ScreenAddressSelectState extends State<ScreenAddressSelect> {
  String? _selectedAddressId;

  @override
  void initState() {
    super.initState();
    context.read<AddressBloc>().add(FetchAddresses());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Select Delivery Address'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: BlocConsumer<AddressBloc, AddressState>(
            listener: (context, state) {
              if (state.errorMessage != null) {
                AppSnackBar.show(context, state.errorMessage!);
              }
            },
            builder: (context, state) {
              if (state.isLoading && state.addresses.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
          
              return Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        _buildAddNewButton(context),
                        const SizedBox(height: 16),
                        if (state.addresses.isEmpty && !state.isLoading)
                          const _NoAddressFound()
                        else
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.addresses.length,
                            itemBuilder: (context, index) {
                              final address = state.addresses[index];
                              return _AddressCard(
                                address: address,
                                isSelected: _selectedAddressId == address.id,
                                onSelect: () {
                                  setState(() {
                                    _selectedAddressId = address.id;
                                  });
                                },
                                onEdit: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ScreenAddUpdateAddress(address: address),
                                    ),
                                  );
                                },
                                onDelete: () =>
                                    _confirmDelete(context, address.id!),
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                  if (state.addresses.isNotEmpty)
                    _buildConfirmButton(context, state.addresses),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildAddNewButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ScreenAddUpdateAddress(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary.withAlpha(50),
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.add_circle_outline,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 12),
            Text(
              'Add New Address',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConfirmButton(
    BuildContext context,
    List<AddressModel> addresses,
  ) {
    final bool isAnySelected = _selectedAddressId != null;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
   
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: isAnySelected
                ? () {
                    if (_selectedAddressId != null) {
                      BlocProvider.of<CheckoutBloc>(
                        context,
                      ).add(Checkout(selectAddressId: _selectedAddressId!));
                    }

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ScreenCheckout(),
                      ),
                    );
                  }
                : null,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              disabledBackgroundColor: Colors.grey.shade300,
            ),
            child: const Text(
              'Confirm Address',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, String id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Address'),
        content: const Text('Are you sure you want to remove this address?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              context.read<AddressBloc>().add(DeleteAddress(id));
              Navigator.pop(context);
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

class _AddressCard extends StatelessWidget {
  final AddressModel address;
  final bool isSelected;
  final VoidCallback onSelect;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _AddressCard({
    required this.address,
    required this.isSelected,
    required this.onSelect,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(5),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Radio<String?>(
              value: address.id,
              groupValue: isSelected ? address.id : null,
              onChanged: (_) => onSelect(),
              activeColor: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                  Text(
                    '${address.address1}, ${address.street}\n${address.city}, ${address.state} - ${address.pincode}',
                    style: TextStyle(color: Colors.grey.shade700, height: 1.5),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Country: ${address.country}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit_outlined, size: 20),
                  color: Colors.blueAccent,
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete_outline, size: 20),
                  color: Colors.redAccent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _NoAddressFound extends StatelessWidget {
  const _NoAddressFound();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Icon(
              Icons.location_off_outlined,
              size: 60,
              color: Colors.grey.shade300,
            ),
            const SizedBox(height: 16),
            Text(
              'No addresses found.\nAdd one to proceed.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade500),
            ),
          ],
        ),
      ),
    );
  }
}
