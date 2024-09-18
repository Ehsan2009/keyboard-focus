import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper(this.navigationShell, {super.key});

  final StatefulNavigationShell navigationShell;

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int selectedIndex = 0;

  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.arrowDown): () {
          if (selectedIndex != 2) {
            setState(() {
              selectedIndex = selectedIndex + 1;
              widget.navigationShell.goBranch(selectedIndex);
            });
          }
          return;
        },
        const SingleActivator(LogicalKeyboardKey.arrowUp): () {
          if (selectedIndex != 0) {
            setState(() {
              selectedIndex = selectedIndex - 1;
              widget.navigationShell.goBranch(selectedIndex);
            });
          }
          return;
        }
      },
      child: Scaffold(
        body: Row(
          children: [
            Focus(
              autofocus: true,
              child: NavigationRail(
                onDestinationSelected: onTap,
                backgroundColor: Colors.black,
                indicatorColor: Colors.lightBlue[500],
                selectedLabelTextStyle: TextStyle(
                  color: Colors.lightBlue[500],
                ),
                unselectedLabelTextStyle: const TextStyle(
                  color: Colors.white,
                ),
                useIndicator: true,
                labelType: NavigationRailLabelType.all,
                elevation: 5,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(
                      Icons.shop,
                      color: Colors.white,
                    ),
                    label: Text('Card'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    label: Text('Profile'),
                  ),
                ],
                selectedIndex: widget.navigationShell.currentIndex,
              ),
            ),
            Expanded(child: widget.navigationShell),
          ],
        ),
      ),
    );
  }
}
