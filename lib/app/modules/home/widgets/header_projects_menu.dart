import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/home/controller/home_controller.dart';

import '../../../entities/project_status.dart';

class HeaderProjectsMenu extends SliverPersistentHeaderDelegate{

  final HomeController controller;

  HeaderProjectsMenu({required this.controller});
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: const EdgeInsets.all(10),
          color: Colors.white,
          height: constraints.maxHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: constraints.maxWidth * .5,
                child: DropdownButtonFormField<ProjectStatus>(
                  value: ProjectStatus.em_andamento,
                  items: ProjectStatus.values.map((e) => DropdownMenuItem(child: Text(e.label),value: e,)).toList(),
                   onChanged: (status){
                    if(status != null){
                      controller.filter(status);
                    }
                   },
                   decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20) ),
                    contentPadding: const EdgeInsets.all(10),
                    isCollapsed: true
                   ),
                )),
              SizedBox(
                width: constraints.maxWidth * .4,
                child: ElevatedButton.icon(
                    onPressed: () async{
                    await Modular.to.pushNamed('/project/register');
                    controller.loadProjects();
                    },
                    icon: const Icon(Icons.add),label: const Text('Novo Projeto'),
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