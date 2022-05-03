import 'package:responsive_grid/responsive_grid.dart';
import 'package:flutter/material.dart';
import 'package:srm_test/resources/const.dart';

class ResponsiveCards extends StatelessWidget {
  const ResponsiveCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridRow( children: [
              ResponsiveGridCol(
      xs: 12,
      md: 6,
      lg: 3,
      child:  cardList[0],
    
              ),
              ResponsiveGridCol(
      xs: 12,
      md: 6,
      lg: 3,
      child:  cardList[1],
    
              ),
              ResponsiveGridCol(
      xs: 12,
      md: 6,
      lg: 3,
      child:  cardList[2],
    
              ),
              ResponsiveGridCol(
      xs: 12,
      md: 6,
      lg: 3,
      child:  cardList[3],
              ),
            ]
    );
  }
}