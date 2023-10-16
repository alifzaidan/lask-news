class ProfileModel {
  String page;
  String route;

  ProfileModel({
    required this.page,
    required this.route,
  });
}

var profiles = [
  ProfileModel(
    page: "Clapped Articles",
    route: "/claped",
  ),
  ProfileModel(
    page: "Read Articles",
    route: "/read",
  ),
];

var settings = [
  ProfileModel(
    page: "My Account",
    route: "/account",
  ),
  ProfileModel(
    page: "Privacy Settings",
    route: "/privacy",
  ),
  ProfileModel(
    page: "Offline Reading",
    route: "/offreading",
  ),
  ProfileModel(
    page: "About Us",
    route: "/aboutus",
  ),
];
