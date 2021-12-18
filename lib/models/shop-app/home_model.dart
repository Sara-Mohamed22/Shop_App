class HomeModel
{
  bool?  status;
  dynamic  message ;
  Data? data ;

  Map<String , dynamic> ToJson()
  {
    return {
      "status" : status ,
      "message" : message  ,
      "data" : data !=null ? data!.ToJson() : null
    };
  }

  HomeModel.FromJson( Map<String , dynamic> json)
  {
    status = json['status'];
    message = json['message'] ;
    data = Data.FromJson(json['data']) ;
  }
}


class Data
{
  List<Banners>? banners    ;
  List<Products>?  products   ;
  String? ad ;

  Map<String , dynamic> ToJson()
  {



    return {
      "banners" : banners?.map((e) {e.ToJson(); }),
      "products" : products?.map((e) {e.ToJson(); }),
      "ad" :ad


    };

 }

Data.FromJson( Map<String , dynamic>json)
{
      List<Banners> x=[];
      List<Products> y=[] ;

    // print('banners ::: ${json['banners']}');
      if( json['banners'] !=null)
      {
      json['banners'].forEach((e) {
        x.add(Banners.FromJson(e));
        });
      banners =x ;

      }

      if(json['products'] !=null) {
       json['products'].forEach((e) {
        y.add(Products.FromJson(e));
      });

       products=y;
    }

  ad = json['ad'];

}

}

class Banners
{
    int? id ;
   String? image ;
  dynamic category ;
  dynamic product ;

  Map<String , dynamic> ToJson()
  {
    return {
      "id" : id ,
      "image" : image ,
      "category" : category  ,
    "product" : product

    };
  }

  Banners.FromJson(final Map<String , dynamic> json)
  {
    id = json['id'] ;
    image = json['image']  ;
    category = json['category']  ;
     product = json['product']  ;
  }

}


class Products
{
  int? id ;
  dynamic price ;
  dynamic oldPrice ;
  dynamic discount ;
  String? image ;
  String? name ;
  String? description ;
  List<String>? images ;
  bool? inFavorites ;
  bool? inCart ;




  Map<String , dynamic> ToJson()
  {
    return {
      "id" : id ,
      "price" : price,
      "old_price" : oldPrice ,
      "discount" : discount ,
      "image" : image ,
      "name" : name ,
      "description" : description ,
      "in_favorites" : inFavorites ,
      "in_cart" : inCart
    };


  }

  Products.FromJson(Map<String , dynamic> json)
  {
    id = json['id'] ;
    price = json['price'] ?? 0 ;
    oldPrice= json['old_price'] ?? 0  ;
    discount =  json['discount'] ?? 0 ;
    image = json['image'] ;
    name = json['name'];
    description = json['description'];
    images =json['images'].cast<String>() ;
    inFavorites =json['in_favorites'] ;
    inCart =json['in_cart'] ;
  }

}