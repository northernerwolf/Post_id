class UnboardingContent {
  String iamge;
  String title;
  String description;

  UnboardingContent(
      {required this.iamge, required this.title, required this.description});
}

List<UnboardingContent> contents = [
  UnboardingContent(
    iamge: 'lib/assets/images/screen1.png',
    title: "Welcome",
    description: "Post and manage posts from one place on all networks",
  ),
  UnboardingContent(
    iamge: 'lib/assets/images/screen1.png',
    title: "",
    description:
        "Write a content, add a picture, choose the social networks you want to share the post with",
  ),
  UnboardingContent(
    iamge: 'lib/assets/images/screen1.png',
    title: "",
    description:
        "Comment on posts through the app and see how many exposures each post received",
  ),
];
