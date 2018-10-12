import "package:rxdart/rxdart.dart";
import "../models/item_model.dart";
import "../resources/repository.dart";


class StoriesBloc{
  final _repository = Repository();
  final _topIds = PublishSubject<List<int>>();

  // Getters to Stream

  Observable<List<int>> get topIds => _topIds.stream;

  fetchTopIds() async{
    final id = await _repository.fetchTopIds();
    _topIds.sink.add(id);
  }

  dispose(){
    _topIds.close();
  }
}