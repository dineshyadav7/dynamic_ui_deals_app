import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/fetch_contents_bloc.dart';
import '../../models/content_model.dart';
import 'card_banner_tile.dart';

class CardBannerScreen extends StatelessWidget {
  const CardBannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchContentsBloc, FetchContentsState>(
      builder: (context, fcs) {
        return fcs is FetchContentsSuccess
            ? fcs.cardBanners.isNotEmpty
                ? SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: fcs.cardBanners.length,
                      itemBuilder: (context, index) {
                        ContentModel cardBanner = fcs.cardBanners[index];
                        return CardBannerTile(cardBanner: cardBanner);
                      },
                    ),
                  )
                : const SizedBox()
            : const SizedBox();
      },
    );
  }
}
