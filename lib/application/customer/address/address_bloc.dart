import 'dart:developer';

import 'package:atlasmart/domain/customer/address/address_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'address_event.dart';
import 'address_state.dart';

export 'address_event.dart';
export 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddressService addressService;

  AddressBloc(this.addressService) : super(AddressState.initial()) {
    on<FetchAddresses>((event, emit) => _onFetchAddresses(event, emit));
    on<AddAddress>((event, emit) => _onAddAddress(event, emit));
    on<UpdateAddress>((event, emit) => _onUpdateAddress(event, emit));
    on<DeleteAddress>((event, emit) => _onDeleteAddress(event, emit));
  }

  Future<void> _onFetchAddresses(
    FetchAddresses event,
    Emitter<AddressState> emit,
  ) async {
    emit(
      state.copyWith(isLoading: true, errorMessage: null, actionSuccess: false),
    );

    try {
      final addresses = await addressService.getUserAddress();
      emit(state.copyWith(isLoading: false, addresses: addresses));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onAddAddress(
    AddAddress event,
    Emitter<AddressState> emit,
  ) async {
    emit(
      state.copyWith(isLoading: true, errorMessage: null, actionSuccess: false),
    );

    try {
      final addresses = await addressService.addAddress(event.address);
      emit(
        state.copyWith(
          isLoading: false,
          addresses: addresses,
          actionSuccess: true,
        ),
      );
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onUpdateAddress(
    UpdateAddress event,
    Emitter<AddressState> emit,
  ) async {
    emit(
      state.copyWith(isLoading: true, errorMessage: null, actionSuccess: false),
    );

    try {
      final addresses = await addressService.updateAddress(event.address);
      emit(
        state.copyWith(
          isLoading: false,
          addresses: addresses,
          actionSuccess: true,
        ),
      );
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onDeleteAddress(
    DeleteAddress event,
    Emitter<AddressState> emit,
  ) async {
    emit(
      state.copyWith(isLoading: true, errorMessage: null, actionSuccess: false),
    );

    try {
      final addresses = await addressService.deleteUserAddress(event.id);
      emit(
        state.copyWith(
          isLoading: false,
          addresses: addresses,
          actionSuccess: true,
        ),
      );
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
