part of component;

class HomeOppurtuntyCard extends StatelessWidget {
  static const String routeName = "/home_opportunity";
  final String imageUrl;
  final dynamic item;

  const HomeOppurtuntyCard({
    Key? key,
    required this.imageUrl,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Image avec ombre
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(imageUrl, fit: BoxFit.cover),
                  ),
                ),
              ),
              Positioned(
                left: 18,
                top: 20,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back, color: Colors.white, size: 24),
                      SizedBox(width: 4),
                      Text(
                        "Event Details",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Contenu avec ombres
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),

                    // Première ligne avec ombre
                    Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: context.theme.primaryColor.withOpacity(
                                  0.1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                "assets/icons/png/calendar (2).png",
                                color: Color(0xFF529BFA),
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              item.countExercises,
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // Deuxième ligne avec ombre
                    Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: context.theme.primaryColor.withOpacity(
                                  0.1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                "assets/icons/png/location (1).png",
                                color: Color(0xFF529BFA),
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              item.videoDuration,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 30),

                    // About Event Section
                    _buildSectionCard(
                      title: "About Event",
                      content:
                          "Enjoy your favorite dish and a lovely time with your friends and family. "
                          "Food from local food trucks will be available for purchase.",
                    ),

                    SizedBox(height: 20),

                    // Conditions Section with Bullet Points
                    _buildSectionCard(
                      title: "Conditions",
                      children: [
                        _buildBulletPoint(
                          "Minimum age requirement (typically 18+)",
                        ),
                        _buildBulletPoint(
                          "Relevant skills/experience for the opportunity",
                        ),
                        _buildBulletPoint(
                          "Geographic restrictions (if applicable)",
                        ),
                        _buildBulletPoint(
                          "Compliance with event/organization rules",
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Account Requirements:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        _buildBulletPoint("Valid user account on the platform"),
                        _buildBulletPoint(
                          "Verified email address/phone number",
                        ),
                        _buildBulletPoint("Completed user profile"),
                      ],
                    ),

                    SizedBox(height: 20),

                    // Documents Section with Bullet Points
                    _buildSectionCard(
                      title: "Documents Required",
                      children: [
                        Text(
                          "Personal Identification:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        _buildBulletPoint(
                          "Government-issued ID (Passport, Driver's License)",
                        ),
                        _buildBulletPoint("Student ID (for student discounts)"),
                        SizedBox(height: 10),
                        Text(
                          "Contact Information:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        _buildBulletPoint("Verified email address"),
                        _buildBulletPoint("Phone number"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Apply Button
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ApplyFormPage(),
                  ),
                );
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 44, 172, 76),
                shape: StadiumBorder(),
                elevation: 8,
                shadowColor: Colors.green.withOpacity(0.4),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                "Apply",

                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    String? content,
    List<Widget>? children,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            if (content != null)
              Text(content, style: TextStyle(color: Colors.grey)),
            if (children != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("• ", style: TextStyle(fontSize: 16)),
          Expanded(child: Text(text, style: TextStyle(color: Colors.grey))),
        ],
      ),
    );
  }
}
