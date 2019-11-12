import 'dart:ffi';

class Pay {

  String creditCardNumber;
  String expirationMonth;
  String expirationYear;
  String cardVerificationCode;

  Map<String, dynamic> toJson() => {
        'number': creditCardNumber,
        'exp_month': expirationMonth,
        'exp_year': expirationYear,
        'cvc': cardVerificationCode,
      };

  String toForm() => 'card[number]=' + creditCardNumber + '&' +
                     'card[exp_month]=' + expirationMonth + '&' +
                     'card[exp_year]=' + expirationYear + '&' +
                     'card[cvc]=' + cardVerificationCode;
}

