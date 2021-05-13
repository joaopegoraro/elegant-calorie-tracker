/// Food model which stores food properties
class Food {
  late String _name;
  late double _calories;
  late double _weight;
  late double _carbs;
  late double _protein;
  late double _fat;

  // Getters
  String get name => _name;
  double get calories => _calories;
  double get weight => _weight;
  double get carbs => _carbs;
  double get protein => _protein;
  double get fat => _fat;

  // Setters
  set name(String name) => this._name = name;
  set calories(double calories) => this._calories = calories;
  set weight(double weight) => this._weight = weight;
  set carbs(double carbs) => this._carbs = carbs;
  set protein(double protein) => this._protein = protein;
  set fat(double fat) => this._fat = fat;
}