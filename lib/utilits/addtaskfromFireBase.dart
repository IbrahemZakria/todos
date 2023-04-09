import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/models/taskModel.dart';

CollectionReference<TaskModel> getTasksFromFireStore() {
  return FirebaseFirestore.instance
      .collection('tasks')
      .withConverter<TaskModel>(fromFirestore: (snapshot, options) {
    return TaskModel.fromJeson(snapshot.data()!);
  }, toFirestore: (task, options) {
    return task.toJeson();
  });
}

Future<void> addtaskfromFireBase(TaskModel task) {
  var collection = getTasksFromFireStore();

  var doc = collection.doc();
  task.id = doc.id;
  return doc.set(task);
}

Stream<QuerySnapshot<TaskModel>> readTaskFromFireStore(DateTime date) {
  var collection = getTasksFromFireStore();
  return collection.where('Date', isEqualTo: date.millisecondsSinceEpoch).snapshots();
}
