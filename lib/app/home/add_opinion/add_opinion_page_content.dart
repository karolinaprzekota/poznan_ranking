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
  var rating = 3.0;

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
          Slider(
            label: rating.toString(),
            divisions: 10,
            value: rating,
            min: 1.0,
            max: 6.0,
            onChanged: (NewValue) {
              setState(
                () {
                  rating = NewValue;
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
                  'rating': rating,
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
