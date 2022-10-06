import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddOpinionPageContent extends StatefulWidget {
  const AddOpinionPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<AddOpinionPageContent> createState() => _AddOpinionPageContentState();
}

class _AddOpinionPageContentState extends State<AddOpinionPageContent> {
  var restaurantName = '';
  var burgerName = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration:
                const InputDecoration(hintText: 'Podaj nazwę restauracji'),
            // ignore: non_constant_identifier_names
            onChanged: (NewValue) {
              setState(
                () {
                  restaurantName = NewValue;
                },
              );
            },
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Podaj nazwę burgera'),
            // ignore: non_constant_identifier_names
            onChanged: (NewValue) {
              setState(
                () {
                  burgerName = NewValue;
                },
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              FirebaseFirestore.instance.collection('restaurants').add(
                {
                  'name': restaurantName,
                  'burger': burgerName,
                  'rating': 5.5,
                },
              );
            },
            child: const Text('Dodaj'),
          ),
        ],
      ),
    );
  }
}
