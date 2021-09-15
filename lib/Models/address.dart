

class Address{

  late String title;
  late int branchId;
  late String country;
  late String city;
  late int zoneId;
  late String region;
  late String address;
  late String building;
  late String apartment;
  late String floor;
  late String comment;
  late int addressId;
  late double latitude;
  late double longitude;
  Address.empty();
  Address(
      this.title,
      this.branchId,
      this.country,
      this.city,
      this.zoneId,
      this.region,
      this.address,
      this.building,
      this.apartment,
      this.floor,
      this.comment,
      this.addressId,
      this.latitude,
      this.longitude);

}