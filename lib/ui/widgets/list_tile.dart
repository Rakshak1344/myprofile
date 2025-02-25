
import 'package:flutter/material.dart';
import 'package:profile/ui/theme/widget/app_sizer.dart';

class SettingsListTileModel {
  final String title;
  final String? subTitle;
  final VoidCallback? onTap;
  final IconData icon;
  final Color? iconColor;
  final Color? backgroundColor;

  const SettingsListTileModel({
    required this.title,
    this.subTitle,
    this.onTap,
    required this.icon,
    this.iconColor,
    this.backgroundColor,
  });
}

class SettingsListTile extends StatelessWidget {
  final SettingsListTileModel e;
  final bool shouldBlock;
  final bool shouldShowWarning;

  const SettingsListTile(
    this.e, {
    super.key,
    this.shouldBlock = false,
    this.shouldShowWarning = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: shouldBlock ? null : e.onTap,
      dense: true,
      visualDensity: const VisualDensity(vertical: -2, horizontal: 0),
      leading: buildIcon(context,
          iconColor: e.iconColor, backgroundColor: e.backgroundColor),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(e.title),
          AppStaticWSizer.six(),
          if (shouldShowWarning)
            Icon(
              Icons.warning_amber_rounded,
              size: 18,
              color: Theme.of(context).colorScheme.error,
            ),
        ],
      ),
      subtitle: e.subTitle != null ? Text(e.subTitle!) : null,
      trailing: buildRightIcon(context),
    );
  }

  Icon buildRightIcon(BuildContext context) {
    return Icon(
      Icons.arrow_forward_ios_rounded,
      size: 22,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  CircleAvatar buildIcon(BuildContext context,
      {Color? iconColor, Color? backgroundColor}) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      child: Icon(
        e.icon,
        color: iconColor ?? Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
