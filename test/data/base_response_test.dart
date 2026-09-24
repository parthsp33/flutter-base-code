import 'package:base_project/data/model/base_response.dart';
import 'package:base_project/data/model/pagination_model.dart';
import 'package:base_project/presentation/features/auth/sign_in/model/sign_in_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BaseResponse', () {
    test('parses success response', () {
      final res = BaseResponse.fromData({
        'data': {'id': 1},
        'meta': {'message': 'Login success'},
      });
      expect(res.isSuccess, isTrue);
      expect(res.displayMessage, 'Login success');
    });

    test('success false wins over data', () {
      final res = BaseResponse.fromData({'data': {}, 'success': false, 'message': 'Invalid'});
      expect(res.isSuccess, isFalse);
      expect(res.displayMessage, 'Invalid');
    });

    test('handles non map body', () {
      expect(BaseResponse.fromData(null).isSuccess, isFalse);
      expect(BaseResponse.fromData('text').data, 'text');
    });
  });

  group('LoadMore', () {
    test('moves to next page and stops at last page', () {
      final loadMore = LoadMore(limit: 10);
      loadMore.onPageLoaded(10);
      expect(loadMore.offset, 10);
      expect(loadMore.isAllLoaded, isFalse);
      loadMore.onPageLoaded(3);
      expect(loadMore.isAllLoaded, isTrue);
      loadMore.reset();
      expect(loadMore.offset, 0);
    });
  });

  group('SignInModel', () {
    test('valid input', () {
      final (isValid, _) = SignInModel(email: 'user@example.com', password: 'Abcdef1!').isValidate();
      expect(isValid, isTrue);
    });

    test('invalid input', () {
      expect(SignInModel(email: '', password: 'Abcdef1!').isValidate().$1, isFalse);
      expect(SignInModel(email: 'bad', password: 'Abcdef1!').isValidate().$1, isFalse);
      expect(SignInModel(email: 'user@example.com', password: '123').isValidate().$1, isFalse);
    });
  });
}
