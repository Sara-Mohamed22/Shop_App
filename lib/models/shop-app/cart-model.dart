class CartModel
{
  bool? status ;
  String? message ;
  Data? data ;

 Map<String ,dynamic> ToJson()
  {
    return {
      "status" :  status ,
      "message" : message ,
      "data" : data!.ToJson()
    };
  }
  CartModel.FromJson(Map<String , dynamic> json)
  {
    status = json['status'] ;
    message = json['message'] ;
    data = Data.FromJson(json['data']);
  }


}

class Data
{
  List<CartItem>? cart_items ;
  dynamic sub_total ;
  dynamic total ;
  Map<String , dynamic> ToJson()
  {
    return {
      "cart_items" : cart_items!.map((CartItem e) {
        e.ToJson() ;
      }),
      "sub_total" :sub_total ,
      "total" : total ,

    };
  }

  Data.FromJson(Map<String , dynamic> json)
  {
    List<CartItem> x =[];
    if(json['cart_items'] !=null)
      {
        json['cart_items'].forEach((e){
          x.add(CartItem.FromJson(e));
        });
      }

    sub_total =json['sub_total'] ;
    total = json['total'];
    cart_items = x ;
  }


}

class CartItem
{
  int? id ;
  int? quantity ;
  Product? product ;

 Map<String,dynamic> ToJson()
  {
    return {
      "id" : id ,
      "quantity" : quantity ,
      "product" : product!.ToJson()
    };
  }

  CartItem.FromJson(Map<String , dynamic> json)
  {
    id = json['id'] ;
    quantity = json['quantity'] ;
    product = Product.FromJson(json['product']);
  }

}











class Product
{
  int? id ;
  dynamic price ;
  dynamic old_price ;
  dynamic discount ;
  String? image ;
  String? name ;
  String? description;
  List<String>? images ;
  bool? in_favorites ;
  bool? in_cart ;

 Map<String , dynamic> ToJson()
  {
    return {
      "id":id ,
      "price": price ,
      "old_price" : old_price ,
      "discount" : discount ,
      "image" : image ,
      "name" : name ,
      "description" : description ,
      "images" : images ,
      "in_favorites" : in_favorites ,
      "in_cart" : in_cart
    };
  }

  Product.FromJson(Map<String , dynamic> json)
  {
    id = json['id'];
     price = json['price'] ;
    old_price =  json['old_price'];
   discount = json['discount'];
     image = json['image'] ;
     name = json['name'];
    description= json['description'];
     images = json['images'].cast<String>() ;
     in_favorites = json['in_favorites'];
     in_cart= json['in_cart'] ;

  }

}