class yemekModel {
  yemekModel(
      {required this.yemekadi,
     required this.kalori
      });
      String yemekadi;
     int kalori;

  factory yemekModel.fromJson(json) => yemekModel(
    yemekadi: json["yemekadi"]??"",
    kalori: json["kalori"]??""
   );

  toJson() {
    return {
      "yemekadi":yemekadi,
      "kalori":kalori
    };
  }

 Map<String, dynamic> toMap() => {
  "yemekadi":yemekadi,
  "kalori":kalori     
      };

  factory yemekModel.fromMap(map) => yemekModel(
      yemekadi: map["yemekadi"],
      kalori: map["kalori"]
     );}
     
