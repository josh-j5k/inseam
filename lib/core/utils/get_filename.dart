String getFilename(String path) {
  String name = path.split("/").last;
  return name;
}
