import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:test_task_card/data/entities/card_entity.dart';
import 'package:test_task_card/feature/card_scanner/card_scanner_logic.dart';
import 'package:test_task_card/feature/card_scanner/widgets/custom_scan_button.dart';

import 'widgets/card_input_form.dart';
import 'widgets/credit_card.dart';
import 'widgets/scaffold_wrapper.dart';

class CardScannerPage extends StatelessWidget {
  static const String route = '/home_page';

  CardScannerPage({super.key});

  final logic = Get.find<CardScannerLogic>();
  final state = Get
      .find<CardScannerLogic>()
      .state;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Obx(() {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    spacing: 30,
                    children: [
                      state.cardList.isEmpty
                          ? CreditCardWidget(
                        cardNumber: state.cardNumber.value,
                        expiryDate: state.cardDate.value,
                        cardType: state.cardNumber.value.startsWith("9860") ? CardType.humo : CardType.uzcard,
                      ).animate().fadeIn(duration: 500.ms).slide()

                      // 1. Cards List
                          : SizedBox(
                          height: 200,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemBuilder: (_, index) {
                              log(state.cardList[index].panNumber.toString());
                              return CreditCardWidget(
                                cardNumber: state.cardList[index].panNumber,
                                expiryDate: state.cardList[index].expiryDate,
                                cardType: state.cardList[index].cardType,
                              ).animate().fadeIn(duration: 500.ms).slide();
                            },
                            itemCount: state.cardList.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                          )),

                      // 2. Card Input Form
                      CardInputForm(
                        onCardNumberChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          logic.onNumberChanged();
                          // context.read<CardScannerBloc>().add(CardInputChanged(cardNumber: cardNumberController.text.trim(), expiryDate: expiryDateController.text.trim()));
                        },
                        onExpiryDateChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          logic.onDateChanged();
                          // context.read<CardScannerBloc>().add(CardInputChanged(cardNumber: cardNumberController.text.trim(), expiryDate: expiryDateController.text.trim()));
                        },
                        expiryController: logic.expireDateController,
                        panController: logic.numberController,
                      ).animate().fadeIn(duration: 500.ms).scale(),

                      // 3. Scan Buttons
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomScanButton(
                            onTap: () {},
                            text: "Scan",
                            icon: Icon(CupertinoIcons.barcode_viewfinder, color: Colors.white),
                          ).animate().fadeIn(duration: 600.ms).scale(),
                          CustomScanButton(
                            onTap: () {},
                            text: "Read NFC",
                            icon: Icon(Icons.nfc_outlined, color: Colors.white),
                          ).animate().fadeIn(duration: 600.ms).scale(),
                        ],
                      ),
                    ],
                  ).animate().fadeIn(duration: 800.ms).scale(),
                ),
              ),
              state.isLoading.value ? Center(child: CupertinoActivityIndicator(color: Colors.white, radius: 18,)) : SizedBox.shrink(),
            ],
          );
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: MaterialButton(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(
              color: Colors.white,
              width: 0.5,
            ),
          ),
          onPressed: () async {
            await logic.addNewCard();
          },
          color: Colors.white.withAlpha(0x4D),
          child: Text(
            "Add new card",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
