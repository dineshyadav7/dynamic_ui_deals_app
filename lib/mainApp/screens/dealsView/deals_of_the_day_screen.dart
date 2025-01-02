import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/fetch_contents_bloc.dart';
import '../../blocs/fetch_sections_bloc.dart';
import '../../models/content_model.dart';
import '../../reusables/navigators.dart';
import '../../reusables/section_page_header.dart';
import 'deals_tile.dart';
import 'view_deals_of_the_day_screen.dart';

class DealsOfTheDayScreen extends StatelessWidget {
  const DealsOfTheDayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double tileHeight = 500;
    return BlocBuilder<FetchContentsBloc, FetchContentsState>(
      builder: (context, fcs) {
        return BlocBuilder<FetchSectionsBloc, FetchSectionsState>(
          builder: (context, fss) {
            return fcs is FetchContentsSuccess && fss is FetchSectionsSuccess
                ? fss.dealsSection == null || fcs.deals.isEmpty
                    ? const SizedBox.shrink()
                    : Column(
                        children: [
                          SectionPageHeader(
                            type: 1,
                            section: fss.dealsSection!,
                            action: () {
                              pushSimple(context, const ViewDealsOfTheDayScreen());
                            },
                          ),
                          SizedBox(
                            height: (tileHeight / 2) + 50,
                            child: ListView.builder(
                              itemCount: fcs.deals.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                ContentModel content = fcs.deals[index];
                                return DealsTile(tileHeight: tileHeight, deal: content);
                              },
                            ),
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
