import 'package:flutter/material.dart';
import 'Data/perfil_Entity.dart';
import 'Data/perfil_sqlite_datasource.dart';

class cadusuario extends StatelessWidget {
  const cadusuario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Perfil do usuário',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _nome = '';
  String _email = '';
  String _senha = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do usuário'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black38,
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(children: [
            Center(
              child: ElevatedButton(
                onPressed: null, //print('_openImagePicker'),
                child: const Text('Selecione a imagem'),
              ),
            ),
            const SizedBox(height: 35),
            
            const SizedBox(height: 35),
            nome(),
            const SizedBox(height: 35),
            email(),
            const SizedBox(height: 35),
            senha(),
            const SizedBox(height: 35),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
        onPressed: () {
          perfilSQLiteDatasource().inserirPerfil(_nome,
              _email, _senha);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  TextFormField email() {
    return TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'O campo e-mail é obrigatório';
          }
        },
        onChanged: (value) => setState(() {
              _email = value;
            }),
        keyboardType: TextInputType.emailAddress,
        decoration:
            InputDecoration(border: OutlineInputBorder(), labelText: 'E-mail'));
  }

  TextFormField nome() {
    return TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'O campo nome é obrigatório';
          }
        },
        onChanged: (value) => setState(() {
              _nome = value;
            }),
        keyboardType: TextInputType.emailAddress,
        decoration:
            InputDecoration(border: OutlineInputBorder(), labelText: 'Nome'));
  }

  TextFormField senha() {
    return TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'O campo senha é obrigatório';
          }
          if (value.length < 4) {
            return 'O campo senha não pode ser menor que 4 digitos';
          }
        },
        onChanged: (value) => setState(() {
              _senha = value;
            }),
        keyboardType: TextInputType.emailAddress,
        decoration:
            InputDecoration(border: OutlineInputBorder(), labelText: 'Senha'));
  }
}

