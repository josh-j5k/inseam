import 'package:inseam/features/home/data/models/schedule.dart';

List<Schedule> schedules = [
  Schedule(
    name: "Mat Harden",
    task: "Wedding Dress Alterations",
    note: "Deadline: Today, 2:00PM",
    contact: Contact(whatsapp: "+1234567890", phone: "+1234567890"),
    status: "urgent",
  ),
  Schedule(
    name: "Sarah Lee",
    task: "Suit Tailoring",
    note: "Oct 4 - Sketching phase",
    contact: Contact(whatsapp: "+1234567890", phone: "+1234567890"),
    status: "pending",
  ),
  Schedule(
    name: "James Storm",
    task: "Casual Shirt Fitting",
    note: "Oct 30 - Sketching phase",
    contact: Contact(whatsapp: "+1234567890", phone: "+1234567890"),
    status: "pending",
  ),
  Schedule(
    name: "Mary Poppins",
    task: "Evening Gown Design",
    note: "Nov 30 - Sketching phase",
    contact: Contact(whatsapp: "+1234567890", phone: "+1234567890"),
    status: "completed",
  ),
];
