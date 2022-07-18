class Goal {
  Goal({
    required this.id,
    required this.title,
    required this.iconHash,
    this.isArchived = false,
  });

  final int id;
  final bool isArchived;
  final String title;
  final int iconHash;
}
