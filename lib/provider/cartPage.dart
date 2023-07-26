import 'package:flutter/material.dart';
import 'package:flutter_techmaster/provider/model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          actions: [
            Consumer<CartModel>(builder: (context, value, child) {
              return Container(
                alignment: Alignment.center,
                // color: Colors.red,
                child: Text(
                  '${value.list.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              );
            }),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                )),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => CartRowItem(index: index),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: context.read<CartModel>().list.length)
        // CustomScrollView(slivers: [
        //   SliverList(
        //       delegate: SliverChildBuilderDelegate(
        //     (context, index) => RowItem(index: index),
        //   ))
        // ]),
        );
  }
}

class CartRowItem extends StatelessWidget {
  final int index;

  const CartRowItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    ItemModel item =
        context.select<CartModel, ItemModel>((cart) => cart.getByIndex(index));
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Row(children: [
          Container(width: 30, height: 30, color: item.color),
          const SizedBox(
            width: 10,
          ),
          Center(
              child: Text(
            item.name,
            style: const TextStyle(fontSize: 20),
          )),
        ]));
  }
}
