class JobModel {
  final String? id; // Supabase primary key (uuid or serial)
  final String? userId; // optional: useful if you use RLS
  final String iconPath;
  final String jobTitle;
  final String jobDescription;
  final String jobRequirements;
  final String jobBenefits;
  final String jobLocation;
  final String jobType;
  final String jobSalary;

  JobModel({
    this.id,
    this.userId,
    required this.iconPath,
    required this.jobTitle,
    required this.jobDescription,
    required this.jobRequirements,
    required this.jobBenefits,
    required this.jobLocation,
    required this.jobType,
    required this.jobSalary,
  });

  /// Convert Supabase record → JobModel
  factory JobModel.fromMap(Map<String, dynamic> map) {
    return JobModel(
      id: map['id']?.toString(),
      userId: map['user_id']?.toString(),
      iconPath: map['iconPath'] ?? '',
      jobTitle: map['jobTitle'] ?? '',
      jobDescription: map['jobDescription'] ?? '',
      jobRequirements: map['jobRequirements'] ?? '',
      jobBenefits: map['jobBenefits'] ?? '',
      jobLocation: map['jobLocation'] ?? '',
      jobType: map['jobType'] ?? '',
      jobSalary: map['jobSalary']?.toString() ?? '',
    );
  }

  /// Convert JobModel → JSON for Supabase insert/update
  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      'iconPath': iconPath,
      'jobTitle': jobTitle,
      'jobDescription': jobDescription,
      'jobRequirements': jobRequirements,
      'jobBenefits': jobBenefits,
      'jobLocation': jobLocation,
      'jobType': jobType,
      'jobSalary': jobSalary,
    };
  }

  /// Easy clone method for editing
  JobModel copyWith({
    String? id,
    String? userId,
    String? iconPath,
    String? jobTitle,
    String? jobDescription,
    String? jobRequirements,
    String? jobBenefits,
    String? jobLocation,
    String? jobType,
    String? jobSalary,
  }) {
    return JobModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      iconPath: iconPath ?? this.iconPath,
      jobTitle: jobTitle ?? this.jobTitle,
      jobDescription: jobDescription ?? this.jobDescription,
      jobRequirements: jobRequirements ?? this.jobRequirements,
      jobBenefits: jobBenefits ?? this.jobBenefits,
      jobLocation: jobLocation ?? this.jobLocation,
      jobType: jobType ?? this.jobType,
      jobSalary: jobSalary ?? this.jobSalary,
    );
  }
}
