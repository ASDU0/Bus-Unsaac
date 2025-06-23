import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/bus_provider.dart';

class ContadorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bus = Provider.of<BusProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: bus.bajarPasajero,
          child: Icon(Icons.remove),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
          ),
        ),
        SizedBox(width: 30),
        ElevatedButton(
          onPressed: bus.subirPasajero,
          child: Icon(Icons.add),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
          ),
        ),
      ],
    );
  }
}
