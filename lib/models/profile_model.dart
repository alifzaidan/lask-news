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
    page: "My Articles",
    route: "/myarticles",
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
    page: "About Us",
    route: "/aboutus",
  ),
];
