import 'package:blocproject/features/cart/cart_bloc.dart';
import 'package:blocproject/features/home/home_bloc.dart';
import 'package:blocproject/features/home/model/my_home_product_data_model.dart';
import 'package:flutter/material.dart';

class CartTileWidget extends StatelessWidget {

  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTileWidget({ required this.productDataModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black)
      ),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productDataModel.imageURL))
            ),
          ),
          const SizedBox(height: 20.0,),
          Text(productDataModel.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          Text(productDataModel.color),
          const SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Rs."+productDataModel.price.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

              Row(
                children: [
                  IconButton(onPressed: (){
                    // cartBloc.add(HomeProductWishlistButtonClickedEvent(
                    //     clickedProduct: productDataModel
                    // ));
                  }, icon: Icon(Icons.favorite_border)),
                  IconButton(onPressed: (){
                    // cartBloc.add(HomeProductCartButtonClickedEvent());
                  }, icon: Icon(Icons.shopping_cart_outlined)),
                ],
              ),
            ],
          ),




        ],
      ),
    );
  }
}
