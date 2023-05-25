import 'package:blocproject/features/wishlist/UI/wishlist_tile_widget.dart';
import 'package:blocproject/features/wishlist/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlist extends StatefulWidget {


  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {

  @override
  void initState() {
    // TODO: implement initState
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wishlist'),),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        listenWhen: (previous, current)=>current is WishlistActionState,
        buildWhen: (previous, current) => current is !WishlistActionState,

        builder: (context, state) {
          switch (state.runtimeType) {

            case WishlistSuccessState:
              final successState = state as WishlistSuccessState;
              return ListView.builder(
                itemCount: successState.wishlistitems.length,
                itemBuilder: (context, index) {
                  return WishlistTileWidget(
                      productDataModel: successState.wishlistitems[index],
                      wishlistBloc: wishlistBloc);
                },);



            default:
          }
          return Container();
        },
      ),
    );
  }
}
