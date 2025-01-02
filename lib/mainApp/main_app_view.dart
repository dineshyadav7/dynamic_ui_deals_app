import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/fetch_contents_bloc.dart';
import 'blocs/fetch_sections_bloc.dart';
import 'reusables/custom_appbar.dart';
import 'reusables/data_not_found.dart';
import 'reusables/loader.dart';
import 'reusables/sized_box_hw.dart';
import 'screens/carouselSlider/carousel_slider_view.dart';
import 'screens/cardBanner/card_banner_screen.dart';
import 'screens/categoryView/category_screen.dart';
import 'screens/dealsView/deals_of_the_day_screen.dart';
import 'screens/offersAndDiscounts/offers_and_discounts_screen.dart';

class MainAppView extends StatefulWidget {
  const MainAppView({super.key});

  @override
  State<MainAppView> createState() => _MainAppViewState();
}

class _MainAppViewState extends State<MainAppView> {
  @override
  void initState() {
    context.read<FetchContentsBloc>().add(FetchContents());
    context.read<FetchSectionsBloc>().add(FetchSections());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchContentsBloc, FetchContentsState>(
      builder: (context, fcs) {
        return BlocBuilder<FetchSectionsBloc, FetchSectionsState>(
          builder: (context, fss) {
            return Scaffold(
              body: SafeArea(
                child: fss is FetchSectionsProgress
                    ? const LoaderContainerWithMessage(message: "Loading data")
                    : fcs is FetchContentsSuccess && fss is FetchSectionsSuccess
                        ? Column(
                            children: [
                              hb4,
                              const CutomAppBar(),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      hb10,

                                      ///section -1 carousel slider view
                                      const CarouselSliderView(),

                                      ///section -2 category
                                      const CategoryScreen(),
                                      hb20,

                                      ///section -3 card banner
                                      const CardBannerScreen(),
                                      hb10,

                                      ///section -4 offers and discount
                                      const OffersAndDiscountsScreen(),
                                      hb20,

                                      ///section -5 deals of the day
                                      const DealsOfTheDayScreen(),
                                      hb20,
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const DataNotFound(),
              ),
            );
          },
        );
      },
    );
  }
}
