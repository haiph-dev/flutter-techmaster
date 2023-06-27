import 'package:flutter/material.dart';

void ShowItemSelect({required BuildContext context, required List<int> data, required Function(int) onSelect}){
  showModalBottomSheet(context: context, builder: builder)
}


class _Modal extends StatefulWidget {
  const _Modal({super.key});

  @override
  State<_Modal> createState() => _ModalState();
}

class _ModalState extends State<_Modal> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: itemBuilder,
        separatorBuilder: ,
        itemCount: 5);
  }
}
