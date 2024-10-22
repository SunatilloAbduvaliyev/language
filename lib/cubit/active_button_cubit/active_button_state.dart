class ActiveButtonState {
  final bool isActive;
  final dynamic data;

  ActiveButtonState({
    required this.isActive,
    required this.data,
  });

  ActiveButtonState copyWith({
    bool? isActive,
    dynamic data,
  }) =>
      ActiveButtonState(
        isActive: isActive ?? this.isActive,
        data: data,
      );

  static ActiveButtonState initialValue() => ActiveButtonState(
        isActive: false,
        data: '',
      );

}
