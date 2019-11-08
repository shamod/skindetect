class Pay {
  String creditCardNumber;
  String expirationDate;
  String CVC;

  Map<String, dynamic> toJson() => {
    'creditCardNumber' : creditCardNumber,
    'expirationDate' : expirationDate,
    'CVC' : CVC,
  };
}