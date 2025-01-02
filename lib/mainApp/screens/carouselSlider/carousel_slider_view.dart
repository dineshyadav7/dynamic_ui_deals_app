import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/fetch_contents_bloc.dart';
import '../../reusables/network_image_view.dart';
import 'carousel_slider_dotted.dart';

class CarouselSliderView extends StatefulWidget {
  const CarouselSliderView({super.key});

  @override
  State<CarouselSliderView> createState() => _CarouselSliderViewState();
}

class _CarouselSliderViewState extends State<CarouselSliderView> {
  PageController carouselSliderController = PageController();
  int currentCarouselSlider = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startAutoScroll();
  }

  @override
  void dispose() {
    carouselSliderController.dispose();
    timer.cancel();
    super.dispose();
  }

  void startAutoScroll() {
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      carouselSliderController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchContentsBloc, FetchContentsState>(
      builder: (context, fcs) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: fcs is FetchContentsSuccess
              ? fcs.banners.isNotEmpty
                  ? Column(
                      children: [
                        SizedBox(
                          height: 200,
                          child: PageView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: carouselSliderController,
                            itemCount: fcs.banners.length * 100,
                            onPageChanged: (int currBannerSlider) {
                              setState(() {
                                currentCarouselSlider = currBannerSlider % fcs.banners.length;
                              });
                            },
                            itemBuilder: (context, index) {
                              return NetworkImageView(
                                imageUrl: fcs.banners[index % fcs.banners.length],
                              );
                            },
                          ),
                        ),
                        CarouselSliderDotted(
                          bannerLength: fcs.banners.length,
                          currentCarouselIndex: currentCarouselSlider,
                        ),
                      ],
                    )
                  : const SizedBox()
              : const SizedBox(),
        );
      },
    );
  }
}
