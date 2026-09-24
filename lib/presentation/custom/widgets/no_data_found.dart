import 'package:base_project/presentation/base/base_widget.dart';
import 'package:base_project/util/core_export.dart';

/// Empty list view. Hidden while state is [Loading].
class NoDataFound extends BaseWidget {
  final ApiRenderState state;
  final String? message;
  final Widget? icon;

  NoDataFound({super.key, required this.state, this.message, this.icon});

  @override
  Widget build(BuildContext context) {
    if (state is Loading) return const SizedBox.shrink();
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon ?? Icon(Icons.content_paste_search_outlined, size: 80.w, color: ColorName.neutral60),
          16.h.verticalSpace,
          Text(message ?? Strings.noDataFound(), style: dmSans500(size: 16), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
