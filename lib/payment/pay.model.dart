import 'dart:ffi';

class Pay {
  String number;
  String expMonth;
  String expYear;
  String cvc;

  toJson() => {
      'card': {
        'number': number,
        'exp_month': expMonth,
        'exp_year': expYear,
        'cvc': cvc,
      }
  };

  toForm() => 'card[number]=' + number + '&' + 'card[exp_month]=' + expMonth + '&' + 'card[exp_year]=' + expYear + '&' + 'card[cvc]=' + cvc;

}