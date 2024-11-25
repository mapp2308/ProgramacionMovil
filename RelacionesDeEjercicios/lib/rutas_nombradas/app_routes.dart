import 'screens.dart';

class AppRoutes {
  // Definir nombres claros para las rutas
  static const String home = '/home';
  static const String columnasAnidadas = '/columnas-anidadas';
  static const String contador = '/contador';
  static const String imagenesAleatorias = '/imagenes-aleatorias';
  static const String iconsScreen = '/icons';
  static const String photosRow = '/photos-row';
  static const String photosColumn = '/photos-column';
  static const String nameScreen = '/name';
  static const String instagram = '/instagram';

  // Mapa de rutas nombradas con sus respectivas pantallas
  static final Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(),
    columnasAnidadas: (context) => const ColumnasAnidadas(),
    contador: (context) => const ContadorApp(),
    imagenesAleatorias: (context) => const ImagenesAleatorias(),
    iconsScreen: (context) => const IconsScreen(),
    photosRow: (context) => const PhotosRowScreen(),
    photosColumn: (context) => const PhotosColumnScreen(),
    nameScreen: (context) => const NameScreen(),
    instagram: (context) => const InstagramProfileApp(),
  
  };
}