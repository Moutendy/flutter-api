class typeAappliance{

  String libelle;
 late String id;
   typeAappliance({
   required this.id,
    required this.libelle,
  });

  factory typeAappliance.fromJson(Map<String, dynamic> json) {
    return typeAappliance(
      id:json['id'].toString(),
      libelle: json['libelle'].toString(),
    );
  }
}