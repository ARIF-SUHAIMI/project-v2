import 'dart:convert';
import 'dart:ffi';
import 'data.dart';
import 'package:flutter/material.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'dart:io';

class Payment extends StatefulWidget {
  final Car car;
  Payment({required this.car});

  @override
  _PaymentState createState() => new _PaymentState();
}

class _PaymentState extends State<Payment> {
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

  void setError(dynamic error) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(error.toString())));
    setState(() {
      _error = error.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ElevatedButton(
            child: Text("Create Source"),
            onPressed: () {
              StripePayment.createSourceWithParams(SourceParams(
                type: 'ideal',
                amount: widget.car.price.toInt(),
                currency: 'eur',
                returnURL: 'example://stripe-redirect',
              )).then((source) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Received ${source.sourceId}')));
                setState(() {
                  _source = source;
                });
              }).catchError(setError);
            },
          ),
          Divider(),
          ElevatedButton(
            child: Text("Create Token with Card Form"),
            onPressed: () {
              StripePayment.paymentRequestWithCardForm(CardFormPaymentRequest())
                  .then((paymentMethod) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Received ${paymentMethod.id}')));
                setState(() {
                  _paymentMethod = paymentMethod;
                });
              }).catchError(setError);
            },
          ),
          ElevatedButton(
            child: Text("Create Token with Card"),
            onPressed: () {
              StripePayment.createTokenWithCard(
                testCard,
              ).then((token) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Received ${token.tokenId}')));
                setState(() {
                  _paymentToken = token;
                });
              }).catchError(setError);
            },
          ),
          ElevatedButton(
            child: Text("Create Payment Method with existing token"),
            onPressed: () {
              StripePayment.createPaymentMethod(
                PaymentMethodRequest(
                  card: CreditCard(
                    token: _paymentToken.tokenId,
                  ),
                ),
              ).then((paymentMethod) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Received ${paymentMethod.id}')));
                setState(() {
                  _paymentMethod = paymentMethod;
                });
              }).catchError(setError);
            },
          ),
          Divider(),
          ElevatedButton(
            child: Text("Confirm Payment Intent"),
            onPressed: () {
              StripePayment.confirmPaymentIntent(
                PaymentIntent(
                  clientSecret: _currentSecret,
                  paymentMethodId: _paymentMethod.id,
                ),
              ).then((paymentIntent) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        Text('Received ${paymentIntent.paymentIntentId}')));
                setState(() {
                  _paymentIntent = paymentIntent;
                });
              }).catchError(setError);
            },
          ),
          ElevatedButton(
            child: Text("Authenticate Payment Intent"),
            onPressed: () {
              StripePayment.authenticatePaymentIntent(
                      clientSecret: _currentSecret)
                  .then((paymentIntent) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        Text('Received ${paymentIntent.paymentIntentId}')));
                setState(() {
                  _paymentIntent = paymentIntent;
                });
              }).catchError(setError);
            },
          ),
          /*
          Divider(),
          Text('Current token:'),
          Text(
            JsonEncoder.withIndent('  ').convert(_paymentToken.toJson()),
            style: TextStyle(fontFamily: "Monospace"),
          ),
          Divider(),
          Text('Current payment method:'),
          Text(
            JsonEncoder.withIndent('  ').convert(_paymentMethod.toJson()),
            style: TextStyle(fontFamily: "Monospace"),
          ),
          Divider(),
          Text('Current payment intent:'),
          Text(
            JsonEncoder.withIndent('  ').convert(_paymentIntent.toJson()),
            style: TextStyle(fontFamily: "Monospace"),
          ),
          Divider(),
          Text('Current error: $_error'),*/
        ],
      ),
    );
  }
}
