part of 'root_cubit.dart';

@immutable
class RootState {
  final User? user;
  final String errorMessage;
  final bool isLoading;

  const RootState({
    required this.user,
    required this.errorMessage,
    required this.isLoading,
  });
}
