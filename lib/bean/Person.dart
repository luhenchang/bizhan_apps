class Person{
  var name;
  Person(this.name);
  Future getPersonName()async{
    new Future.delayed(new Duration(milliseconds: 2000));
    return "我是王飞";
  }
  Future getNumber(var a,var b)async{
    print("a*b");
    new Future.delayed(new Duration(milliseconds: 13000));
    return await a*b;
  }
  Future _getPersonNamePrint(var a,var b)async{
    print("=");
    return await getNumber(a,b);
  }
  void getUsefor(){
    print("hello world1");
    _getPersonNamePrint(11,21).then((value){
      print(value);
    });
    getPersonName().then((value){
      print(value);
    });
    _getPersonNamePrint(11,22).then((value){
      print(value);
    });
    _getPersonNamePrint(11,23).then((value){
      print(value);
    });
    print("hello world2");
  }
}
