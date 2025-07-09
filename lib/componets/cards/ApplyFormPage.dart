part of component;

class ApplyFormPage extends StatelessWidget {
  static const routeName = "/apply_form";

  const ApplyFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Application Form")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Full Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "Email Address",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // ici tu vas intégrer le sélecteur de fichier
              },
              icon: const Icon(Icons.upload_file),
              label: const Text("Upload Document"),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Envoyer les données (à toi d'ajouter la logique)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Form submitted!")),
                );
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
