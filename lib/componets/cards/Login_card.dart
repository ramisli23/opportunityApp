part of component;

class LoginCard extends StatefulWidget {
  const LoginCard({Key? key}) : super(key: key);

  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.grey.shade50],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo avec ombre
              Material(
                elevation: 6,
                borderRadius: BorderRadius.circular(20),
                shadowColor: Colors.blue.withOpacity(0.2),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/icons/png/Group.png',
                      height: 80,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),
              const Text(
                "EventHub",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // Carte de formulaire
              Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(20),
                shadowColor: Colors.black.withOpacity(0.1),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "Sign in",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Champ email
                      Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(12),
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.black54,
                            ),
                            hintText: "abc@email.com",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.all(16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Champ mot de passe
                      Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(12),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.black54,
                            ),
                            suffixIcon: const Icon(
                              Icons.visibility,
                              color: Colors.black54,
                            ),
                            hintText: "Your password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.all(16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Switch(
                                value: false,
                                onChanged: (bool value) {},
                                activeColor: Colors.blueAccent,
                              ),
                              const Text(
                                "Remember Me",
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.blue.shade700),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Bouton de connexion
                      Material(
                        elevation: 4,
                        borderRadius: BorderRadius.circular(12),
                        shadowColor: Colors.blue.withOpacity(0.3),
                        child: ElevatedButton(
                          onPressed: () => loginUser(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "SIGN IN",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),
              const Center(
                child: Text(
                  "OR",
                  style: TextStyle(
                    color: Colors.grey,
                    shadows: [Shadow(color: Colors.black12, blurRadius: 2)],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Bouton Google
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(12),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.g_mobiledata,
                    color: Colors.red,
                    size: 24,
                  ),
                  label: const Text("Login with Google"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Bouton Facebook
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(12),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.facebook,
                    color: Colors.blue,
                    size: 24,
                  ),
                  label: const Text("Login with Facebook"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupCard()),
                    );
                  },
                  child: Text(
                    "Don't have an account? Sign up",
                    style: TextStyle(
                      color: Colors.blue.shade700,
                      fontWeight: FontWeight.w500,
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

  Future<void> loginUser(BuildContext context) async {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      print('Veuillez entrer l\'email et le mot de passe.');
      return;
    }

    final Uri url = Uri.parse('http://192.168.102.39:5000/login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('Connexion réussie: $data');

        // Aller vers la home page
        Navigator.pushNamed(context, '/home');
      } else {
        print('Erreur de connexion: ${response.body}');
      }
    } catch (error) {
      print('Erreur lors de la requête: $error');
    }
  }
}
