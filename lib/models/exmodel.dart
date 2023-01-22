class ExModel {
  ExModel(
      {required this.exname,
     required this.resimadi
      });
      String exname;
      String resimadi;


  factory ExModel.fromJson(json) => ExModel(
    exname: json["exname"]??"",
    resimadi: json["resimadi"]??""

   );

  toJson() {
    return {
      "exname":exname,
      "resimadi":resimadi  
    };
  }

 Map<String, dynamic> toMap() => {
  "exname":exname,
  "resimadi":resimadi
  };

  /// mapTen obje oluşturan yapıcı

  factory ExModel.fromMap(map) => ExModel(
      exname: map["exname"],
      resimadi: map["resimadi"]

     );}
     
