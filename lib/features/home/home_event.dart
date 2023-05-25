part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {

}

class HomeProductWishlistButtonClickedEvent extends HomeEvent{
  final ProductDataModel clickedProduct;

  HomeProductWishlistButtonClickedEvent({ required this.clickedProduct});
}

class HomeProductCartButtonClickedEvent extends HomeEvent{
  final ProductDataModel clickedProductforCart;
  HomeProductCartButtonClickedEvent({ required this.clickedProductforCart});

}

class HomeWishlistButtonNavigateEvent extends HomeEvent{

}

class HomeCartButtonNavigateEvent extends HomeEvent{

}
