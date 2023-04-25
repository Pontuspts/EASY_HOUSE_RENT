// Search result type
class FilterBarResult {
  final String? areaId; // area
  final String? priceId; // price
  final String? rentTypeId; // type
  final List<String>? moreIds; // filter

  FilterBarResult(
      {this.areaId,
      this.priceId,
      this.rentTypeId,
      this.moreIds,
      String? priceTypeId,
      List<String>? moreId});
}

// GeneralType
class GeneralType {
  final String name;
  final String id;

  GeneralType(this.name, this.id);
}

List<GeneralType> areaList = [
  GeneralType('Salaya', '11'),
  GeneralType('Bangkok', '22'),
];
List<GeneralType> priceList = [
  GeneralType('1000', '22'),
  GeneralType('6000', 'aa'),
];
List<GeneralType> rentTypeList = [
  GeneralType('One bedroom', 'bb'),
  GeneralType('Two rooms', '22'),
];

//not achieved
List<GeneralType> roomTypeList = [
  GeneralType('House type 1', '11'),
  GeneralType('House type 2', '22'),
];
List<GeneralType> orientedList = [
  GeneralType('Direction 1', '99'),
  GeneralType('Direction 2', 'cc'),
];
List<GeneralType> floorList = [
  GeneralType('Floor1', 'aa'),
  GeneralType('Floor2', 'bb'),
];
