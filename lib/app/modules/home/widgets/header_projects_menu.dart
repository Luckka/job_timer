import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../entities/project_status.dart';

class HeaderProjectsMenu extends SliverPersistentHeaderDelegate{
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,
          height: constraints.maxHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: constraints.maxWidth * .5,
                child: DropdownButtonFormField<ProjectStatus>(
                  items: ProjectStatus.values.map((e) => DropdownMenuItem(child: Text(e.label),value: e,)).toList(),
                   onChanged: (value){},
                   decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20) ),
                    contentPadding: EdgeInsets.all(10),
                    isCollapsed: true
                   ),
                )),
              SizedBox(
                width: constraints.maxWidth * .4,
                child: ElevatedButton.icon(
                    onPressed: (){
                      Modular.to.pushNamed('/project/register');
                    },icon: Icon(Icons.add),label: Text('Novo Projeto'),
                ))
            ],
          ),
        );
      }
    );
  }

  @override
  double get maxExtent => 80.0;

  @override
  double get minExtent => 80.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
  
}