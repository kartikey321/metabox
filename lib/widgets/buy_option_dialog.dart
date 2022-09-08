import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay/pay.dart';
import 'package:url_launcher/url_launcher.dart';

const _paymentItems = [
  PaymentItem(
    label: 'Total',
    amount: '99.99',
    status: PaymentItemStatus.final_price,
  )
];

class BuyOption extends StatelessWidget {
  const BuyOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: Colors.white,
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Select your preferred payment method',
                style: GoogleFonts.montserrat(
                    fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 200,
                    padding: EdgeInsets.all(8),
                    child: GooglePayButton(
                      paymentConfigurationAsset: 'gpay.json',
                      paymentItems: _paymentItems,
                      style: GooglePayButtonStyle.black,
                      type: GooglePayButtonType.pay,
                      margin: const EdgeInsets.only(top: 15.0),
                      onPaymentResult: (p) {
                        print(p);
                      },
                      loadingIndicator: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      const url = 'https://metabox.vercel.app/';
                      if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url));
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Container(
                        width: 180,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(color: Colors.green),
                        child: Center(
                          child: Text(
                            'Pay with NFT',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
