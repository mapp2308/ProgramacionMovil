import '../screens/screens.dart';

class FormApp extends StatelessWidget {
  const FormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const FormScreen();
  }
}

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  FormScreenState createState() => FormScreenState();
}

class FormScreenState extends State<FormScreen> {
  // Estado del Switch
  bool isLeft = true;

  // Controladores y variables para el formulario izquierdo
  final _formLeftKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  bool hasChildren = false;
  int numOfChildren = 1; // Cambiado: Default ahora es 1
  List<TextEditingController> childrenAges =
      List.generate(3, (_) => TextEditingController());

  // Controladores y variables para el formulario derecho

  final _formRightKey = GlobalKey<FormState>();
  DateTime? birthDate;
  String? selectedCity;
  Map<String, bool> hobbies = {
    "Leer": false,
    "Deportes": false,
    "Viajar": false,
    "Música": false,
    "Cocinar": false,
  };
  String? selectedGender;

  // Ciudades de Andalucía
  final List<String> cities = [
    "Sevilla",
    "Granada",
    "Córdoba",
    "Málaga",
    "Almería",
    "Cádiz",
    "Huelva",
    "Jaén",
  ];

  // Métodos de validación
  String? validateName(String? value) {
    if (value == null || value.isEmpty) return 'Ingrese su nombre completo';
    if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
      return 'Solo letras y espacios';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Ingrese su correo electrónico';
    if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(value)) {
      return 'Correo no válido';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) return 'Ingrese su número de teléfono';
    if (!RegExp(r"^\d{9}$").hasMatch(value)) {
      return 'Teléfono no válido (9 dígitos)';
    }
    return null;
  }

  String? validateAge(String? value) {
    if (value == null || value.isEmpty) return null;
    if (!RegExp(r"^\d{1,2}$").hasMatch(value) || int.parse(value) > 99) {
      return 'Edad no válida';
    }
    return null;
  }

  // Formulario izquierdo
  Widget buildLeftForm() {
    return Form(
      key: _formLeftKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Nombre completo'),
            validator: validateName,
          ),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Correo electrónico'),
            validator: validateEmail,
          ),
          TextFormField(
            controller: phoneController,
            decoration: const InputDecoration(labelText: 'Teléfono'),
            keyboardType: TextInputType.phone,
            validator: validatePhone,
          ),
          CheckboxListTile(
            title: const Text('¿Tiene hijos?'),
            value: hasChildren,
            onChanged: (value) {
              setState(() {
                hasChildren = value ?? false;
              });
            },
          ),
          if (hasChildren)
            Column(
              children: [
                DropdownButtonFormField<int>(
                  value: numOfChildren,
                  items: [1, 2, 3] // Cambiado: Solo permite valores 1, 2, 3
                      .map((e) =>
                          DropdownMenuItem(value: e, child: Text('$e hijos')))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      numOfChildren =
                          value ?? 1; // Cambiado: Default ahora es 1
                    });
                  },
                  decoration:
                      const InputDecoration(labelText: 'Cantidad de hijos'),
                ),
                for (int i = 0; i < numOfChildren; i++)
                  TextFormField(
                    controller: childrenAges[i],
                    decoration:
                        InputDecoration(labelText: 'Edad del hijo ${i + 1}'),
                    keyboardType: TextInputType.number,
                    validator: validateAge,
                  ),
              ],
            ),
        ],
      ),
    );
  }

  // Formulario derecho
  Widget buildRightForm() {
    return Form(
      key: _formRightKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Fecha de nacimiento'),
            readOnly: true,
            controller: TextEditingController(
                text: birthDate != null
                    ? "${birthDate!.toLocal()}".split(' ')[0]
                    : ''),
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (pickedDate != null) {
                setState(() {
                  birthDate = pickedDate;
                });
              }
            },
            validator: (value) {
              if (birthDate == null) return 'Seleccione una fecha';
              return null;
            },
          ),
          DropdownButtonFormField<String>(
            value: selectedCity,
            items: cities
                .map((city) => DropdownMenuItem(value: city, child: Text(city)))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedCity = value;
              });
            },
            decoration: const InputDecoration(labelText: 'Ciudad de Andalucía'),
            validator: (value) =>
                value == null ? 'Seleccione una ciudad' : null,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: hobbies.keys.map((hobby) {
              return CheckboxListTile(
                title: Text(hobby),
                value: hobbies[hobby],
                onChanged: (value) {
                  setState(() {
                    hobbies[hobby] = value ?? false;
                  });
                },
              );
            }).toList(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Sexo:'),
              RadioListTile<String>(
                title: const Text('Hombre'),
                value: 'Hombre',
                groupValue: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Mujer'),
                value: 'Mujer',
                groupValue: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Prefiero no contestar'),
                value: 'Prefiero no contestar',
                groupValue: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario Dinámico'),
      ),
      drawer: const CustomDrawer(), // Placeholder for CustomDrawer
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Izquierda'),
                Switch(
                  value: !isLeft,
                  onChanged: (value) {
                    setState(() {
                      isLeft = !value;
                    });
                  },
                ),
                const Text('Derecha'),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: isLeft ? buildLeftForm() : buildRightForm(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (isLeft) {
                  if (_formLeftKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Formulario izquierdo válido')));
                  }
                } else {
                  if (_formRightKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Formulario derecho válido')));
                  }
                }
              },
              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
