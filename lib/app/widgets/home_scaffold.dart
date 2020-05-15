import 'package:fluix/fluix.dart';
import 'package:flutter/material.dart';

class HomeScaffold extends StatelessWidget {
  final Widget body;
  final List<Widget> actions;
  final String title;
  final Future<bool> Function() willNavigate;

  const HomeScaffold(
    this.title, {
    Key key,
    this.body,
    this.actions,
    this.willNavigate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = FluidTheme.of(context);

    void navigate(String n) async {
      if (willNavigate != null) {
        final doNavigation = await willNavigate();
        if (doNavigation == null || !doNavigation) return;
      }

      Navigator.of(context).pushReplacementNamed(n);
    }

    return FluidShell(
      appBar: FluidBar(
        color: theme.primary.dark,
        title: Text(title),
        actions: actions,
      ),
      responsiveSidebar: true,
      sideBar: FluidSidebar(
        expandable: true,
        children: [
          SidebarItem(
            title: 'Sets',
            icon: Icon(LiquidIcons.basket),
            selected: title == 'Sets',
            onTap: () => navigate('/'),
          ),
          SidebarItem(
            title: 'Parts',
            icon: Icon(LiquidIcons.listview),
            selected: title == 'Parts',
            onTap: () => navigate('/parts'),
          ),
          SidebarItem(
            title: 'Options',
            icon: Icon(LiquidIcons.settings),
            selected: title == 'Options',
            onTap: () => navigate('/options'),
          ),
        ],
      ),
      body: body,
    );
  }
}
