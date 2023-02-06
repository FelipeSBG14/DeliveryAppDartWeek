import 'package:delivery_app/app/core/ui/widget/shopping_bag_widget.dart';
import 'package:delivery_app/app/pages/home/widgets/delivery_product_tile.dart';
import 'package:delivery_app/app/pages/home/widgets/home_controller.dart';
import 'package:delivery_app/app/pages/home/widgets/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/ui/base_state/base_state.dart';
import '../../core/ui/widget/delivery_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  @override
  void onRead() {
    controller.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DeliveryAppbar(),
        body: BlocConsumer<HomeController, HomeState>(
          listener: (context, state) {
            state.status.matchAny(
              any: () => hideLoader(),
              loading: () => showLoader(),
              error: () {
                hideLoader();
                showError(state.errorMessage ?? 'Erro não informado');
              },
            );
          },
          buildWhen: (previous, current) => current.status.matchAny(
            any: () => false,
            initial: () => true,
            loaded: () => true,
          ),
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: ((context, index) {
                      final product = state.products[index];
                      final orders = state.shoppingBag
                          .where((order) => order.product == product);
                      return DeliveryProductTile(
                        product: product,
                        orderProduct: orders.isNotEmpty ? orders.first : null,
                      );
                    }),
                  ),
                ),
                Visibility(
                  visible: state.shoppingBag.isNotEmpty,
                  child: ShoppingBagWidget(bag: state.shoppingBag),
                ),
              ],
            );
          },
        ));
  }
}
