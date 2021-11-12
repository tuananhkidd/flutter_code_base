class Address{
  String id;
  String address;

  Address(this.id, this.address);

  factory Address.fromJson(Map<String, dynamic> json) =>
      Address(
          json['id'] as String,
          json['name'] as String
      );

  @override
  String toString() {
    return 'Address{id: $id, address: $address}';
  }
}