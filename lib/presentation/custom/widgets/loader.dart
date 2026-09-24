import 'package:base_project/util/core_export.dart';

/// Shows [content] and puts a loader on top while state is [Loading].
/// Pass extra loading states with [loadingStates] if the feature has its own.
class StackLoader extends StatelessWidget {
  final ApiRenderState state;
  final Widget content;
  final bool isTransparent;
  final List<Type> loadingStates;

  const StackLoader({
    super.key,
    required this.state,
    required this.content,
    this.isTransparent = false,
    this.loadingStates = const [],
  });

  bool get _isLoading => state is Loading || loadingStates.contains(state.runtimeType);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        content,
        if (_isLoading) Loader(isTransparent: isTransparent),
      ],
    );
  }
}

class Loader extends StatelessWidget {
  final bool isTransparent;

  const Loader({super.key, this.isTransparent = false});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: AbsorbPointer(
        child: Container(
          color: Colors.black.withValues(alpha: isTransparent ? 0.0 : 0.1),
          alignment: Alignment.center,
          child: Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r), color: ColorName.white),
            alignment: Alignment.center,
            child: CircularProgressIndicator(color: ColorName.primary50, strokeWidth: 4.w),
          ),
        ),
      ),
    );
  }
}
