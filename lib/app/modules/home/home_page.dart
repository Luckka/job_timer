import 'package:flutter/material.dart';

import 'widgets/header_projects_menu.dart';
class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text('Projetos'),
              expandedHeight: 100,
              toolbarHeight: 100,
              centerTitle: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))
              ),
            ),
            SliverPersistentHeader(
              delegate: HeaderProjectsMenu(),
              pinned: true,
            ),
            SliverList(delegate: SliverChildListDelegate([
              Container(
                color: Colors.blue,
                height: 200,
              ),
              Container(
                color: Colors.blue,
                height: 200,
              ),
              Container(
                color: Colors.blue,
                height: 200,
              ),
              Container(
                color: Colors.blue,
                height: 200,
              )
            ]))
          ],
        ),
      ),
    );
  }
}