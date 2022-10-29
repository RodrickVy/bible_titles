class GameEventRequest<T> {
  final T data;
  final GameEvent event;


  GameEventRequest(this.event, this.data);
}

enum GameEvent {
  openTile,
  answerQuestion,
  

}
