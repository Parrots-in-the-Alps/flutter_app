import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vulcan_mobile_app/check_in/_screens/booking_details.dart';
import 'package:vulcan_mobile_app/providers/reservation_provider.dart';
import 'package:vulcan_mobile_app/utils/vulcan_app_bar.dart';

class QRCode extends StatefulWidget {
  const QRCode({super.key});

  @override
  State<QRCode> createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        controller.pauseCamera();
        Provider.of<ReservationProvider>(context, listen: false).reservationId =
            scanData.code!;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BookingDetails(),
          ),
        );
        controller.resumeCamera();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const VulcanAppBar(title: "Scan Qr Code"),
        body: Center(
            child: Expanded(
                flex: 4,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ))));
  }
}
