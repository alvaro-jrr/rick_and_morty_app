import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/utils/debouncer.dart';

class CharacterSearchTextField extends StatefulWidget {
  /// The callback to search characters.
  final Function(String name) onSearch;

  const CharacterSearchTextField({super.key, required this.onSearch});

  @override
  State<CharacterSearchTextField> createState() =>
      _CharacterSearchTextFieldState();
}

class _CharacterSearchTextFieldState extends State<CharacterSearchTextField> {
  /// The debouncer.
  final _searchDebouncer = Debouncer(milliseconds: 500);

  /// The text controller.
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        prefixIcon: Icon(Icons.search),
        hintText: 'Buscar por nombre',
        suffixIcon: ValueListenableBuilder(
          valueListenable: _searchController,
          builder: (context, value, child) {
            return Visibility(visible: value.text.isNotEmpty, child: child!);
          },
          child: IconButton(
            onPressed: () {
              // Reset the value.
              _searchController.text = '';

              // Clear the search.
              widget.onSearch('');
            },
            icon: Icon(Icons.close),
          ),
        ),
      ),
      onChanged: (value) {
        _searchDebouncer.run(() => widget.onSearch(value.trim()));
      },
    );
  }
}
