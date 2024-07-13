import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery/Data/cart_items.dart';
import 'package:grocery/features/cart/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/cart/ui/cart_tile_widget.dart';
import 'package:grocery/features/home/home_bloc.dart';
import 'package:grocery/features/home/models/home_product_data_model.dart';

import '../../home/ui/home_page.dart';



class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc cartBloc = CartBloc();


  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text("Cart Page"),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {
          if (state is HomeProductItemCartedActionState){

          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return ListView.builder(
                  itemCount: successState.cartItems.length,
                  itemBuilder: (context, index) {
                    Index = index;
                    final List<ProductDataModel> cartItemsList = cartItems.toList();
                    return Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CartTileWidget(
                            cartBloc: cartBloc,
                            productDataModel: cartItemsList[Index]),
                      ],
                    );
                  });

          }
          return Container();
        },
      ),
    );
  }
}
