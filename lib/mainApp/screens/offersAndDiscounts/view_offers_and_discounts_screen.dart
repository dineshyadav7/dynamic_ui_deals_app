import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/fetch_contents_bloc.dart';
import '../../blocs/fetch_sections_bloc.dart';
import '../../models/content_model.dart';
import '../../reusables/colors.dart';
import '../../reusables/section_page_header.dart';
import 'offers_card.dart';

class ViewOffersAndDiscountsScreen extends StatelessWidget {
  const ViewOffersAndDiscountsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchContentsBloc, FetchContentsState>(
      builder: (context, fcs) {
        return BlocBuilder<FetchSectionsBloc, FetchSectionsState>(
          builder: (context, fss) {
            return fcs is FetchContentsSuccess && fss is FetchSectionsSuccess
                ? fss.offersSection != null || fcs.offers.isNotEmpty
                    ? Scaffold(
                        backgroundColor: white,
                        appBar: AppBar(title: SectionTitle(section: fss.offersSection!)),
                        body: SafeArea(
                          child: GridView.builder(
                            itemCount: fcs.offers.length,
                            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200.0,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 3 / 2,
                            ),
                            itemBuilder: (context, index) {
                              ContentModel content = fcs.offers[index];
                              return OffersCard(content: content);
                            },
                          ),
                        ),
                      )
                    : const SizedBox()
                : const SizedBox();
          },
        );
      },
    );
  }
}
