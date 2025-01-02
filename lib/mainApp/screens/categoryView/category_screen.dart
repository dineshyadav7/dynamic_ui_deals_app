import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/fetch_contents_bloc.dart';
import '../../blocs/fetch_sections_bloc.dart';
import '../../reusables/section_page_header.dart';
import '../../reusables/sized_box_hw.dart';
import 'category_tile.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchContentsBloc, FetchContentsState>(
      builder: (context, fcs) {
        return BlocBuilder<FetchSectionsBloc, FetchSectionsState>(
          builder: (context, fss) {
            return fcs is FetchContentsSuccess && fss is FetchSectionsSuccess
                ? fss.categorySection == null || fcs.categories.isEmpty
                    ? const SizedBox.shrink()
                    : Column(
                        children: [
                          SectionTitle(section: fss.categorySection!),
                          hb20,
                          Wrap(
                            spacing: 20,
                            alignment: WrapAlignment.center,
                            children: fcs.categories.map((category) {
                              return CategoryTile(category: category);
                            }).toList(),
                          ),
                        ],
                      )
                : const SizedBox();
          },
        );
      },
    );
  }
}
