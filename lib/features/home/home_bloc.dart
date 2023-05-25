import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocproject/data/cart_items.dart';
import 'package:blocproject/data/shoes_data.dart';
import 'package:blocproject/data/wishlist_items.dart';
import 'package:blocproject/features/home/model/my_home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<HomeProductWishlistButtonClickedEvent>(homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(products: ShoesData.shoeProducts.map((e) =>
        ProductDataModel(
            id: e['id'], name: e['name'], price: e['price'], color: e['color'], imageURL: e['imageURL'])).toList()));

  }

  FutureOr<void> homeWishlistButtonNavigateEvent(HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Wishlist navigator button clicked");
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("shopping cart navigator button clicked");
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Wishlist on product button clicked");
    wishListItems.add(event.clickedProduct);
    emit(HomeProductItemsWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("cart on product button clicked");
    cartItems.add(event.clickedProductforCart);
    emit(HomeProductItemsCartedActionState());
  }


}
