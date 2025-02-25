// import 'package:core/arch/storage/preference.dart';
// import 'package:core/arch/storage/preference_keys.dart';
// import 'package:core/ui/widgets/language_selector_list.dart';
// import 'package:core/utils/language_data.dart';
// import 'package:core/utils/snackbar.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
//
// class AppLocalePage extends ConsumerStatefulWidget {
//   final List<LanguageData> languageDataList;
//
//   const AppLocalePage({super.key, required this.languageDataList});
//
//   @override
//   ConsumerState<AppLocalePage> createState() => _AppLocalePageState();
// }
//
// class _AppLocalePageState extends ConsumerState<AppLocalePage> {
//   String? selectedLanguage;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(),
//       backgroundColor: Theme.of(context).colorScheme.surface,
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: buildProceedButton(ref),
//       body: LanguageSelectorList(
//         languageDataList: widget.languageDataList,
//         currentLanguage: selectedLanguage ??
//             ref.read(preferenceProvider).getValue(PreferenceKeys.language),
//         onLanguageChange: (lang) => setState(() => selectedLanguage = lang),
//       ),
//     );
//   }
//
//   Widget buildProceedButton(ref) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
//       child: FilledButton(
//         // key: K.onboarding.chooseLanguageButton,
//         onPressed: onChooseTap,
//         child: const Text("CHOOSE"),
//       ),
//     );
//   }
//
//   void onChooseTap(){
//      ref
//         .read(preferenceProvider)
//         .setValue(PreferenceKeys.language, selectedLanguage);
//     var locale = widget.languageDataList
//         .firstWhere((langData) => langData.key == selectedLanguage)
//         .locale;
//
//     context
//       ..setLocale(locale)
//       ..pop()
//       ..showSnackBar("Language set to $selectedLanguage");
//   }
//
//   AppBar buildAppBar() {
//     return AppBar(
//       title: const Text('CHOOSE LANGUAGE'),
//       centerTitle: true,
//     );
//   }
// }
//
// //TODO: Removed once consumer aap redirect is updated to middlewares
// Future<void> showAppLocaleBottomSheet(
//     BuildContext context, List<LanguageData> languageDataList) {
//   var shape = const RoundedRectangleBorder(
//     borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
//   );
//   var constraints = BoxConstraints(
//     maxHeight: MediaQuery.of(context).size.height - kToolbarHeight,
//   );
//
//   return showModalBottomSheet(
//     context: context,
//     isDismissible: true,
//     isScrollControlled: true,
//     enableDrag: true,
//     shape: shape,
//     constraints: constraints,
//     builder: (BuildContext context) => ClipRRect(
//       borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
//       child: AppLocalePage(
//         languageDataList: languageDataList,
//       ),
//     ),
//   );
// }
