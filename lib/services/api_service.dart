import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<Map<String, dynamic>>> fetchOpportunities() async {
    final url = Uri.parse('https://example.com/api/opportunities'); // Remplacez par votre URL Firebase
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(json.decode(response.body));
      } else {
        throw Exception('Échec du chargement des opportunités');
      }
    } catch (e) {
      throw Exception('Erreur: $e');
    }
  }
}

