
class MarsModel {
  int? id;
  int? sol;
  String? img_src;
  String? earth_date;

MarsModel({
this.id,
this.sol,
this.img_src,
this.earth_date,
});

factory MarsModel.fromMap(Map<String, dynamic> map){
  return MarsModel(
    id: map['id'],
    sol: map['sol'],
    img_src: map['img_src'],
    earth_date: map['earth_date']
  );
}
}
