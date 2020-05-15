import 'dart:async';

import 'package:brickr/app/models/preview_set.dart';
import 'package:brickr/app/widgets/set_tile.dart';
import 'package:fluix/fluix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'discover_controller.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key key}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState
    extends ModularState<DiscoverPage, DiscoverController> {
  //use 'controller' variable to access controller

  final searchController = TextEditingController();

  void search(String s) {
    Timer(Duration(milliseconds: 500), () {
      if (searchController.text == s) {
        controller.loadResults(_rowCount, s);
      }
    });
  }

  Widget buildLoaded() {
    return ListView.builder(
      itemCount: controller.pageCount,
      padding: EdgeInsets.all(16),
      itemBuilder: (context, pageNumber) {
        return FutureBuilder<List<LegoSet>>(
          future: controller.getSets(
            pageNumber + 1,
            searchController.text,
            _rowCount * 5,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 2,
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                var pageData = snapshot.data;

                return _BuildPage(pageData, _rowCount);
              }
            }
            return SizedBox(
              height: MediaQuery.of(context).size.height * 2,
              child: Align(
                alignment: Alignment.topCenter,
                child: CircularProgressIndicator(),
              ),
            );
          },
        );
      },
    );
  }

  int _rowCount = 6;

  @override
  void didChangeDependencies() {
    final w = MediaQuery.of(context).size.width;

    _rowCount = (w / 140).round();

    controller.loadResults(_rowCount * 5, searchController.text);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //final w = MediaQuery.of(context).size.width;

    final theme = FluidTheme.of(context);
    return FluidShell(
        appBar: FluidBar(
          title: Text('Discover'),
          color: theme.primary.dark,
          actions: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 300),
              child: FluidInput(
                controller: searchController,
                hintText: 'Search...',
                onChanged: search,
              ),
            )
          ],
        ),
        body: LayoutBuilder(
          builder: (_, size) {
            return Observer(
              builder: (_) {
                if (controller.isLoading)
                  return Center(
                    child: CircularProgressIndicator(),
                  );

                return buildLoaded();
              },
            );
          },
        ));
  }
}

class _BuildPage extends StatelessWidget {
  final List<LegoSet> page;
  final int rowCount;

  const _BuildPage(this.page, this.rowCount, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DistributedGrid(
      crossAxisCount: rowCount,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: page.map(
        (s) {
          return SetTile(
            s: s,
            onTap: () => Navigator.of(context).pushNamed('/set', arguments: s),
          );
        },
      ).toList(),
    );
  }
}
