// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application/routes/app_routes.dart';


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
              Navigator.of(context).pushReplacementNamed(AppRoutes.nameScreen);
            },
          ),
          ListTile(
            title: const Text('Fotos en Fila',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.photosRow);
            },
          ),
          ListTile(
            title: const Text('Fotos en Columna',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.photosColumn);
            },
          ),
          ListTile(
            title: const Text('Iconos', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.iconsScreen);
            },
          ),
           ListTile(
            title:
                const Text('Columnas Anidadas', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.columnasAnidadas);
            },
          ),
          ListTile(
            title: const Text('Desafío Contenedores',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.desafios);
            },
          ),
          ListTile(
            title:
                const Text('Contador', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.contador);
            },
          ),
          ListTile(
            title:
                const Text('Instagram', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.instagram);
            },
          ),
            ListTile(
            title:
                const Text('Imagenes Aleatorias', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.imagenesAleatorias);
            },
            
          ),
              ListTile(
            title:
                const Text('Siete y Medio', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.sieteymedio);
            },
          ),
        ],
      ),
    );
  }
}
