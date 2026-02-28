import 'package:digital_altier/core/theme/app_colors.dart';
import 'package:digital_altier/core/theme/app_text_styles.dart';
import 'package:digital_altier/core/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

          body: SafeArea(child: Scrollable(
            viewportBuilder: (BuildContext context, ViewportOffset position) {
              return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
              children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Row(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              CircleAvatar(
              radius: 30,
              ),
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("good morning"),
              Text("inseam".toUpperCase())
              ],
              )
              ],
              ),
              TextButton(onPressed: () {},

              child: Icon(
              Icons.notifications, color: AppColors.accent, size: 25,
              ),
              ),
              ],
              ),
                SizedBox(
                  height: 10,
                ),
                SearchBar(
                  hintText: "Search clients, measurements...",
                  hintStyle: WidgetStatePropertyAll(TextStyle(color: Color.from(alpha: 0.7, red: 0, green: 0, blue: 0) ),
                  ),
                  leading: Icon(Icons.search),
                  padding: WidgetStatePropertyAll(EdgeInsetsGeometry.only(left: 15, right: 15),
                  ),
                  side: WidgetStatePropertyAll(BorderSide(width: 1.0, color: AppColors.secondary),
                  ),
                  backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  shadowColor: WidgetStatePropertyAll(
                    Colors.transparent
                  ),
                ),
              ],
              ),
              );
            },

          ),
          ),

      bottomNavigationBar: NavbarWidget(),
        );
  }

}