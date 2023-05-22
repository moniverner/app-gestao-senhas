import 'package:aula2/cadusuario.dart';
import 'package:aula2/recuperarsenha.dart';
import 'package:flutter/material.dart';
import 'package:aula2/tela1.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: _Login(),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  String email='';
  String pass='';

@override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
       children: <Widget>[
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: const Text(
              'Tela de Login app',
              style: TextStyle(
color: Colors.blue,
fontWeight: FontWeight.w500,
fontSize: 30),
          )),
    Container(
alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: const Text(
      'Digite os dados',
      style: TextStyle(fontSize: 20),
      )),
    Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'e-mail',
            ),
          ),
        ),
      Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: TextField(
          obscureText: true,
          decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Senha',
        ),
      ),
    ),
    TextButton(
      onPressed: () {
        print('Esqueci a senha');
         Navigator.push(context, MaterialPageRoute(builder: (context){
          return recuperarsenha();
        }
        )
        );
      },
      child: const Text('Esqueci a senha'),
      
    ),
    Container(
      height: 50,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: ElevatedButton(
      child: const Text('Login'),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return tela1();
        }
        )
        );
      },
    )
  ),
    Row(
      children: <Widget>[
        const Text('Não possui conta?'),
        TextButton(
          child: const Text(
            'Cadastre aqui',
            style: TextStyle(fontSize: 20),
        ),
        onPressed: () {
          print('Cadastro aqui');
           Navigator.push(context, MaterialPageRoute(builder: (context){
          return cadusuario();
        }
        )
        );
        },
      )
    ],
    mainAxisAlignment: MainAxisAlignment.center,
),
],
));
}
}



class perfilUsuario extends StatelessWidget {
  const perfilUsuario({Key? key}) : super(key: key);

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
  File? _image;
  final _picker = ImagePicker();

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Perfil do usuário'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: Column(children: [
              Center(
                child: ElevatedButton(
                  onPressed: _openImagePicker,
                  child: const Text('Selecione a imagem'),
                ),
              ),
              const SizedBox(height: 35),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 300,
                color: Colors.grey[300],
                child: _image != null
                    ? Image.file(_image!, fit: BoxFit.cover)
                    : const Text('Por favor selecione a imagem'),
              ),
              const SizedBox(height: 35),
              fieldNome(),
              const SizedBox(height: 35),
              fieldEmail(),
              const SizedBox(height: 35),
              fieldSenha(),
            ]),
          ),
        ));
  }
}

Widget fieldEmail() {
  return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: 'E-mail'));
}

Widget fieldSenha() {
  return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: 'Senha'));
}

Widget fieldNome() {
  return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: 'Nome'));
}

