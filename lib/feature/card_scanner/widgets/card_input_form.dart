import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/utils/formatters.dart';

class CardInputForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController panController;
  final TextEditingController expiryController;
  final Function(String? value) onCardNumberChanged;
  final Function(String? value) onExpiryDateChanged;

  CardInputForm({super.key, required this.panController, required this.expiryController, required this.onCardNumberChanged, required this.onExpiryDateChanged});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 16,
        children: [
          TextFormField(
            onChanged: onCardNumberChanged,
            controller: panController,
            style: TextStyle(
              color: Colors.white
            ),
            cursorColor: Colors.lightBlueAccent,
            decoration: InputDecoration(
              labelText: 'Card Number (PAN)',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.white
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.lightBlueAccent
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              labelStyle: TextStyle(
                color: Colors.white,
              )
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(16),
              CardNumberFormatter(),
            ],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter card number';
              }
              return null;
            },
          ),
          TextFormField(
            style: TextStyle(
                color: Colors.white
            ),
            onChanged: onExpiryDateChanged,
            controller: expiryController,
            cursorColor: Colors.lightBlueAccent,
            decoration: InputDecoration(
                labelText: 'Expiry Date (MM/YY)',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.lightBlueAccent
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                labelStyle: TextStyle(
                  color: Colors.white,
                )
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4),
              ExpiryDateFormatter(),
            ],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter expiry date';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}