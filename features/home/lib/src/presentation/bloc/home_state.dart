import 'package:equatable/equatable.dart';
import 'package:home/src/domain/models/score_result.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

/// Default state
class HomeInitial extends HomeState {
  const HomeInitial();
}

class FinancialWellnessScoreResult extends HomeState {
  const FinancialWellnessScoreResult(this.scoreResult);

  final ScoreResult scoreResult;

  @override
  List<Object?> get props => [scoreResult];
}
