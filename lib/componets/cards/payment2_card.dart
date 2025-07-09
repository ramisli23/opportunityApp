import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PaymentMethod2Screen extends StatefulWidget {
  final String orderId;
  final String tripName;
  final String tripDate;
  final double amount;

  const PaymentMethod2Screen({
    super.key,

    required this.orderId,
    required this.tripName,
    required this.tripDate,
    required this.amount,
  });

  @override
  _PaymentMethod2ScreenState createState() => _PaymentMethod2ScreenState();
}

class _PaymentMethod2ScreenState extends State<PaymentMethod2Screen>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Ferme automatiquement le dialogue après l'animation
        Navigator.of(context).pop();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Continue payment'),
        centerTitle: true,
        elevation: 4, // Ombre pour l'appbar
        shadowColor: Colors.blue.withOpacity(0.2),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Animation de fondu pour l'ordre ID
            FadeIn(
              delay: 0.1,
              child: Text(
                'Order ID: ${widget.orderId}',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),

            // Progress Steps avec animation
            SlideIn(
              delay: 0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStep(1, 'Payment Method', false),
                  _buildStep(2, 'Pay', true),
                  _buildStep(3, 'Done', false),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Divider avec ombre
            Container(
              height: 1,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 2,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: const Divider(),
            ),
            const SizedBox(height: 20),

            // Carte de détails de paiement avec ombre et animation
            ScaleIn(
              delay: 0.3,
              child: Card(
                elevation: 4,
                shadowColor: Colors.blue.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Text(
                        'Transfer to',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Option GOPAY avec effet de profondeur
                      PhysicalModel(
                        color: Colors.transparent,
                        elevation: 2,
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.1),
                                blurRadius: 6,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: ListTile(
                            leading: const Icon(
                              Icons.account_balance_wallet,
                              size: 30,
                              color: Colors.blue,
                            ),
                            title: const Text(
                              'GOPAY',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: const Text('7 8001 0821 4748 4998'),
                            trailing: Radio<int>(
                              value: 0,
                              groupValue: 0,
                              onChanged: (value) {},
                              fillColor: MaterialStateProperty.all(Colors.blue),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Total avec animation
            FadeIn(
              delay: 0.4,
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Payment Total',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '\$${widget.amount.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Points avec animation et ombre
            ScaleIn(
              delay: 0.5,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        '\$${widget.amount.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Will get +${(widget.amount * 15).toInt()} points',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Bouton avec animation et effet de profondeur
            ScaleIn(
              delay: 0.6,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ShowDoneDialog(); // Call ShowDoneDialog here
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blue,
                    elevation: 4,
                    shadowColor: Colors.blue.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Confirm Payment',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void ShowDoneDialog() {
    controller.forward(from: 0.0);
    showDialog(
      barrierDismissible: false,
      context: context,
      builder:
          (context) => Dialog(
            insetPadding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Lottie.asset(
                      "assets/Animation.json",
                      controller: controller,
                      onLoaded: (composition) {
                        controller.duration = composition.duration;
                        controller.forward(from: 0.0);
                      },
                      repeat: false,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Good luck',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pop(); // Ferme le dialog manuellement
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        'Fermer',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }

  Widget _buildStep(int number, String title, bool isActive) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow:
                isActive
                    ? [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
                        blurRadius: 6,
                        spreadRadius: 2,
                      ),
                    ]
                    : null,
          ),
          child: CircleAvatar(
            radius: 14,
            backgroundColor: isActive ? Colors.blue : Colors.grey[300],
            child: Text(
              number.toString(),
              style: TextStyle(
                color: isActive ? Colors.white : Colors.grey[700],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.blue : Colors.grey,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

// FadeIn Animation
class FadeIn extends StatelessWidget {
  final Widget child;
  final double delay;

  const FadeIn({super.key, required this.child, this.delay = 0.0});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: Duration(seconds: 1),
      curve: Curves.easeIn,
      child: child,
    );
  }
}

// SlideIn Animation
class SlideIn extends StatelessWidget {
  final Widget child;
  final double delay;

  const SlideIn({super.key, required this.child, this.delay = 0.0});

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      offset: Offset(0.0, 0.0),
      duration: Duration(seconds: 1),
      curve: Curves.easeIn,
      child: child,
    );
  }
}

// ScaleIn Animation
class ScaleIn extends StatelessWidget {
  final Widget child;
  final double delay;

  const ScaleIn({super.key, required this.child, this.delay = 0.0});

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: 1.0,
      duration: Duration(seconds: 1),
      curve: Curves.easeIn,
      child: child,
    );
  }
}
