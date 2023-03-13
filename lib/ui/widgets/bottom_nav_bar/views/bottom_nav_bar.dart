import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ui.dart';
import '../bottom_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        if (state.status == BottomNavBarStatus.initial ||
            state.status == BottomNavBarStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.status == BottomNavBarStatus.success) {
          return SimpleBottomNavBar(
            items: [
              SimpleIconButton(
                icon: Icons.home_filled,
                colorPalette: (state.index == 0)
                    ? ColorPalette.primaryContainer
                    : ColorPalette.primary,
                onPressed: () {
                  if (state.index == 0) {
                    return;
                  }
                  context.read<BottomNavBarCubit>().updateIndex(0);
                  Navigator.push(context, NewsFeedScreen.route());
                },
              ),
              SimpleIconButton(
                icon: Icons.book_rounded,
                colorPalette: (state.index == 1)
                    ? ColorPalette.primaryContainer
                    : ColorPalette.primary,
                onPressed: () {
                  if (state.index == 1) {
                    return;
                  }
                  context.read<BottomNavBarCubit>().updateIndex(1);

                  /// TODO: Push Read Later screen
                },
              ),
              SimpleIconButton(
                icon: Icons.person,
                colorPalette: (state.index == 2)
                    ? ColorPalette.primaryContainer
                    : ColorPalette.primary,
                onPressed: () {
                  if (state.index == 2) {
                    return;
                  }
                  context.read<BottomNavBarCubit>().updateIndex(2);

                  /// TODO: Push Login screen
                },
              ),
            ],
          );
        } else {
          return const SimpleText(
            'Something went wrong',
            textStyle: TextStyleEnum.bodyLarge,
          );
        }
      },
    );
  }
}
