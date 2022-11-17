class CounterEntity {
  final int value;

  CounterEntity({required this.value});

  CounterEntity incrementValue() {
    return copyWith(value: value + 1);
  }

  factory CounterEntity.fromJson(Map<String, dynamic> map) {
    return CounterEntity(value: int.tryParse(map["value"].toString()) ?? 0);
  }

  Map<String, dynamic> toJson() {
    return {
      "value": value,
    };
  }

  CounterEntity copyWith({
    int? value,
  }) {
    return CounterEntity(value: value ?? this.value);
  }
}
