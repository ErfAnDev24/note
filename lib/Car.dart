import 'package:hive_flutter/adapters.dart';

part 'Car.g.dart';

@HiveType(typeId: 1)
class Car {
  @HiveField(0)
  String? names;

  @HiveField(1)
  int? topSpeed;

  @HiveField(2)
  String? price;

  Car(this.names, this.topSpeed, this.price);
}
