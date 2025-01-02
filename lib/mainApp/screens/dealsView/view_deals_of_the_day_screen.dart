import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/fetch_contents_bloc.dart';
import '../../blocs/fetch_sections_bloc.dart';
import '../../models/content_model.dart';
import '../../reusables/colors.dart';
import '../../reusables/section_page_header.dart';
import '../../models/section_model.dart';
import '../../reusables/buttons.dart';
import '../../reusables/network_image_view.dart';
import '../../reusables/sized_box_hw.dart';

class ViewDealsOfTheDayScreen extends StatelessWidget {
  const ViewDealsOfTheDayScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchContentsBloc, FetchContentsState>(
      builder: (context, fcs) {
        return BlocBuilder<FetchSectionsBloc, FetchSectionsState>(
          builder: (context, fss) {
            return fcs is FetchContentsSuccess && fss is FetchSectionsSuccess
                ? fss.dealsSection != null || fcs.deals.isNotEmpty
                    ? Scaffold(
                        backgroundColor: white,
                        appBar: AppBar(title: SectionTitle(section: fss.dealsSection!)),
                        body: SafeArea(
                          child: GridView.builder(
                            itemCount: fcs.deals.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                            ),
                            itemBuilder: (context, index) {
                              ContentModel content = fcs.deals[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: NetworkImageView(
                                        height: 90,
                                        imageUrl: content.imageUrl,
                                        color: hex(content.itemBgColor),
                                        border: content.itemBorder,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      child: Text(
                                        content.itemTitle,
                                        style: TextStyle(
                                          fontSize: content.itemTitleFontSize,
                                          fontWeight: getFontWeight(content.itemTitleFontWeight),
                                          color: hex(content.itemTitleColor),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    hb6,
                                    CustomCTAButton(content: content),
                                  ],
                                ),
                              );
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
