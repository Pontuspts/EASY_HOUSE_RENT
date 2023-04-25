import 'package:flutter/material.dart';
import 'package:EASY_HOUSE_FINDER/widgets/common_image.dart';

//searchbar desgin
class SearchBar extends StatefulWidget {
  final bool? showLocation;
  final Function? goBackCallback;
  final String? inputValue;
  final String defaultInputValue;
  final Function? onCancel;
  final bool? showMap;
  final Function? onSearch;
  final ValueChanged<String>? onSearchSubmit;

  const SearchBar(
      {Key? key,
      this.showLocation,
      this.goBackCallback,
      this.inputValue = '',
      this.defaultInputValue = 'Input Key',
      this.onCancel,
      this.showMap,
      this.onSearch,
      this.onSearchSubmit})
      : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String _searchWord = '';
  late TextEditingController _controller;
  late FocusNode _focus;

  void _onClean() {
    setState(() {
      _controller.clear();
      _searchWord = '';
    });
  }

  @override
  void initState() {
    super.initState();
    _focus = FocusNode();
    _controller = TextEditingController(text: widget.inputValue);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          if (widget.showLocation ?? false)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: const [
                    Icon(
                      Icons.room,
                      color: Colors.green,
                      size: 14,
                    ),
                    Text(
                      'Salaya',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          if (widget.goBackCallback != null)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: (widget.goBackCallback ?? () {}) as GestureTapCallback,
                child: const Icon(
                  Icons.chevron_left,
                  color: Colors.black87,
                ),
              ),
            ),
          Expanded(
            child: Container(
              height: 34,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: Colors.grey[200],
              ),
              child: TextField(
                controller: _controller,
                focusNode: _focus,
                onTap: () {
                  if (widget.onSearchSubmit == null) {
                    _focus.unfocus();
                  }
                  if (widget.onSearch != null) {
                    widget.onSearch!();
                  }
                },
                onSubmitted: widget.onSearchSubmit,
                textInputAction: TextInputAction.search,
                onChanged: (value) {
                  setState(() => _searchWord = value);
                },
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 1, left: -10),
                  border: InputBorder.none,
                  hintText: 'Input Searck Key',
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  suffixIcon: GestureDetector(
                    onTap: () => _onClean(),
                    child: Icon(
                      Icons.clear,
                      size: 18,
                      color: _searchWord == '' ? Colors.grey[200] : Colors.grey,
                    ),
                  ),
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 10, top: 2),
                    child: Icon(
                      Icons.search,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (widget.onCancel != null)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: (widget.onCancel ?? () {}) as GestureTapCallback,
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          if (widget.showMap ?? false)
            const CommonImage(
              'static/icons/widget_search_bar_map.png',
              width: 40,
              height: 40,
            ),
        ],
      ),
    );
  }
}
