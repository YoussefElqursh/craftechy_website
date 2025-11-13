class ApplyModel {
  final String? id;
  final String jobId;
  final String name;
  final String email;
  final String firstQuestion;
  final String secondQuestion;
  final String thirdQuestion;
  final String cvFile;
  ApplyModel({
    this.id,
    required this.jobId,
    required this.name,
    required this.email,
    required this.firstQuestion,
    required this.secondQuestion,
    required this.thirdQuestion,
    required this.cvFile,
  });
  factory ApplyModel.fromMap(Map<String, dynamic> map) => ApplyModel(
    id: map['id']?.toString(),
    jobId: map['id'],
    name: map['Name'],
    email: map['Email'],
    firstQuestion: map['FirstQuestion'],
    secondQuestion: map['SecondQuestion'],
    thirdQuestion: map['ThirdQuestion'],
    cvFile: map['CVURL'],
  );
  Map<String, dynamic> toMap() => {
    if (id != null) 'id': id,
    'id': jobId,
    'Name': name,
    'Email': email,
    'FirstQuestion': firstQuestion,
    'SecondQuestion': secondQuestion,
    'ThirdQuestion': thirdQuestion,
    'CVURL': cvFile,
  };
}
