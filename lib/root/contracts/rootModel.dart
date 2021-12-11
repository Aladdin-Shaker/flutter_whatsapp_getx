/* 
* TOP LEVEL MODEL
* contains all things and function 
* that each model in the application must excute it 
* and we extends from it with abstract to prevent any using for this class
*/

abstract class RootModel {
  RootModel();

  //  method, for constructing a new model instance from a map structure
  Map<String, dynamic> toJson();

  // method?, which converts a model instance into a map.
  RootModel.fromJson(Map<String, dynamic> json);
}
