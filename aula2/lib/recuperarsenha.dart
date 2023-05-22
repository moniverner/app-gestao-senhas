import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
 const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class recuperarsenha extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Recuperar senha'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back) ,
            color: Colors.black38,
            onPressed: () => Navigator.pop(context, false),
            ),
        ),
        body: _Body(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black,
          onPressed:() {} ,
          child: Icon(Icons.email),
          ),
      ),
    );
  }
}

class _Body extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.only(top: 60, left: 40, right: 40),
      child: ListView(
        children: [SizedBox(), textoMaior(), textoMenor(), firldEmail()],
      ),
    );
  }
}

Widget textoMaior(){
  return Text(
    'Esqueceu sua senha?',
    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
    textAlign: TextAlign.center,
  );
}

Widget textoMenor(){
  return Text(
    'Informe seu e-mail associado a sua conta para recuperar a sua senha',
    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    textAlign: TextAlign.center,
  );
}

Widget firldEmail(){
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    decoration: 
            InputDecoration(border: OutlineInputBorder(), labelText: 'E-mail') );
}

Widget sizedBox() {
  return SizedBox(
    width: 200,
    height: 200,
    child: Image.network(
      "https://cdn.pixabay.com/photo/2019/10/06/11/40/lock-4529981_960_720.png"),
  );
}
