import 'package:base_project/util/app_const.dart';

/// Keeps pagination state inside a cubit.
///
///   final loadMore = LoadMore();
///   if (loadMore.isAllLoaded || loadMore.isFetching) return;
///   ... call api with loadMore.toMap() ...
///   loadMore.onPageLoaded(items.length);
class LoadMore {
  int index = 0;
  final int limit;
  bool isAllLoaded = false;
  bool isFetching = false;

  LoadMore({this.limit = AppConst.paginationLimit});

  int get offset => index * limit;

  void onPageLoaded(int itemCount) {
    isFetching = false;
    if (itemCount < limit) {
      isAllLoaded = true;
    } else {
      index++;
    }
  }

  void reset() {
    index = 0;
    isAllLoaded = false;
    isFetching = false;
  }

  Map<String, dynamic> toMap() => {'limit': limit, 'offset': offset};
}
