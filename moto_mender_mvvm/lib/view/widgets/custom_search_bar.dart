import 'package:flutter/material.dart';
import 'package:moto_mender_mvvm/view/screens/search_delegate_view.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    this.suffixIocn,
  });
  final Widget? suffixIocn;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      height: 40,
      width: 380,
      child: TextField(
        onTap: () =>
            showSearch(delegate: SearchDelegeateView(), context: context),
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(width: 1, color: Color(0xff34D49E))),
            suffixIcon: suffixIocn ??
                const Icon(
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
    );
  }
}
