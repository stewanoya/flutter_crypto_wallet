import 'package:flutter/material.dart';

import '../net/flutterfire.dart';

class AddView extends StatefulWidget {
  const AddView({Key? key}) : super(key: key);

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  List<String> coins = [
    'bitcoin',
    'tether',
    'ethereum',
  ];

  String? dropdownValue = 'bitcoin';

  TextEditingController _amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton<String>(
            items: coins.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            value: dropdownValue,
            onChanged: (String? value) {
              dropdownValue = value;
              setState(() {});
            },
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            child: TextFormField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: "Coin Amount",
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Container(
            // media query gives us the width of the screen
            // we divide it by 1.4 to make it smaller
            width: MediaQuery.of(context).size.width / 1.4,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
            ),
            child: MaterialButton(
              onPressed: () async {
                await addCoin(dropdownValue!, _amountController.text);
                //will remove this material widget from the screen and bring
                // us back to the last screen;
                Navigator.of(context).pop();
              },
              child: Text("Add"),
            ),
          ),
        ],
      ),
    );
  }
}
