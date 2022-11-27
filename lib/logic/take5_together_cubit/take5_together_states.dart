abstract class Take5TogetherStates {}

class InitialTake5TogetherState extends Take5TogetherStates {}
class Take5TogetherGetDriversLoading extends Take5TogetherStates{}

class Take5TogetherGetDriversSuccess extends Take5TogetherStates{}

class Take5TogetherGetDriversFail extends Take5TogetherStates{
  final String? message;

  Take5TogetherGetDriversFail(this.message);
}
class Take5TogetherAddToNotesSuccess extends Take5TogetherStates{}