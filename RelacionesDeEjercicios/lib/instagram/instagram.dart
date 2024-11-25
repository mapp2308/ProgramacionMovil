import 'package:flutter/material.dart';

class InstagramProfileApp extends StatelessWidget {
  const InstagramProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const InstagramProfilePage();
  }
}

class InstagramProfilePage extends StatefulWidget {
  const InstagramProfilePage({super.key});

  @override
  State<InstagramProfilePage> createState() => _InstagramProfilePageState();
}

class _InstagramProfilePageState extends State<InstagramProfilePage> {
  bool showAlternateImages = false;

  // Listas de imágenes
  final List<String> gridImages = [
    'assets/foto1.jpeg',
    'assets/foto2.jpeg',
    'assets/foto3.jpeg',
    'assets/foto4.jpeg',
    'assets/foto5.jpeg',
  ];

  final List<String> portraitImages = [
    'assets/imagen1.jpg',
    'assets/imagen2.jpg',
    'assets/imagen3.png',
    'assets/mora_paraiso-portada.jpg',
    'assets/mora_estrella-portada.jpg',
    'assets/microdosis.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "miguelperaza_",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      drawer: const Drawer(), // Placeholder for CustomDrawer
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Información del perfil
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/perfil.jpeg'),
                  ),
                  SizedBox(width: 110),
                  Column(
                    children: [
                      Text(
                        "5",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Publicaciones",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(width: 24),
                  Column(
                    children: [
                      Text(
                        "857",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Seguidores",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(width: 24),
                  Column(
                    children: [
                      Text(
                        "545",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Siguiendo",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "miguel peraza",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "📍 Malaga",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "@_perazaapriv",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),

            // Botón "Editar perfil"
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Editar perfil",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),

            // Sección de historias destacadas
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _circuloHistoria('assets/+.png', 'Nuevo'),
                    _circuloHistoria('assets/historia1.jpeg', '🌍'),
                    _circuloHistoria('assets/historia2.jpeg', ':):'),
                    _circuloHistoria('assets/historia3.jpeg', 'Fr'),
                  ],
                ),
              ),
            ),

            const Divider(color: Colors.grey),

            // Opciones de vista
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.grid_on, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        showAlternateImages = false;
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.portrait, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        showAlternateImages = true;
                      });
                    },
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.grey),

            // Publicaciones
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
              ),
              itemCount: showAlternateImages
                  ? portraitImages.length
                  : gridImages.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(showAlternateImages
                          ? portraitImages[index]
                          : gridImages[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  // Método para construir el círculo de historias destacadas
  Widget _circuloHistoria(String imagePath, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
