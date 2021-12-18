class LoginModal
{
  bool? status ;
  String? message ;
  Data? data ;
  Map<String , dynamic> ToJson()
  {
    return {
      "status" : status,
      "message" : message ,
      "data" : data!.ToJson() ,

    };



  }

  LoginModal.FromJson(Map<String , dynamic>json)
  {
    status = json['status'];
    message = json['message'];
    data= json['data'] != null ? Data.FromJson(json['data']) : null;

  }
}






class Data
{
  int? id ;
  String? name ;
  String? email ;
  String? phone ;
  String? image ;
  int? points ;
  int? credit ;
  String? token ;

 Map<String , dynamic> ToJson()
 {
   return {
     "id" : id ,
     "name" : name ,
     "email" : email ,
     "phone" : phone ,
     "image" : image ,
     "points" : points ,
     "credit" : credit ,
     "token" : token
   };



 }

  Data.FromJson(Map<String , dynamic>json)
  {
    id = json['id'];
    name= json['name'];
    email= json['email'] ;
    phone= json['phone'];
    image=json['image'];
    points=json['points'];
    credit=json['credit'];
    token=json['token'];
  }


}