String getInitials(String name) {
  return name.splitMapJoin(
    RegExp(r'(\b\w)?'),
    onMatch: (m) => m.group(0)!.toUpperCase(),
    onNonMatch: (n) => '',
  );
}
