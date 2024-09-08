import 'package:english/cubit/change_item_cubit/change_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeWordItem extends StatefulWidget {
  const ChangeWordItem({super.key});

  @override
  State<ChangeWordItem> createState() => _ChangeWordItemState();
}

class _ChangeWordItemState extends State<ChangeWordItem>
    with TickerProviderStateMixin {
  late AnimationController _animatedController;
  bool isAnimated = false;

  @override
  void initState() {
    _animatedController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _animatedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        if (isAnimated) {
          _animatedController.reverse();
          isAnimated = false;
          context.read<ChangeItemCubit>().changeItem(0);
        } else {
          _animatedController.forward();
          isAnimated = true;
          context.read<ChangeItemCubit>().changeItem(1);
        }
      },
      child:  AnimatedIcon(
        icon: AnimatedIcons.view_list,
        progress: _animatedController,
      ),
    );
  }
}