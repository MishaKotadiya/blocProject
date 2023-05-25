import 'package:blocproject/features/cart/UI/cart_tile_widget.dart';
import 'package:blocproject/features/cart/cart_bloc.dart';
import 'package:blocproject/features/home/UI/product_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  @override
  void initState() {
    // TODO: implement initState
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  final CartBloc cartBloc = CartBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shopping Cart'),),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        listenWhen: (previous, current)=>current is CartActionState,
        buildWhen: (previous, current) => current is !CartActionState,

        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return ListView.builder(
                itemCount: successState.cartitems.length,
                itemBuilder: (context, index) {
                  return CartTileWidget(
                      productDataModel: successState.cartitems[index],
                      cartBloc: cartBloc);
                },);
            default:
          }
          return Container();
        },
      ),
    );
  }
}
