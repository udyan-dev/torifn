import 'package:flutter/material.dart';
import 'package:torfin/core/utils/app_extension.dart';

import '../../../core/theme/app_style.dart';
import '../../../gen/assets.gen.dart';
import 'debouncer.dart';
import 'icon_widget.dart';

class SearchWidget extends StatefulWidget {
  final Function(String) onSearch;

  const SearchWidget({super.key, required this.onSearch});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late final TextEditingController _textController;
  final Debouncer _debouncer = Debouncer(delay: Duration(milliseconds: 350));

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _textController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _textController.removeListener(_onTextChanged);
    _textController.dispose();
    _debouncer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: context.themeColors.textPlaceholder,
      cursorRadius: Radius.circular(4),
      textAlign: TextAlign.center,
      style: AppStyle.getStyle(
        TextStyleType.heading01,
        color: context.themeColors.textSecondary,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        fillColor: context.themeColors.field01,
        filled: true,
        isDense: true,
        hintText: "Search Torrent",
        hintStyle: AppStyle.getStyle(
          TextStyleType.helperText01,
          color: context.themeColors.textPlaceholder,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: context.themeColors.borderStrong01),
          borderRadius: BorderRadius.zero,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: context.themeColors.borderStrong01),
          borderRadius: BorderRadius.zero,
        ),
        prefixIcon: IconWidget(
          icon: AppAsset.svg.icSearch,
          key: ValueKey('search'),
        ),
        suffixIcon:
            _textController.text.isEmpty
                ? const SizedBox(width: 24)
                : IconWidget(
                  icon: AppAsset.svg.icCancel,
                  enableSplash: false,
                  onTap: () {
                    _textController.clear();
                    widget.onSearch("");
                  },
                ),
      ),
      onChanged: (value) => _onSearch(context, value),
      onSubmitted: (value) => _onSearch(context, value),
    );
  }

  void _onSearch(BuildContext context, String value) =>
      _debouncer.run(() => widget.onSearch(value));
}
