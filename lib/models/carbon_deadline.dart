class CarbonDeadline {
  final String description;
  final String flavor;
  final List<String> labels;
  final String lang;
  final String timestamp;
  final String type;
  final int updateIntervalSeconds;

  CarbonDeadline({
    required this.description,
    required this.flavor,
    required this.labels,
    required this.lang,
    required this.timestamp,
    required this.type,
    required this.updateIntervalSeconds,
  });

  factory CarbonDeadline.fromJson(Map<String, dynamic> json) {
    return CarbonDeadline(
      description: json['description'],
      flavor: json['flavor'],
      labels: List<String>.from(json['labels']),
      lang: json['lang'],
      timestamp: json['timestamp'],
      type: json['type'],
      updateIntervalSeconds: json['update_interval_seconds'],
    );
  }
}
