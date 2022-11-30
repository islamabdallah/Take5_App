abstract class Take5TogetherStates {}

class InitialTake5TogetherState extends Take5TogetherStates {}
class Take5TogetherGetDriversLoading extends Take5TogetherStates{}

class Take5TogetherGetDriversSuccess extends Take5TogetherStates{}

class Take5TogetherGetDriversFail extends Take5TogetherStates{
  final String? message;

  Take5TogetherGetDriversFail(this.message);
}
class Take5TogetherAddToNotesSuccess extends Take5TogetherStates{}
class Take5TogetherOnchangeDriverSuccess extends Take5TogetherStates{}
class Take5TogetherOnChangeWhoStartedConversationSuccess extends Take5TogetherStates{}

class Take5TogetherRemoveNoteSuccess extends Take5TogetherStates{}

class Take5TogetherStoreNotesToAllStepsLoading extends Take5TogetherStates{}
class Take5TogetherStoreNotesToAllStepsSuccess extends Take5TogetherStates{}
class Take5TogetherStoreNotesToAllStepsFail extends Take5TogetherStates{
  final String? message;
  Take5TogetherStoreNotesToAllStepsFail(this.message);
}