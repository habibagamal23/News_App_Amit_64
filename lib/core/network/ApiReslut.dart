class ApiResult<T>{
  T ? data;
  String ? error;

  ApiResult.Success(this.data):error=null;
  ApiResult.Error(this.error):data=null;

  bool get isSuccess {
   // if(data!=null){
   //   return true ;
   // }else{
   //   return false;
   // }
   return data!=null;
  }
  bool get isError {
    return error!=null;
  }

}