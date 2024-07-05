enum ScoreResult {
  healthy(1.0),
  average(0.66),
  unhealthy(0.33);

  const ScoreResult(this.percent);
  final double percent;
}
