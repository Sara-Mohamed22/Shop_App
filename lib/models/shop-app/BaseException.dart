class BaseException
{
  String? msg ;
  BaseException(this.msg);
  BaseException.StatusCode(int statuscode)
  {
   switch(statuscode)
   {
     case 400:
       BaseException('This Page not Found');
       break;
     case 500 :
       BaseException('Internal Server Error');
       break;
     default :
       BaseException('Something wrong , try again') ;
   }
  }
}