class AzkarDetailsModel {
  int? section_id;
  String? count, description, reference, content;

  AzkarDetailsModel(
      {this.section_id,
      this.count,
      this.description,
      this.reference,
      this.content});

  factory AzkarDetailsModel.fromJson(Map<String, dynamic> json) {
    return AzkarDetailsModel(
      section_id: json["section_id"],
      count: json["count"],
      description: json["description"],
      reference: json["reference"],
      content: json["content"],
    );
  }
//
}
