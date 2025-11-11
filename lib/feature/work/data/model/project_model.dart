class ProjectModel{
  final String? id;
  final String projectHeader;
  final String projectTitle;
  final String projectDescription;
  final String projectImage;
  final String projectLink;

  ProjectModel({
    this.id,
    required this.projectHeader,
    required this.projectTitle,
    required this.projectDescription,
    required this.projectImage,
    required this.projectLink,
  });

  factory ProjectModel.fromMap(Map<String, dynamic> map) => ProjectModel(
    id: map['id'].toString(),
    projectHeader: map['header'] ?? '',
    projectTitle: map['title'] ?? '',
    projectDescription: map['description'] ?? '',
    projectImage: map['image'] ?? '',
    projectLink: map['link'] ?? '',
  );

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'header': projectHeader,
      'title': projectTitle,
      'description': projectDescription,
      'image': projectImage,
      'link': projectLink,
    };
  }

  ProjectModel copyWith({
    String? id,
    String? userId,
    String? projectHeader,
    String? projectTitle,
    String? projectDescription,
    String? projectImage,
    String? projectLink,
  }) {
    return ProjectModel(
      id: id ?? this.id,
      projectHeader: projectHeader ?? this.projectHeader,
      projectTitle: projectTitle ?? this.projectTitle,
      projectDescription: projectDescription ?? this.projectDescription,
      projectImage: projectImage ?? this.projectImage,
      projectLink: projectLink ?? this.projectLink,
    );
  }
}