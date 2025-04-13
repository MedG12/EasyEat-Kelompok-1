enum NavigationRoute {
  mainRoute("/main"),
  loginRoute("/login"),
  detailRoute("/detail"),
  cartRoute("/cart"),
  profileRoute("/profile");

  const NavigationRoute(this.name);
  final String name;
}
