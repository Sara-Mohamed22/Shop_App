class CategoryModal
{
  bool? status ;
  String? message ;
  Data? data ;

  Map<String , dynamic> ToJson()
  {
  return  {
      'status' : status ,
      'message' : message ,
      'data' : data !=null ? data!.ToJson() : null
  };
  }

  CategoryModal.FromJson(Map<String , dynamic> json)
  {
    status = json['status'];
    message = json['message'];
    data = Data.FromJson(json['data']);
  }

}

class Data
{
  int? current_page ;
  List<SubData>? data ;
  String? first_page_url ;
  int? from ;
  int? last_page ;
  String? last_page_url ;
  String? next_page_url ;
  String? path ;
  int? per_page ;
  String? prev_page_url ;
  int? to ;
  int? total ;

  Map<String , dynamic> ToJson()
  {
    return {
      'current_page' : current_page,

      'data ' : data!.map((SubData e) {
          e.ToJson();
      }) ,

      'first_page_url' :  first_page_url,
      'from' : from,
      'last_page' : last_page ,
      'last_page_url' : last_page_url ,
      'next_page_url' : next_page_url ,
      'path' : path ,
      'per_page' : per_page ,
      'prev_page_url' : prev_page_url ,
      'to' : to ,
      'total' : total ,
    };
  }

  Data.FromJson(Map<String , dynamic> json)
  {
    List<SubData> x =[];

    if( json['data'] != null )
      {

        json['data'].forEach( (e){
          x.add(SubData.FromJson(e));
        });

      }

     current_page = json[''];
    data = x ;
     first_page_url = json['first_page_url'];
     from = json['from'] ;
     last_page = json['last_page'] ;
    last_page_url = json['last_page_url'] ;
     next_page_url = json['next_page_url'] ;
    path = json['path'];
     per_page = json['per_page'] ;
     prev_page_url  = json['prev_page_url'];
     to = json['to'] ;
     total = json['total'];
  }


}





class SubData
{
  int? id ;
  String? name ;
  String? image ;

 Map<String , dynamic > ToJson()
  {
    return {
      'id' :id ,
      'name' : name ,
      'image' : image
    };
  }

  SubData.FromJson(Map<String ,dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}