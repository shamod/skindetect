class Pay {
  String creditCardNumber;
  String expirationDate;
  String cardVerificationCode;

  Map<String, dynamic> toJson() => {
        'creditCardNumber': creditCardNumber,
        'expirationDate': expirationDate,
        'CVC': cardVerificationCode,
      };
}
