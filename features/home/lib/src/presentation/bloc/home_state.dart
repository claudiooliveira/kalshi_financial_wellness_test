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
  FinancialWellnessScoreResult(this.scoreResult) : _now = DateTime.now();

  final ScoreResult scoreResult;
  final DateTime _now; // A workaround to dispatch the event with the same value

  @override
  List<Object?> get props => [scoreResult, _now];
}
