import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocproject/data/cart_items.dart';
import 'package:blocproject/features/home/model/my_home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartitems: cartItems));
  }
}
