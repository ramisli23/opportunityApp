class Application {
  final String applicationId;
  final String userId;
  final String opportunityId;
  final String status;
  final String submittedAt;
  final String uploadedFiles;

  Application({
    required this.applicationId,
    required this.userId,
    required this.opportunityId,
    required this.status,
    required this.submittedAt,
    required this.uploadedFiles,
  });

  factory Application.fromMap(Map<String, dynamic> map) {
    return Application(
      applicationId: map['application_id'],
      userId: map['user_id'],
      opportunityId: map['opportunity_id'],
      status: map['status'],
      submittedAt: map['submitted_at'],
      uploadedFiles: map['uploaded_files'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'application_id': applicationId,
      'user_id': userId,
      'opportunity_id': opportunityId,
      'status': status,
      'submitted_at': submittedAt,
      'uploaded_files': uploadedFiles,
    };
  }
}
