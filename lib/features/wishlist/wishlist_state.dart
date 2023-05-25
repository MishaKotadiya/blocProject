part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}
abstract class WishlistActionState extends WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistSuccessState extends WishlistActionState{
  final List<ProductDataModel> wishlistitems;

  WishlistSuccessState({ required this.wishlistitems});
}
