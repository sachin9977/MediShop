import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pay/pay.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text('Payment', style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        children:  [
          const ListTile(
            leading: Icon(Icons.payment),
            title: Text("GPay"),
          ),
          GooglePayButton(
          paymentConfigurationAsset: 'gpay.json',
          paymentItems:  const [
            PaymentItem(
              label: 'Total',
              amount: '10.00',
              status: PaymentItemStatus.final_price,
            )
          ],
          type: GooglePayButtonType.pay,
          margin: const EdgeInsets.only(top: 15.0),
          onPaymentResult: (result) {
            print(result.toString());
          },
          loadingIndicator: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        ],
      ),
    );
  }
}
