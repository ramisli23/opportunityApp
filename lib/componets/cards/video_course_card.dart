part of component;

class OrderHistoryCard extends StatelessWidget {
  final OrderHistoryItem item;
  final VoidCallback onOrderAgainPressed;

  const OrderHistoryCard({
    super.key,
    required this.item,
    required this.onOrderAgainPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.tripType,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[700],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Done',
                        style: TextStyle(
                          color: Colors.green[800],
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  item.date,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 16),
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 16,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      item.span,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const Spacer(),
                    Text(
                      item.price,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: OutlinedButton(
                    onPressed: onOrderAgainPressed,
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.blue[700]!),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Order Again',
                      style: TextStyle(color: Colors.blue[700]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// You'll also need this model class:
class OrderHistoryItem {
  final String tripType; // "Open Trip" or "Private Trip"
  final String date;
  final String title;
  final String span;
  final String price;
  final bool isDone;

  OrderHistoryItem({
    required this.tripType,
    required this.date,
    required this.title,
    required this.span,
    required this.price,
    this.isDone = true,
  });
}
