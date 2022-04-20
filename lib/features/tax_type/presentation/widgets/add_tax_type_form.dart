import 'package:flutter/material.dart';

class AddTaxTypeForm extends StatefulWidget {
  const AddTaxTypeForm({Key? key}) : super(key: key);

  @override
  State<AddTaxTypeForm> createState() => _AddTaxTypeFormState();
}

class _AddTaxTypeFormState extends State<AddTaxTypeForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Description'),
              alignLabelWithHint: true,
            ),
            maxLines: 3,
            textAlign: TextAlign.start,
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Code'),
            ),
          ),
          ElevatedButton(onPressed: (){}, child: Text('Add Record')),

        ],
      ),
    );
  }
}
