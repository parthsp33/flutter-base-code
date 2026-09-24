/// Common states used by every cubit.
/// Create feature specific states in the feature folder (state/xxx_state.dart)
/// by extending [ApiRenderState].
abstract class ApiRenderState {}

class Ideal extends ApiRenderState {}

class Loading extends ApiRenderState {}

class Refresh extends ApiRenderState {}

class PaginationLoader extends ApiRenderState {}

/// Emit to rebuild small parts of UI (button state, checkbox, etc).
class OnChanged extends ApiRenderState {}

class OnChangeState<T> extends ApiRenderState {
  final T? data;

  OnChangeState({this.data});
}

class ApiSuccess<T> extends ApiRenderState {
  final T data;

  ApiSuccess(this.data);
}

class ApiFailure<T> extends ApiRenderState {
  final T data;

  ApiFailure(this.data);
}

class ErrorState extends ApiRenderState {
  final String message;

  ErrorState(this.message);
}
