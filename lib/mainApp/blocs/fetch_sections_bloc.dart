import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

import '../models/section_model.dart';
import '../../constants/firestore_collections.dart';

class FetchSectionsBloc extends Bloc<FetchSectionsEvent, FetchSectionsState> {
  FetchSectionsBloc() : super(FetchSectionsInitial()) {
    on<FetchSections>((event, emit) async {
      emit(FetchSectionsProgress());
      try {
        await emit.forEach(
          cn.sectionsDb.orderBy("sequenceId", descending: false).snapshots(),
          onData: ((QuerySnapshot snapshot) {
            List<SectionModel> sections = snapshot.docs.isNotEmpty ? SectionList.fromQuery(snapshot).sections : [];

            ///get category
            SectionModel? categorySection = sections.where((section) => section.sequenceId == 2).map((categoty) => categoty).firstOrNull;

            ///get offers and discount
            SectionModel? offersSection = sections.where((section) => section.sequenceId == 4).map((offer) => offer).firstOrNull;

            ///get deals of the day
            SectionModel? dealsSection = sections.where((section) => section.sequenceId == 5).map((deal) => deal).firstOrNull;

            return FetchSectionsSuccess(
              sections: sections,
              dealsSection: dealsSection,
              offersSection: offersSection,
              categorySection: categorySection,
            );
          }),
          onError: ((error, stackTrace) {
            if (kDebugMode) debugPrint('fetch_sections_bloc.dart [Bloc Emit Exception] >> \n $error \n $stackTrace');
            return FetchSectionsFailure(error);
          }),
        );
      } catch (e) {
        if (kDebugMode) debugPrint('fetch_sections_bloc.dart [Catch Exception]>> $e');
        emit(FetchSectionsFailure(e));
      }
    });
  }
  final CollectionNames cn = CollectionNames();
}

//states
abstract class FetchSectionsState {}

//events
abstract class FetchSectionsEvent {}

//states implementation
class FetchSectionsInitial extends FetchSectionsState {}

class FetchSectionsProgress extends FetchSectionsState {}

class FetchSectionsSuccess extends FetchSectionsState {
  final SectionModel? dealsSection;
  final List<SectionModel> sections;
  final SectionModel? offersSection;
  final SectionModel? categorySection;
  FetchSectionsSuccess({
    required this.sections,
    required this.dealsSection,
    required this.offersSection,
    required this.categorySection,
  });
}

class FetchSectionsFailure extends FetchSectionsState {
  final dynamic error;
  FetchSectionsFailure(this.error);
}

//events implementation
class FetchSections extends FetchSectionsEvent {}
