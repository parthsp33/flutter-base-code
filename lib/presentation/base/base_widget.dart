import 'package:base_project/util/core_export.dart';
import 'package:base_project/util/widget_utils.dart';

/// Parent of stateless screens and widgets.
/// Gives text styles, widget helpers and common services.
abstract class BaseWidget extends StatelessWidget with TextStyles, WidgetUtils, CommonDi {
  BaseWidget({super.key});
}

/// Parent of stateful screens and widgets.
abstract class BaseStatefulWidget extends StatefulWidget with TextStyles, WidgetUtils, CommonDi {
  BaseStatefulWidget({super.key});
}
