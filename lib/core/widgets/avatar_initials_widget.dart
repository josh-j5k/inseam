import 'package:flutter/material.dart';
import 'package:inseam/core/utils/color_from_hash_code.dart';
import 'package:inseam/core/utils/get_initials.dart';

class AvatarInitialsWidget extends StatelessWidget {
  final String name;
  final double size;
  final bool ring;
  const AvatarInitialsWidget({
    super.key,
    required this.name,
    this.size = 30,
    this.ring = false,
  });

  @override
  Widget build(BuildContext context) {
    if (ring) {
      return Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
        child: CircleAvatar(
          radius: size,
          backgroundColor: colorFromHashCode(name),
          child: Text(
            getInitials(name),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
    return CircleAvatar(
      radius: size,
      backgroundColor: colorFromHashCode(name),
      child: Text(
        getInitials(name),
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
