class EvaluationAcceptedModel {
  EvaluationAcceptedModel({
    required this.uid,
  });

  final String uid;

  factory EvaluationAcceptedModel.from({required Map<String, dynamic> json}) {
    return EvaluationAcceptedModel(
      uid: json['uid'],
    );
  }
}