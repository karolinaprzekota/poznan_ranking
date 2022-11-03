part of 'root_cubit.dart';

@immutable
class RootState {
  final User? user;
  final String errorMessage;
  final bool isLoading;
  final bool isCreatingAccount;

  const RootState(
      {required this.user,
      required this.errorMessage,
      required this.isLoading,
      required this.isCreatingAccount});
}
