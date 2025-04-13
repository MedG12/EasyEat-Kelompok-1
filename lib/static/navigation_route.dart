enum NavigationRoute {
  mainRoute("/main"),
  loginRoute("/login"),
  detailRoute("/detail"),
  cartRoute("/cart");

  const NavigationRoute(this.name);
  final String name;
}
