class Schedule {
  final String name;
  final String task;
  final String note;
  final Contact contact;
  final String status;
  const Schedule({
    required this.name,
    required this.task,
    required this.note,
    required this.contact,
    required this.status,
  });
}

class Contact {
  final String whatsapp;
  final String phone;
  const Contact({required this.whatsapp, required this.phone});
}
