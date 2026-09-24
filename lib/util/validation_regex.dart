import 'app_const.dart';

enum ValidationRegex {
  alphabetWithSpace,
  fullName,
  emailInput,
  email,
  phone,
  address,
  description,
  password,
  onlyNumber,
  website,
  percentage,
  multipleSpace,
}

extension ValidationRegexExtension on ValidationRegex {
  RegExp get value {
    switch (this) {
      case ValidationRegex.alphabetWithSpace:
        return RegExp(r'^[a-zA-Z ]+$');
      case ValidationRegex.fullName:
        return RegExp(r'^[A-Za-z]{2,}(?: [A-Za-z]{2,})+$');
      case ValidationRegex.emailInput:
        return RegExp(r'[a-zA-Z0-9@._+-]');
      case ValidationRegex.email:
        return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
      case ValidationRegex.phone:
        return RegExp('^[0-9]{${AppConst.phoneNumberMinLen},${AppConst.phoneNumberLen}}\$');
      case ValidationRegex.address:
        return RegExp('^.{${AppConst.addressMinLen},${AppConst.addressMax}}\$', dotAll: true);
      case ValidationRegex.description:
        return RegExp('^.{${AppConst.desMinLen},${AppConst.desMax}}\$', dotAll: true);
      case ValidationRegex.password:
        return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*(),.?":{}|<>]).{8,}$');
      case ValidationRegex.onlyNumber:
        return RegExp(r'^[0-9]+$');
      case ValidationRegex.website:
        return RegExp(r'^https?:\/\/[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]+)*\.[a-zA-Z]{2,}(\/\S*)?$');
      case ValidationRegex.percentage:
        return RegExp(r'^(100|[1-9][0-9]?)$');
      case ValidationRegex.multipleSpace:
        return RegExp(r'\s+');
    }
  }
}
