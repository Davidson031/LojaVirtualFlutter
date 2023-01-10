import 'package:clipboard/clipboard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:quitanda_virtual/src/services/utils_services.dart';

import '../../models/order_model.dart';

class PaymentDialog extends StatelessWidget {
  final OrderModel order;
  final UtilsServices utils = UtilsServices();

  PaymentDialog({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 9),
                  child: Text(
                    "Pagamento com Pix",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Image.memory(
                  utils.decodeQrCodeImage(order.qrCodeImage),
                  height: 200,
                  width: 200,
                ),
                
                Text(
                  "Vencimento: ${utils.formatDateTime(order.overdueDateTime)}",
                  style: const TextStyle(fontSize: 12),
                ),
                Text(
                  "Total: ${utils.priceToCurrency(order.total)}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    FlutterClipboard.copy(order.copyAndPaste);
                    utils.showToast(message: "Código copiado");
                  },
                  icon: const Icon(
                    Icons.copy,
                    size: 15,
                  ),
                  label: const Text(
                    "Copiar código Pix",
                    style: TextStyle(fontSize: 13),
                  ),
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(width: 2, color: Colors.green),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                )
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
          )
        ],
      ),
    );
  }
}
