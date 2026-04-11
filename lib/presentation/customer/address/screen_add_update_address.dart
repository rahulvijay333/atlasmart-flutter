import 'package:atlasmart/application/customer/address/address_bloc.dart';
import 'package:atlasmart/domain/core/constants/colors.dart';
import 'package:atlasmart/domain/customer/address/model/address_model.dart';
import 'package:atlasmart/presentation/common/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/snack_bar.dart';

class ScreenAddUpdateAddress extends StatefulWidget {
  final AddressModel? address;

  const ScreenAddUpdateAddress({super.key, this.address});

  @override
  State<ScreenAddUpdateAddress> createState() => _ScreenAddUpdateAddressState();
}

class _ScreenAddUpdateAddressState extends State<ScreenAddUpdateAddress> {
  final _formKey = GlobalKey<FormState>();
  final _address1Controller = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _pincodeController = TextEditingController();
  final _countryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.address != null) {
      _address1Controller.text = widget.address!.address1;
      _streetController.text = widget.address!.street;
      _cityController.text = widget.address!.city;
      _stateController.text = widget.address!.state;
      _pincodeController.text = widget.address!.pincode;
      _countryController.text = widget.address!.country;
    }
  }

  @override
  void dispose() {
    _address1Controller.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _pincodeController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isEdit = widget.address != null;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(isEdit ? 'Update Address' : 'Add New Address'),
        centerTitle: true,
      ),
      body: BlocConsumer<AddressBloc, AddressState>(
        listener: (context, state) {
          if (state.actionSuccess) {
            AppSnackBar.show(
              context,
              isEdit
                  ? 'Address updated successfully'
                  : 'Address added successfully',
            );
            Navigator.pop(context);
          } else if (state.errorMessage != null) {
            AppSnackBar.show(context, state.errorMessage!);
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildTextField(
                  controller: _address1Controller,
                  label: 'Address Line 1',
                  hint: 'House No, Building Name',
                  icon: Icons.home_outlined,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter address'
                      : null,
                ),
                _buildTextField(
                  controller: _streetController,
                  label: 'Street',
                  hint: 'Street, Area, Colony',
                  icon: Icons.streetview_outlined,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter street'
                      : null,
                ),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        controller: _cityController,
                        label: 'City',
                        hint: 'City',
                        icon: Icons.location_city_outlined,
                        validator: (value) => value == null || value.isEmpty
                            ? 'Enter city'
                            : null,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField(
                        controller: _stateController,
                        label: 'State',
                        hint: 'State',
                        icon: Icons.map_outlined,
                        validator: (value) => value == null || value.isEmpty
                            ? 'Enter state'
                            : null,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        controller: _pincodeController,
                        label: 'Pincode',
                        hint: '6-digit pincode',
                        icon: Icons.pin_drop_outlined,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Enter pincode';
                          if (value.length != 6) return 'Invalid pincode';
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField(
                        controller: _countryController,
                        label: 'Country',
                        hint: 'Country',
                        icon: Icons.public_outlined,
                        validator: (value) => value == null || value.isEmpty
                            ? 'Enter country'
                            : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                ButtonWidget(
                  title: isEdit ? 'Update Address' : 'Save Address',
                  height: 50,
                  isloading: state.isLoading,
                  ontap: state.isLoading ? () {} : _onSave,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(icon, color: AppColors.amberColor, size: 22),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  void _onSave() {
    if (_formKey.currentState!.validate()) {
      final address = AddressModel(
        id: widget.address?.id,
        address1: _address1Controller.text.trim(),
        street: _streetController.text.trim(),
        city: _cityController.text.trim(),
        state: _stateController.text.trim(),
        pincode: _pincodeController.text.trim(),
        country: _countryController.text.trim(),
      );

      if (widget.address != null) {
        context.read<AddressBloc>().add(UpdateAddress(address));
      } else {
        context.read<AddressBloc>().add(AddAddress(address));
      }
    }
  }
}
