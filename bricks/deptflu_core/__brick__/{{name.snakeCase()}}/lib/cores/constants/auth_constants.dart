enum AuthStatus {
  initial("Initial"),
  authenticated("Authenticated"),
  unauthenticated("Unauthenticated"),
  error("Error");

  final String title;

  const AuthStatus(this.title);
}
