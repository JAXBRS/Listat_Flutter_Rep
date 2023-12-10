import 'package:listat/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';

@Entity()
class Person {
  int id;
  String firstName;
  String lastName;
  Person({this.id = 0, required this.firstName, required this.lastName});
}

final store = Store(getObjectBoxModel());
final box = store.box<Person>();
// Writing data
final person = Person(firstName: 'John', lastName: 'Doe');
final id = box.put(person);
// Reading data
final storedPerson = box.get(id);

// import 'package:objectbox/objectbox.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';

// import 'objectbox.g.dart';

// @Entity()
// class Person {
//   int id;
//   String firstName;
//   String lastName;

//   Person({this.id = 0, required this.firstName, required this.lastName});
// }

//   final store = await openStore();
//   final box = store.box<Person>();

//   // Writing data
//   final person = Person(firstName: 'John', lastName: 'Doe');
//   final id = box.put(person);


// Future<Store> openStore() async {
//   final directory = await getApplicationDocumentsDirectory();
//   final path = join(directory.path, 'objectbox');
//   return Store(getObjectBoxModel(), directory: path);
// }
