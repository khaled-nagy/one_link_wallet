const defaultNum = -1;

const defaultString = 'NA';

const defaultBool = false;

const defaultList = [];

const defaultMap = {};

final defaultDate = DateTime(1900);

int intConverter(Object? input) =>
    (num.tryParse("$input") ?? defaultNum).toInt();

double doubleConverter(Object? input) =>
    (num.tryParse("$input") ?? defaultNum).toDouble();

num numConverter(Object? input) =>
    (num.tryParse("$input") ?? defaultNum).toDouble();

String stringConverter(Object? input) =>
    input == null ? defaultString : '$input';

bool boolConverter(Object? input) => input == 0 || input == '0'
    ? false
    : input == 1 || input == '1'
        ? true
        : bool.tryParse('$input') ?? defaultBool;

List<E> listConverter<E>(Object? input) {
  try {
    if (input is List) {
      return List<E>.from(input);
    }
    return List<E>.from(defaultList);
  } catch (e) {
    return List<E>.from(defaultList);
  }
}

Map<K, V> mapConverter<K, V>(Object? input) {
  try {
    if (input is Map) {
      return Map<K, V>.from(input);
    }
    return {};
  } catch (e) {
    return {};
  }
}

DateTime dateTimeConverter(Object? input) {
  return DateTime.tryParse('$input') ?? defaultDate;
}
