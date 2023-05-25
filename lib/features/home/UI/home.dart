import 'package:blocproject/features/cart/UI/cart.dart';
import 'package:blocproject/features/wishlist//UI/wishlist.dart';
import 'package:blocproject/features/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocproject/features/home/UI/product_tile_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is !HomeActionState,
      listener: (context, state) {
        if(state is HomeNavigateToCartPageActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Cart()));
        }
        else if(state is HomeNavigateToWishlistPageActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Wishlist()));
        }
        else if (state is HomeProductItemsWishlistedActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Added to Wishlist")));
        }
        else if (state is HomeProductItemsCartedActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Added to shopping Cart")));
        }
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
            break;

          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.grey,
                title: Text("PUMA shoes"),
                actions: [
                  IconButton(onPressed: (){
                    homeBloc.add(HomeWishlistButtonNavigateEvent());
                  }, icon: Icon(Icons.favorite_border)),

                  IconButton(onPressed: (){
                    homeBloc.add(HomeCartButtonNavigateEvent());
                  }, icon: Icon(Icons.shopping_cart_outlined)),
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index){
                    return ProductTileWidget(
                        homeBloc: homeBloc,
                        productDataModel: successState.products[index]);
              }),
            );
            break;

          case HomeErrorState:
            return Scaffold(body: Center(
              child: Text('Error'),
            ),);


          default:
            return SizedBox();
        }
      },
    );
  }
}
