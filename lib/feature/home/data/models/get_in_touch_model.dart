class GetInTouchModel {
  final String fullName;
  final String email;
  final List<String> selectedReasons;
  final double budgetFrom;
  final double budgetTo;
  final String message;

  GetInTouchModel({
    required this.fullName,
    required this.email,
    required this.selectedReasons,
    required this.budgetFrom,
    required this.budgetTo,
    required this.message,
  });

  Map<String, dynamic> toJson() => {
    'full_name': fullName,
    'email': email,
    'selectedReasons': selectedReasons,
    'budget_from': budgetFrom,
    'budget_to': budgetTo,
    'message': message,
  };

  factory GetInTouchModel.fromJson(Map<String, dynamic> json) {
    return GetInTouchModel(
      fullName: json['full_name'],
      email: json['email'],
      selectedReasons: List<String>.from(json['selectedReasons'] ?? []),
      budgetFrom: json['budget_from'] * 1.0,
      budgetTo: json['budget_to'] * 1.0,
      message: json['message'],
    );
  }
}
