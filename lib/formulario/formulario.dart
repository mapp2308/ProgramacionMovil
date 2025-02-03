import 'package:flutter_application/screens/screens.dart';

class Formulario extends StatelessWidget {
  const Formulario({super.key});

  @override
  Widget build(BuildContext context) {
    return const FormularioPantalla();
  }
}

class FormularioPantalla extends StatefulWidget {
  const FormularioPantalla({super.key});

  @override
  FormularioPantallaState createState() => FormularioPantallaState();
}

class FormularioPantallaState extends State<FormularioPantalla> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  final TextEditingController _edadController = TextEditingController();
  final TextEditingController _fechaController = TextEditingController();
  String? _generoSeleccionado;

  // Validación personalizada para texto (solo letras y vocales con tildes)
  String? _validarTexto(String? value, int minLength) {
    final regex =
        RegExp(r'^[A-ZÁÉÍÓÚÑ][a-záéíóúñ]+(?:\s[A-ZÁÉÍÓÚÑ][a-záéíóúñ]+)*$');
    if (value == null || value.isEmpty) {
      return "Este campo es obligatorio";
    } else if (value.length < minLength) {
      return "Debe tener al menos $minLength caracteres";
    } else if (!regex.hasMatch(value)) {
      return "Letras de la a-z, vocales con tildes y empezar con mayúsculas.";
    }
    return null;
  }

  String? _validarNumero(String? value) {
    if (value == null || value.isEmpty) {
      return "Este campo es obligatorio";
    } else if (int.tryParse(value) == null) {
      return "Debe ser un número válido";
    }
    return null;
  }

  void _seleccionarFecha(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _fechaController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  void _limpiarFormulario() {
    setState(() {
      _nombreController.clear();
      _apellidosController.clear();
      _edadController.clear();
      _fechaController.clear();
      _generoSeleccionado = null;
      _selectedDate = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulario Personalizado"),
      ),
      drawer: const CustomDrawer(), // Placeholder for CustomDrawer
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Campo Nombre
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: "Nombre",
                  border: OutlineInputBorder(),
                ),
                validator: (value) => _validarTexto(value, 3),
              ),
              const SizedBox(height: 16),

              // Campo Apellidos
              TextFormField(
                controller: _apellidosController,
                decoration: const InputDecoration(
                  labelText: "Apellidos",
                  border: OutlineInputBorder(),
                ),
                validator: (value) => _validarTexto(value, 3),
              ),
              const SizedBox(height: 16),

              // Campo Edad
              TextFormField(
                controller: _edadController,
                decoration: const InputDecoration(
                  labelText: "Edad",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) => _validarNumero(value),
              ),
              const SizedBox(height: 16),

              // Campo Género
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Género",
                  border: OutlineInputBorder(),
                ),
                value: _generoSeleccionado,
                items: const [
                  DropdownMenuItem(
                      value: "Masculino", child: Text("Masculino")),
                  DropdownMenuItem(value: "Femenino", child: Text("Femenino")),
                ],
                onChanged: (value) {
                  setState(() {
                    _generoSeleccionado = value;
                  });
                },
                validator: (value) =>
                    value == null ? "Seleccione un género" : null,
              ),
              const SizedBox(height: 16),

              // Campo Fecha
              TextFormField(
                controller: _fechaController,
                decoration: const InputDecoration(
                  labelText: "Fecha de Nacimiento",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                readOnly: true,
                onTap: () => _seleccionarFecha(context),
                validator: (value) => value == null || value.isEmpty
                    ? "Seleccione una fecha"
                    : null,
              ),
              const SizedBox(height: 16),

              // Botón de Enviar
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Formulario enviado con éxito")),
                    );
                    _limpiarFormulario(); // Limpiar los campos tras el envío
                  }
                },
                child: const Text("Enviar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
