class HeroTag {
  static String image(String urlImage) => urlImage;

  static String addressLine1(String path) => "${path}_unique";

  static String addressLine2(String  path) => path;

  static String avatar(String imagePath, int position) =>
      imagePath + position.toString();
}