import 'package:flutter/material.dart';

class SearchableDropdown<T> extends StatefulWidget {
  final T? value;
  final String label;
  final List<T> items;
  final String Function(T) itemBuilder;
  final ValueChanged<T?>? onChanged;
  final String? Function(T)? searchBuilder;
  final String hintText;

  const SearchableDropdown({
    Key? key,
    this.value,
    required this.label,
    required this.items,
    required this.itemBuilder,
    this.onChanged,
    this.searchBuilder,
    this.hintText = 'Cari...',
  }) : super(key: key);

  @override
  State<SearchableDropdown<T>> createState() => _SearchableDropdownState<T>();
}

class _SearchableDropdownState<T> extends State<SearchableDropdown<T>> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<T> _filteredItems = [];
  bool _isOpen = false;
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items;

    // Set initial text if value is selected
    if (widget.value != null) {
      _searchController.text = widget.itemBuilder(widget.value!);
    }

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _openDropdown();
      }
    });
  }

  @override
  void didUpdateWidget(SearchableDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.items != oldWidget.items) {
      _filteredItems = widget.items;
    }

    // Update text when value changes externally
    if (widget.value != oldWidget.value) {
      if (widget.value != null) {
        _searchController.text = widget.itemBuilder(widget.value!);
      } else {
        _searchController.clear();
      }
    }
  }

  void _filterItems(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredItems = widget.items;
      } else {
        _filteredItems = widget.items.where((item) {
          final searchText =
              widget.searchBuilder?.call(item) ?? widget.itemBuilder(item);
          return searchText.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
    _updateOverlay();
  }

  void _openDropdown() {
    if (_isOpen) return;

    _isOpen = true;
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _closeDropdown() {
    if (!_isOpen) return;

    _isOpen = false;
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _updateOverlay() {
    if (_isOpen) {
      _overlayEntry?.markNeedsBuild();
    }
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Size size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 5.0),
          child: Material(
            elevation: 4.0,
            borderRadius: BorderRadius.circular(8.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200),
              child: _filteredItems.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Tidak ada data ditemukan',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: _filteredItems.length,
                      separatorBuilder: (context, index) =>
                          const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final item = _filteredItems[index];
                        final isSelected = widget.value == item;

                        return ListTile(
                          dense: true,
                          title: Text(
                            widget.itemBuilder(item),
                            style: TextStyle(
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: isSelected
                                  ? Theme.of(context).primaryColor
                                  : null,
                            ),
                          ),
                          trailing: isSelected
                              ? Icon(
                                  Icons.check,
                                  color: Theme.of(context).primaryColor,
                                  size: 20,
                                )
                              : null,
                          onTap: () {
                            _searchController.text = widget.itemBuilder(item);
                            widget.onChanged?.call(item);
                            _closeDropdown();
                            _focusNode.unfocus();
                          },
                        );
                      },
                    ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _closeDropdown();
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: () {
          if (_isOpen) {
            _closeDropdown();
            _focusNode.unfocus();
          } else {
            _focusNode.requestFocus();
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: _searchController,
              focusNode: _focusNode,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                hintText: widget.hintText,
                suffixIcon: Icon(
                  _isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16.0,
                ),
              ),
              onChanged: _filterItems,
              onTap: _openDropdown,
            ),
          ],
        ),
      ),
    );
  }
}
