import 'package:flutter/material.dart';

void main() {
  runApp(const InstagramProfileApp());
}

class InstagramProfileApp extends StatelessWidget {
  const InstagramProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const InstagramProfilePage(),
    );
  }
}

class InstagramProfilePage extends StatelessWidget {
  const InstagramProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("miguelperaza_", style: TextStyle(fontSize: 20, color: Colors.white)),
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {},),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
          
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/perfil.jpeg'), // Imagen del perfil
                  ),
                  
                  SizedBox(width: 110), // <--- Añadimos este espacio entre la foto y la info de cuenta
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
                  SizedBox(width: 24), // Ajustamos los espacios entre las columnas de estadísticas
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                ],
              ),
            ),
            const Divider(color: Colors.grey),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.grid_on, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.video_library, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.portrait, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.grey),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemCount: 6, // Número de publicaciones
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/foto${index + 1}.jpeg'), // Imagenes de ejemplo
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
}
