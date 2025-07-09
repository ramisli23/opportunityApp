import 'package:flutter/material.dart';
import 'package:opportunity1/componets/cards/payment2_card.dart';

class PaymentScreen extends StatefulWidget {
  final String orderId;
  final String tripName;
  final String tripDate;
  final double totalAmount;

  const PaymentScreen({
    super.key,
    required this.orderId,
    required this.tripName,
    required this.tripDate,
    required this.totalAmount,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with SingleTickerProviderStateMixin {
  int _selectedPaymentMethod = 1;
  bool _useVoucher = true;
  bool _usePoints = false;
  final _timerDuration = const Duration(minutes: 30);
  DateTime _expiryTime = DateTime.now().add(const Duration(minutes: 30));
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _startTimer();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(
          () => _expiryTime = _expiryTime.subtract(const Duration(seconds: 1)),
        );
        if (_expiryTime.isAfter(DateTime.now())) _startTimer();
      }
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return '${twoDigits(duration.inHours)} : ${twoDigits(duration.inMinutes.remainder(60))} : ${twoDigits(duration.inSeconds.remainder(60))}';
  }

  @override
  Widget build(BuildContext context) {
    final remainingTime = _expiryTime.difference(DateTime.now());
    final pointsEarned = (widget.totalAmount * 15).toInt();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Continue payment'),
        centerTitle: true,
        elevation: 4,
        shadowColor: Colors.blue.withOpacity(0.1),
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Order info with slide animation
              SlideInAnimation(
                delay: 0,
                child: Text(
                  'Order ID: ${widget.orderId}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),

              // Progress indicator with scale animation
              ScaleAnimation(
                delay: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStep(1, 'Payment Method', true),
                    _buildStep(2, 'Pay', false),
                    _buildStep(3, 'Done', false),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Timer card with shadow
              SlideInAnimation(
                delay: 200,
                child: Card(
                  elevation: 4,
                  shadowColor: Colors.blue.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Pay soon', style: TextStyle(fontSize: 16)),
                        Text(
                          _formatDuration(remainingTime),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Trip info with fade animation
              FadeAnimation(
                delay: 300,
                child: Card(
                  elevation: 4,
                  shadowColor: Colors.blue.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.tripName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(widget.tripDate),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Payment methods section
              const Text(
                'Payment Method',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              // Animated payment method tiles
              Column(
                children: [
                  _buildAnimatedPaymentMethodTile(
                    0,
                    'GOPAY',
                    '7 8001 0821 4748 4998',
                    Icons.account_balance_wallet,
                    delay: 400,
                  ),
                  _buildAnimatedPaymentMethodTile(
                    1,
                    'Paypal',
                    'paypal@example.com',
                    Icons.payment,
                    delay: 500,
                  ),
                  _buildAnimatedPaymentMethodTile(
                    2,
                    'Credit Card',
                    '**** **** **** 1234',
                    Icons.credit_card,
                    delay: 600,
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Voucher section with animation
              SlideInAnimation(
                delay: 700,
                child: const Text(
                  'Use the voucher',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),

              FadeAnimation(
                delay: 800,
                child: CheckboxListTile(
                  title: const Text('Use voucher'),
                  value: _useVoucher,
                  onChanged:
                      (value) => setState(() => _useVoucher = value ?? false),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
              const SizedBox(height: 8),

              SlideInAnimation(
                delay: 900,
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter code...',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Points section with animation
              FadeAnimation(
                delay: 1000,
                child: CheckboxListTile(
                  title: Text('Use your points (Available: 6000)'),
                  value: _usePoints,
                  onChanged:
                      (value) => setState(() => _usePoints = value ?? false),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
              const SizedBox(height: 24),

              // Summary card with scale animation
              ScaleAnimation(
                delay: 1100,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Payment Total'),
                            Text(
                              '\$${widget.totalAmount.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Will get +$pointsEarned points',
                          style: TextStyle(color: Colors.green[700]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Pay Now button with bounce animation
              BounceAnimation(
                delay: 1200,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 500),
                          pageBuilder:
                              (_, __, ___) => PaymentMethod2Screen(
                                orderId: widget.orderId,
                                tripName: widget.tripName,
                                tripDate: widget.tripDate,
                                amount: widget.totalAmount,
                              ),
                          transitionsBuilder: (_, animation, __, child) {
                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(1, 0),
                                end: Offset.zero,
                              ).animate(animation),
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.blue,
                      elevation: 6,
                      shadowColor: Colors.blue.withOpacity(0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Pay Now',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
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
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow:
                isActive
                    ? [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ]
                    : null,
          ),
          child: CircleAvatar(
            radius: 16,
            backgroundColor: isActive ? Colors.blue : Colors.grey,
            child: Text(
              number.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 4),
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

  Widget _buildAnimatedPaymentMethodTile(
    int index,
    String title,
    String details,
    IconData icon, {
    required int delay,
  }) {
    return SlideInAnimation(
      delay: delay,
      child: Card(
        margin: const EdgeInsets.only(bottom: 8),
        elevation: 2,
        shadowColor: Colors.grey.withOpacity(0.2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: RadioListTile<int>(
          title: Row(
            children: [
              Icon(icon, size: 24, color: Colors.blue),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    details,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          value: index,
          groupValue: _selectedPaymentMethod,
          onChanged:
              (value) => setState(() => _selectedPaymentMethod = value ?? 0),
          secondary: const Icon(Icons.chevron_right, color: Colors.grey),
          controlAffinity: ListTileControlAffinity.trailing,
          activeColor: Colors.blue,
        ),
      ),
    );
  }
}

// Animation Classes
class FadeAnimation extends StatelessWidget {
  final int delay;
  final Widget child;

  const FadeAnimation({super.key, required this.delay, required this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: 500 + delay),
      curve: Curves.easeInOut,
      builder: (context, double value, child) {
        return Opacity(opacity: value, child: child);
      },
      child: child,
    );
  }
}

class SlideInAnimation extends StatelessWidget {
  final int delay;
  final Widget child;

  const SlideInAnimation({super.key, required this.delay, required this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<Offset>(begin: const Offset(-0.5, 0), end: Offset.zero),
      duration: Duration(milliseconds: 500 + delay),
      curve: Curves.easeOutQuint,
      builder: (context, Offset value, child) {
        return Transform.translate(offset: value, child: child);
      },
      child: child,
    );
  }
}

class ScaleAnimation extends StatelessWidget {
  final int delay;
  final Widget child;

  const ScaleAnimation({super.key, required this.delay, required this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.95, end: 1),
      duration: Duration(milliseconds: 500 + delay),
      curve: Curves.easeOutBack,
      builder: (context, double value, child) {
        return Transform.scale(scale: value, child: child);
      },
      child: child,
    );
  }
}

class BounceAnimation extends StatelessWidget {
  final int delay;
  final Widget child;

  const BounceAnimation({super.key, required this.delay, required this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.9, end: 1),
      duration: Duration(milliseconds: 500 + delay),
      curve: Curves.elasticOut,
      builder: (context, double value, child) {
        return Transform.scale(scale: value, child: child);
      },
      child: child,
    );
  }
}
