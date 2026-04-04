import 'package:atlasmart/application/customer/address/address_bloc.dart';
import 'package:atlasmart/domain/core/constants/colors.dart';
import 'package:atlasmart/domain/core/constants/strings.dart';
import 'package:atlasmart/presentation/customer/address/screen_add_update_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenAddress extends StatelessWidget {
  const ScreenAddress({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch addresses when screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AddressBloc>().add(FetchAddresses());
    });

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(AppStrings.shippingAddress),
        centerTitle: true,
      ),
      body: BlocConsumer<AddressBloc, AddressState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.isLoading && state.addresses.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.addresses.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No addresses saved yet',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Add a new address to get started',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.addresses.length,
            itemBuilder: (context, index) {
              // Wait, I used Addresses.size, I should check the state definition again.
              // Ah, state.addresses is List<AddressModel>, so it's .length.
              final address = state.addresses[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.grey.shade200),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.home_outlined,
                                color: AppColors.amberColor,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Home', // Could be dynamic if address has a label
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit_outlined, size: 20),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ScreenAddUpdateAddress(
                                            address: address,
                                          ),
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete_outline,
                                  size: 20,
                                  color: Colors.redAccent,
                                ),
                                onPressed: () {
                                  _showDeleteConfirmation(context, address.id!);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${address.address1}, ${address.street}',
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        '${address.city}, ${address.state} - ${address.pincode}',
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        address.country,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ScreenAddUpdateAddress(),
            ),
          );
        },
        backgroundColor: AppColors.amberColor,
        icon: const Icon(Icons.add),
        label: const Text('Add New Address'),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, String id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Address'),
        content: const Text('Are you sure you want to delete this address?'),
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
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
