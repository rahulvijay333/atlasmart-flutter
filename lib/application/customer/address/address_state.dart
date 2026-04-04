import 'package:atlasmart/domain/customer/address/model/address_model.dart';

class AddressState {
  final bool isLoading;
  final List<AddressModel> addresses;
  final String? errorMessage;
  final bool actionSuccess;

  AddressState({
    required this.isLoading,
    required this.addresses,
    this.errorMessage,
    required this.actionSuccess,
  });

  factory AddressState.initial() => AddressState(
        isLoading: false,
        addresses: [],
        actionSuccess: false,
      );

  AddressState copyWith({
    bool? isLoading,
    List<AddressModel>? addresses,
    String? errorMessage,
    bool? actionSuccess,
  }) {
    return AddressState(
      isLoading: isLoading ?? this.isLoading,
      addresses: addresses ?? this.addresses,
      errorMessage: errorMessage ?? this.errorMessage,
      actionSuccess: actionSuccess ?? this.actionSuccess,
    );
  }
}
