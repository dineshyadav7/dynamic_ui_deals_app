import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/fetch_contents_bloc.dart';
import '../../blocs/fetch_sections_bloc.dart';
import '../../models/content_model.dart';
import '../../reusables/navigators.dart';
import '../../reusables/section_page_header.dart';
import 'offers_card.dart';
import 'view_offers_and_discounts_screen.dart';

class OffersAndDiscountsScreen extends StatelessWidget {
  const OffersAndDiscountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchContentsBloc, FetchContentsState>(
      builder: (context, fcs) {
        return BlocBuilder<FetchSectionsBloc, FetchSectionsState>(
          builder: (context, fss) {
            return fcs is FetchContentsSuccess && fss is FetchSectionsSuccess
                ? fss.offersSection == null || fcs.offers.isEmpty
                    ? const SizedBox.shrink()
                    : Column(
                        children: [
                          SectionPageHeader(
                            section: fss.offersSection!,
                            action: () {
                              pushSimple(context, const ViewOffersAndDiscountsScreen());
                            },
                          ),
                          SizedBox(
                            height: 110,
                            child: ListView.builder(
                              itemCount: fcs.offers.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                ContentModel content = fcs.offers[index];
                                return OffersCard(content: content);
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
