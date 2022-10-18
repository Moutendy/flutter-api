class typeAappliance{
  final int id;
  final String libelle;
  
   typeAappliance({
    required this.id,
    required this.libelle,
  });

  factory typeAappliance.fromJson(var json) {
    return typeAappliance(
      id: json['id'],
      libelle: json['libelle'],
    );
  }
}