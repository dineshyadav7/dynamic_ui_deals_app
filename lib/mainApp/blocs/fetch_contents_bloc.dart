import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

import '../models/content_model.dart';
import '../../constants/firestore_collections.dart';

class FetchContentsBloc extends Bloc<FetchContentsEvent, FetchContentsState> {
  FetchContentsBloc() : super(FetchContentsInitial()) {
    on<FetchContents>((event, emit) async {
      emit(FetchContentsProgress());
      try {
        await emit.forEach(
          cn.contentsDb.orderBy("sequenceId", descending: false).snapshots(),
          onData: ((QuerySnapshot snapshot) {
            List<ContentModel> contents = snapshot.docs.isNotEmpty ? ContentList.fromQuery(snapshot).contents : [];

            ///get banners
            final List<String> banners = contents.where((banner) => banner.sequenceId == 1).map((e) => e.imageUrl).toList();

            /// get category
            List<ContentModel> categories = contents.where((category) => category.sequenceId == 2).toList();

            ///get card banners
            List<ContentModel> cardBanners = contents.where((category) => category.sequenceId == 3).toList();

            ///get offers and discount
            List<ContentModel> offers = contents.where((category) => category.sequenceId == 4).toList();

            ///get deals of the day
            List<ContentModel> deals = contents.where((category) => category.sequenceId == 5).toList();
            return FetchContentsSuccess(
              deals: deals,
              offers: offers,
              banners: banners,
              contents: contents,
              categories: categories,
              cardBanners: cardBanners,
            );
          }),
          onError: ((error, stackTrace) {
            if (kDebugMode) debugPrint('fetch_contents_bloc.dart [Bloc Emit Exception] >> \n $error \n $stackTrace');
            return FetchContentsFailure(error);
          }),
        );
      } catch (e) {
        if (kDebugMode) debugPrint('fetch_contents_bloc.dart [Catch Exception]>> $e');
        emit(FetchContentsFailure(e));
      }
    });
  }
  final CollectionNames cn = CollectionNames();
}

//states
abstract class FetchContentsState {}

//events
abstract class FetchContentsEvent {}

//states implementation
class FetchContentsInitial extends FetchContentsState {}

class FetchContentsProgress extends FetchContentsState {}

class FetchContentsSuccess extends FetchContentsState {
  final List<String> banners;
  final List<ContentModel> deals;
  final List<ContentModel> offers;
  final List<ContentModel> contents;
  final List<ContentModel> categories;
  final List<ContentModel> cardBanners;
  FetchContentsSuccess({
    required this.deals,
    required this.offers,
    required this.banners,
    required this.contents,
    required this.categories,
    required this.cardBanners,
  });
}

class FetchContentsFailure extends FetchContentsState {
  final dynamic error;
  FetchContentsFailure(this.error);
}

//events implementation
class FetchContents extends FetchContentsEvent {}
