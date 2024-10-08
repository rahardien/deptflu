enum BaseStatus {
  initial("INITIAL"),
  loading("LOADING"),
  success("SUCCESS"),
  error("ERROR"),
  empty("EMPTY"),
  loadMore("LOAD MORE");

  final String name;

  const BaseStatus(this.name);
}
