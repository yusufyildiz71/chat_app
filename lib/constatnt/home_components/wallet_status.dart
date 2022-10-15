import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

class WalletWidget extends StatelessWidget {
  final int minute;
  final Widget rightSide;

  WalletWidget(this.minute, {required this.rightSide});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          print("BASILDI");
           CoolAlert.show(
          context: context,
          type: CoolAlertType.confirm,
          text: 'Buy Minute!',
          title: ""
          
        );
        },
        child: Container(
          
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
            const BoxShadow(
              color: Colors.red,
              blurRadius: 20.0,
              offset: Offset(2.0, 2.0),
            ),
          ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Text("Minute "+
                  this.minute.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                margin: EdgeInsets.only(left: 20.0),
                height: 54.0,
              ),
              (this.rightSide != null) ? this.rightSide : Container()
            ],
          ),
        ),
      ),
    );
  }
}
