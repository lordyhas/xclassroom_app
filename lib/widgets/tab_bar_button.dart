

import 'package:flutter/material.dart';
import 'package:unhorizons/logic/values.dart';



class TabBarButton extends StatelessWidget {
  const TabBarButton({
    required this.title,
    required this.onTap,
    required this.isSelected,
    Key? key,
  }) :  super(key: key);

  final VoidCallback onTap;
  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    String txt = title;
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).primaryColor
                :  AppTheme.nearlyWhite,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            border: Border.all(color: Theme.of(context).primaryColor)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 18, right: 18),
              child: Center(
                child: Text(
                  txt,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 0.27,
                    color: isSelected
                        ? AppTheme.nearlyWhite
                        : Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}