import 'package:flutter/material.dart';
import 'package:flutter_techmaster/provider/cartPage.dart';
import 'package:flutter_techmaster/provider/model.dart';
import 'package:provider/provider.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Catalog'),
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
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const CartPage()));
                },
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
            itemBuilder: (context, index) => RowItem(index: index),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: context.read<CatalogModel>().list.length)
        // CustomScrollView(slivers: [
        //   SliverList(
        //       delegate: SliverChildBuilderDelegate(
        //     (context, index) => RowItem(index: index),
        //   ))
        // ]),
        );
  }
}

class RowItem extends StatelessWidget {
  final int index;

  const RowItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    ItemModel item = context.select<CatalogModel, ItemModel>(
        (catalog) => catalog.getByIndex(index));
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Row(children: [
          Container(width: 30, height: 30, color: item.color),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Text(
            item.name,
            style: const TextStyle(fontSize: 20),
          )),
          Consumer<CartModel>(builder: (context, value, child) {
            return value.check(item)
                ? IconButton(
                    onPressed: () {
                      context.read<CartModel>().remove(item);
                    },
                    icon: const Icon(
                      Icons.remove_circle,
                      color: Colors.red,
                    ))
                : IconButton(
                    onPressed: () {
                      context.read<CartModel>().add(item);
                    },
                    icon: const Icon(
                      Icons.add_circle,
                      color: Colors.blue,
                    ));
          }),
        ]));
  }
}
