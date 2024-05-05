import 'package:flutter/material.dart';

class StoreSearchBar extends StatelessWidget {
  const StoreSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        height: 36,
        width: 380,
        child: TextField(
          decoration: InputDecoration(
              suffixIcon: const Icon(
                Icons.search,
                color: Color(0xFF757575),
              ),
              hintText: 'Search',
              hintStyle: Theme.of(context).textTheme.labelSmall,
              fillColor: const Color(0xFFE4E4E4),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(width: 1, color: Color(0xFFEAEAEA)))),
        ),
      ),
    );
  }
}
