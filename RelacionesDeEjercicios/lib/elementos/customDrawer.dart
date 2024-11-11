// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application/contador/contador_screen.dart';
import '../ejercicio1/screens/icons_screen.dart';
import '../ejercicio1/screens/photos_row_screen.dart';
import '../ejercicio1/screens/photos_column_screen.dart';
import '../ejercicio1/screens/name_screen.dart';
import '../instagram/instagram.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF3b605f), // Color del fondo del header del drawer
            ),
            child: Text(
              'Menú de Navegación',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Nombre y Apellidos',
                style: TextStyle(color: Colors.white)),
    
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NameScreen()));
            },
          ),
          ListTile(
            title: const Text('Fotos en Fila',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PhotosRowScreen()));
            },
          ),
          ListTile(
            title: const Text('Fotos en Columna',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PhotosColumnScreen()));
            },
          ),
          ListTile(
            title: const Text('Iconos', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const IconsScreen()));
            },
          ),
          ListTile(
            title:
                const Text('Instagram', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InstagramProfileApp()));
            },
          ),
          ListTile(
            title:
                const Text('Contador', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ContadorApp()));
            },
          ),
        ],
      ),
    );
  }
}
