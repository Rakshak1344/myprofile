import 'package:flutter/material.dart';
import 'package:profile/ui/theme/app_colors.dart';
import 'package:profile/ui/theme/widget/app_bar_theme.dart';
import 'package:profile/ui/theme/widget/app_bottom_sheet_theme.dart';
import 'package:profile/ui/theme/widget/app_button_theme.dart';
import 'package:profile/ui/theme/widget/app_card_theme.dart';
import 'package:profile/ui/theme/widget/app_chip_theme.dart';
import 'package:profile/ui/theme/widget/app_divider_theme.dart';
import 'package:profile/ui/theme/widget/app_floating_action_button_theme.dart';
import 'package:profile/ui/theme/widget/app_icons_theme.dart';
import 'package:profile/ui/theme/widget/app_input_decoration_theme.dart';
import 'package:profile/ui/theme/widget/app_list_tile_theme.dart';
import 'package:profile/ui/theme/widget/app_text_theme.dart';
import 'package:profile/ui/theme/widget/navigation_bar_theme.dart';

class AppTheme {
  static ThemeData commonTheme(ThemeData themeData) {
    return themeData.copyWith(
      iconTheme: AppIconsTheme.theme(themeData),
      floatingActionButtonTheme:
          AppFloatingActionButtonTheme.floatingActionButtonThemeData(
        themeData,
      ),
      elevatedButtonTheme: AppButtonTheme.elevatedButton(themeData),
      outlinedButtonTheme: AppButtonTheme.outlinedButton(themeData),
      filledButtonTheme: AppButtonTheme.filledButton(themeData),
      iconButtonTheme: AppButtonTheme.iconButton(themeData),
      textButtonTheme: AppButtonTheme.textButton(themeData),
      listTileTheme: AppListTileTheme.light(themeData),
      cardTheme: AppCardTheme.light(themeData),
      inputDecorationTheme: AppInputDecorationTheme.light(themeData),
      appBarTheme: AppBarThemeData.light(themeData),
      bottomSheetTheme: AppBottomSheetTheme.light(themeData),
      navigationBarTheme: AppNavBarTheme.getTheme(themeData),
      indicatorColor: AppColors.green,
      chipTheme: AppChipTheme.light(themeData),
      dividerTheme: AppDividerTheme.light(themeData),
    );
  }

  static ThemeData get light {
    return commonTheme(
      ThemeData.from(
        useMaterial3: true,
        colorScheme: AppColors.light,
        textTheme: AppTextTheme.light(),
      ),
    );
  }

  static ThemeData get consumerLight {
    return commonTheme(
      ThemeData.from(
        useMaterial3: true,
        colorScheme: AppColors.consumerLight,
        textTheme: AppTextTheme.light(),
      ),
    );
  }

  static ThemeData get dark {
    return commonTheme(
      ThemeData.from(useMaterial3: true, colorScheme: AppColors.dark),
    ).copyWith(
      iconTheme: AppIconsTheme.theme(light),
      elevatedButtonTheme: AppButtonTheme.elevatedButton(light),
      outlinedButtonTheme: AppButtonTheme.outlinedButton(light),
      listTileTheme: AppListTileTheme.dark(light),
      cardTheme: AppCardTheme.dark(light),
    );
  }
}
