class Teacher {
  final int id;
  final String name;
  final String avatarURL;
  final String graduate;
  final String bio;
  final String email;

  Teacher({
    required this.id,
    required this.name,
    required this.avatarURL,
    required this.graduate,
    required this.bio,
    required this.email,
  });

  // Factory constructor pour créer un Teacher depuis un JSON
  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: int.tryParse(json["id"]?.toString() ?? "0") ?? 0,
      name: json["name"] ?? "Nom inconnu",
      avatarURL: json["avatarURL"] ?? "",
      graduate: json["graduate"] ?? "Diplôme inconnu",
      bio: json["bio"] ?? "Aucune biographie disponible",
      email: json["email"] ?? "email inconnu",
    );
  }

  // Méthode pour gérer un enseignant par défaut si `teacher` est null
  factory Teacher.defaultTeacher() {
    return Teacher(
      id: 0,
      name: "Nom inconnu",
      avatarURL: "",
      graduate: "Diplôme inconnu",
      bio: "Aucune biographie disponible",
      email: "email inconnu",
    );
  }

  // Convertir un objet Teacher en JSON
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "avatarURL": avatarURL,
    "graduate": graduate,
    "bio": bio,
    "email": email,
  };
}
