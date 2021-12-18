class GetFavoriteModal
{
  bool? status ;
  String? message ;
  Data? data;

  GetFavoriteModal.FromJson(Map<String , dynamic> json)
  {
    status=json['status'];
    message=json['message'];
    data=Data.FromJson(json['data']);
  }



}

class Data
{
  int? current_page ;
  List<SubData>? data;
  List<SubData> x =[];

  Data.FromJson(Map<String,dynamic>json)
  {
    json['data'].forEach((e){
      x.add(SubData.FromJson(e));
    });

    current_page=json['current_page'];
    data=x;
  }
}

class SubData
{
  int? id ;
  Product? product ;
  SubData.FromJson(Map<String,dynamic>json)
  {
    id= json['id'];
    product= Product.FromJson(json['product']);
  }

}

class  Product
{
  int? id;
  dynamic price;
  dynamic old_price;
  int? discount;
  String? image;
  String? name;
  String? description;

  Product.FromJson(Map<String ,dynamic>json)
  {
    id=json['id'];
    price=json['price'];
    old_price=json['old_price'];
    discount=json['discount'];
    image=json['image'];
    name=json['name'];
    description=json['description'];
  }

}