import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          "https://i.pinimg.com/originals/c3/c4/09/c3c40926dca06a97dd0562753d63b7f4.png",
          height: 80,
        ),
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 80,
          ),
          child: Column(
            children: [
              Container(
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, '/home'),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(width: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Menu",
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () => GoRouter.of(context).pop(),
                              icon: const Icon(CupertinoIcons.chevron_back),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkwellMenu(context, "Home", '/home', Icon(Icons.home)),
              InkwellMenu(context, "Track Shipment ", '/trackShipment',
                  Icon(Icons.search)),
              InkwellMenu(context, "Create Shipment ", '/createShipment',
                  Icon(Icons.add_box)),
              InkwellMenu(
                  context, "My Shipments ", '/myShipment', Icon(Icons.inbox)),
              InkwellMenu(context, "Rates and Services  ", '/ratesAndServices',
                  Icon(Icons.monetization_on)),
              InkwellMenu(
                  context, "Support", '/support', Icon(Icons.support_agent)),
              InkwellMenu(context, "Find a Location ", '/findALocation',
                  Icon(Icons.location_on)),
              InkwellMenu(context, "Profile", '/profile', Icon(Icons.person)),
              InkwellMenu(context, "Notifications", '/notifications',
                  Icon(Icons.notifications)),
              InkwellMenu(
                  context, "Settings", '/settings', Icon(Icons.settings)),
              InkwellMenu(context, "Contact ", '/contact', Icon(Icons.call)),
              InkwellMenu(context, "About Us", '/about', Icon(Icons.person)),
              InkwellMenu(context, "Logout", '/', Icon(Icons.logout)),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Product(),
          ],
        ),
      ),
    );
  }
}

InkWell InkwellMenu(
    BuildContext context, String name, String route, Icon icon) {
  return InkWell(
    onTap: () {
      Navigator.pop(context); // Close the drawer
      GoRouter.of(context).go(route);
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          icon,
          SizedBox(width: 10),
          Text(name),
        ],
      ),
    ),
  );
}

class Product extends StatelessWidget {
  final List<NotificationItem> notifications = [
    NotificationItem(
      title: 'Package Delivered',
      message: 'Your package was delivered on June 9, 2024.',
      date: 'June 9, 2024',
    ),
    NotificationItem(
      title: 'Package at Distribution Center',
      message:
          'Your package arrived at the distribution center on June 8, 2024.',
      date: 'June 8, 2024',
    ),
    NotificationItem(
      title: 'Out for Delivery',
      message: 'Your package is out for delivery on June 7, 2024.',
      date: 'June 7, 2024',
    ),
    NotificationItem(
      title: 'Package Arrived at Hub',
      message: 'Your package arrived at the hub on June 6, 2024.',
      date: 'June 6, 2024',
    ),
    NotificationItem(
      title: 'Shipment Picked Up',
      message: 'Your shipment was picked up on June 5, 2024.',
      date: 'June 5, 2024',
    ),
    NotificationItem(
      title: 'Shipment Created',
      message: 'Your shipment was created on June 4, 2024.',
      date: 'June 4, 2024',
    ),
    NotificationItem(
      title: 'Package In Transit',
      message: 'Your package is in transit as of June 3, 2024.',
      date: 'June 3, 2024',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: notifications.map((notification) {
          return Card(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(notification.title),
              subtitle: Text(notification.message),
              trailing: Text(notification.date),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String message;
  final String date;

  NotificationItem({
    required this.title,
    required this.message,
    required this.date,
  });
}
