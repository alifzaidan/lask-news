class ProfileModel {
  String page;
  String route;

  ProfileModel({
    required this.page,
    required this.route,
  });
}

var settings = [
  ProfileModel(
    page: "My Account",
    route: "/account",
  ),
  ProfileModel(
    page: "My Articles",
    route: "/myarticles",
  ),
  ProfileModel(
    page: "About Us",
    route: "/aboutus",
  ),
];
