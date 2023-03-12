import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../common/base/query_view_model.dart';
import '../../../common/constants/collections.dart';
import '../../../data/model/ticket.dart';

class TabReportedController extends QueryViewModel<Ticket> {
  final collection = FirebaseFirestore.instance.collection(Collections.tickets);

  @override
  Query<Ticket> queryData() => collection.withConverter(
        fromFirestore: (snapshot, _) => Ticket.fromJson(snapshot.data()!),
        toFirestore: (Ticket ticket, _) => ticket.toJson(),
      );

  void filter() {}
}
