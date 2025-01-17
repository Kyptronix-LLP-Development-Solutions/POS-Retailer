// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class BackButtonInterceptor extends NavigatorObserver {
//   final BuildContext context;

//   BackButtonInterceptor(this.context);

//   @override
//   void didPop(Route route, Route? previousRoute) {
//     super.didPop(route, previousRoute);
//     // When we are on the last page, show a dialog
//     if (previousRoute == null) {
//       _showExitConfirmation();
//     }
//   }

//   // Show a confirmation dialog to ask the user if they want to exit
//   void _showExitConfirmation() async {
//     final shouldExit = await showDialog<bool>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Are you sure?'),
//           content: Text('Do you really want to close the app?'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(false),
//               child: Text('No'),
//             ),
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(true),
//               child: Text('Yes'),
//             ),
//           ],
//         );
//       },
//     );
//     if (shouldExit == true) {
//       // Close the app if the user confirms
//       SystemNavigator.pop();
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BackButtonInterceptor extends NavigatorObserver {
  late final BuildContext _context;

  // No need to pass context here, we will assign it later
  @override
  void didPush(Route<dynamic> route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    _context = route.navigator!.context; // Get context dynamically
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    // When we are on the last page, show a dialog
    if (previousRoute == null) {
      _showExitConfirmation();
    }
  }

  // Show a confirmation dialog to ask the user if they want to exit
  void _showExitConfirmation() async {
    final shouldExit = await showDialog<bool>(
      context: _context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you really want to close the app?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
    if (shouldExit == true) {
      // Close the app if the user confirms
      SystemNavigator.pop();
    }
  }
}
