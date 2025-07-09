part of component;

class OpportunityCard extends StatelessWidget {
  final Opportunity opportunity;
  final VoidCallback onTap;

  const OpportunityCard({
    Key? key,
    required this.opportunity,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: EdgeInsets.all(12),
        leading: CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Text(
            opportunity.type[0].toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          opportunity.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("${opportunity.company} - ${opportunity.location}"),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
