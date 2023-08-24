import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:top_notch_v2/generated/l10n.dart';

class SortDropMenu extends StatefulWidget {
  const SortDropMenu({super.key});


  @override
  State<SortDropMenu> createState() => _SortDropMenuState();
}

class _SortDropMenuState extends State<SortDropMenu> {
  final Sort = ['High-to-low', 'Low-to-high'];

  var valuee;

  DropdownMenuItem<String> buildMenuItem(String Sorts) =>
      DropdownMenuItem(value: Sorts, child: Text(Sorts));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 240),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          style: TextStyle(fontSize: 13.sp, color:Colors.black),
          elevation: 8,
          isDense: true,
          borderRadius: BorderRadius.circular(20),
          hint: Text(
            'Sort by price',
            style:
                TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 15.sp),
          ),
          icon: Icon(
            Icons.keyboard_arrow_down_sharp,
            color: Colors.black,
            size: 25.sp,
          ),
          value: valuee,
          items: Sort.map(buildMenuItem).toList(),
          onChanged: (value) => setState(() {
            this.valuee = value;
            print(valuee);
          }),
        ),
      ),
    );
  }



}
