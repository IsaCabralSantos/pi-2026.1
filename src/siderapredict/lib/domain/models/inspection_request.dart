class InspectionRequest {
  final String requestId;
  final DateTime dateTime;
  final String detectedFault;
  final String confidence;
  final String possibleCause;
  final String recommendedAdjustment;
  final String sectionMachine;
  final String imagePath;
  final String observations;

  const InspectionRequest({
    required this.requestId,
    required this.dateTime,
    required this.detectedFault,
    required this.confidence,
    required this.possibleCause,
    required this.recommendedAdjustment,
    required this.sectionMachine,
    required this.imagePath,
    this.observations = '',
  });

  InspectionRequest copyWith({
    String? requestId,
    DateTime? dateTime,
    String? detectedFault,
    String? confidence,
    String? possibleCause,
    String? recommendedAdjustment,
    String? sectionMachine,
    String? imagePath,
    String? observations,
  }) {
    return InspectionRequest(
      requestId: requestId ?? this.requestId,
      dateTime: dateTime ?? this.dateTime,
      detectedFault: detectedFault ?? this.detectedFault,
      confidence: confidence ?? this.confidence,
      possibleCause: possibleCause ?? this.possibleCause,
      recommendedAdjustment:
          recommendedAdjustment ?? this.recommendedAdjustment,
      sectionMachine: sectionMachine ?? this.sectionMachine,
      imagePath: imagePath ?? this.imagePath,
      observations: observations ?? this.observations,
    );
  }
}
