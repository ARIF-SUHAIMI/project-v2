import 'package:flutter/material.dart';
import 'package:nravepay/nravepay.dart';
import 'data.dart';
import 'dart:convert';
import 'dart:ffi';
import 'data.dart';
import 'package:flutter/material.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'dart:io';
import 'main.dart';

class Payment extends StatefulWidget {
  final Car car;
  Payment({required this.car});

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  Future<void> _startPayment() async {
    var initializer = PayInitializer(
        amount: 45,
        email: 'email@email.com',
        txRef: 'TXREF-${DateTime.now().microsecondsSinceEpoch}',
        narration: 'New payment',
        country: 'NG',
        currency: 'NGN',
        firstname: 'Nelson',
        lastname: 'Eze',
        phoneNumber: '09092343432',
        onComplete: (result) {
          if (result.status == HttpStatus.success) {
            if (result.card != null) {
              print(result.card!.toJson());
              //  saveCard(card);
            }
          }
          print(result.message);
        });
    //return PayManager().prompt(context: context, initializer: initializer);
  }

  late Token _paymentToken;
  late PaymentMethod _paymentMethod;
  late String _error;
  final String _currentSecret =
      "sk_test_51KNBEbGa2z685qyKm9ieOvexY37LeNIPdu1SgeGmL0nB9RLwbgXH8kJRw1nWEY3MzSOA2aBBvRxILNsFFEFkM0jZ00IZNrPosl"; //set this yourself, e.g using curl
  late PaymentIntentResult _paymentIntent;
  late Source _source;

  ScrollController _controller = ScrollController();

  final CreditCard testCard = CreditCard(
    number: '4111111111111111',
    expMonth: 08,
    expYear: 22,
  );

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  initState() {
    super.initState();
    StripePayment.setOptions(StripeOptions(
        publishableKey:
            "pk_test_51KNBEbGa2z685qyKUMpWRaSzNvCrhlGb4y1Vqf5PSvJvEIibzqQ1IIQgotUUUJ0dqNPSSB3KWO0umWROJVoJOWWO00BbOOiCdm",
        merchantId: "acct_1KNBEbGa2z685qyK",
        androidPayMode: 'test'));
  }

  List<BankCard> cards = [
    BankCard(
        id: '1234567',
        token: "flw-t1nf-5eab9b1fbfbab5806f676a88ef9630c2-m03k",
        last4digits: "4246",
        expiry: "09/32",
        first6digits: "418742",
        issuer: "Visa",
        type: "VISA"),
    BankCard(
        id: "1622103329220332_2643",
        token: "flw-t1nf-2c09dac5ab2da4c472c75da603da2e42-m03k",
        last4digits: "2643",
        expiry: "09/32",
        country: "UNITED KINGDOM GB",
        first6digits: "455605",
        issuer: "CREDIT",
        type: "VISA")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Are you sure ?',
            ),
            Container(
              margin: const EdgeInsets.all(18.0),
              width: 200,
              child: ElevatedButton(
                  child: Text("Pay RM " + widget.car.price.toString()),
                  onPressed: () {
                    StripePayment.paymentRequestWithCardForm(
                            CardFormPaymentRequest())
                        .then((paymentMethod) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Paid RM' +
                              widget.car.price.toString() +
                              " Car Model " +
                              widget.car.model)));
                      setState(() {
                        _paymentMethod = paymentMethod;
                      });
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
