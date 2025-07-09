class Opportunity {
  final String opportunityId;
  final String title;
  final String type;
  final String company;
  final String location;
  final String duration;
  final String eligibility;
  final String benefits;
  final DateTime deadline;
  final List<String> documentsRequired;
  final String applicationLink;
  final DateTime createdAt;

  Opportunity({
    required this.opportunityId,
    required this.title,
    required this.type,
    required this.company,
    required this.location,
    required this.duration,
    required this.eligibility,
    required this.benefits,
    required this.deadline,
    required this.documentsRequired,
    required this.applicationLink,
    required this.createdAt,
  });

  factory Opportunity.fromJson(Map<String, dynamic> json) {
    return Opportunity(
      opportunityId: json["opportunity_id"],
      title: json["title"],
      type: json["type"],
      company: json["company"],
      location: json["location"],
      duration: json["duration"],
      eligibility: json["eligibility"],
      benefits: json["benefits"],
      deadline: DateTime.parse(json["deadline"]),
      documentsRequired: List<String>.from(json["documents_required"]),
      applicationLink: json["application_link"],
      createdAt: DateTime.parse(json["created_at"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "opportunity_id": opportunityId,
      "title": title,
      "type": type,
      "company": company,
      "location": location,
      "duration": duration,
      "eligibility": eligibility,
      "benefits": benefits,
      "deadline": deadline.toIso8601String(),
      "documents_required": documentsRequired,
      "application_link": applicationLink,
      "created_at": createdAt.toIso8601String(),
    };
  }
}
