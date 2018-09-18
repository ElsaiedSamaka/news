import "dart:async";
import "news_api_provider.dart";
import "news_db_provider.dart";
import "../models/item_model.dart";

class Repository {
  List<Source> sources = <Source>[
    newsDbProvider,
    NewsApiProvider(),
  ];

  List<Cashe> cashes = <Cashe>[
    newsDbProvider,
  ];

  Future<List<int>> fetchTopIds(){
    return sources[1].fetchTopIds();
  }

  Future<ItemModel> fetchItem(int id) async{
    ItemModel item;
    Source source;

    for(source in sources){
      item = await source.fetchItem(id);
      if(item != null){
        break;
      }
    }

    for(var cashe in cashes){
      cashe.addItem(item);
    }

    return item;
  }
}

abstract class Source{
  Future<List<int>> fetchTopIds();
  Future<ItemModel> fetchItem(int id);
}

abstract class Cashe{

  Future<int> addItem(ItemModel item);

}