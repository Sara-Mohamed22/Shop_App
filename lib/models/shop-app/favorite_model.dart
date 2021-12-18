class FavoriateModel
{
  bool? status ;
  String? message ;
  Map<String ,dynamic> ToJson()
  {
    return {
      'status' : status ,
      'message' : message
    };
  }

  FavoriateModel.FromJson(Map<String ,dynamic> json)
  {
    status =json['status'] ;
    message = json['message'];
  }

}