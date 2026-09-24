import 'package:base_project/data/di/common_di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api_render_state.dart';

/// Parent of every cubit. Gives common services (navigation, storage,
/// toast, misc, dateTime, eventBus) and a default API error handler.
class BaseCubit extends Cubit<ApiRenderState> with CommonDi {
  BaseCubit() : super(Ideal());

  /// Pass this to repo calls as onApiError.
  void onApiError(dynamic error) {
    final message = error?.toString() ?? '';
    showError(message);
    safeEmit(ApiFailure(message));
  }

  /// Emit only when cubit is not closed (safe after async calls).
  void safeEmit(ApiRenderState state) {
    if (!isClosed) emit(state);
  }
}
