 import 'package:flutter/material.dart';

import 'cadcartao.dart';
import 'cadsenhas.dart';
import 'geradorsenha.dart';
import 'listasenhas.dart';
import 'listaCartao.dart';
import 'cadusuario.dart';
import 'perfilUsuario.dart';
 
  class tela1 extends StatelessWidget{
      Widget build(BuildContext context){
          return MaterialApp(
            home: Scaffold(
              drawer: Drawer(
          child: ListView(
            children: [
                UserAccountsDrawerHeader(
                accountName: Text("Sou Eu"), 
                accountEmail: Text ("Sou eu@gmail.com"),  
                currentAccountPicture: CircleAvatar( 
                  radius: 30.0,
                  backgroundImage: 
                    NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png'),
                    backgroundColor: Colors.transparent,
                ),
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text("Favoritos"),
                subtitle: Text("meus favoritos..."),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  debugPrint('toquei no drawer');
                } ),
                ListTile( 
                  leading: Icon(Icons.account_circle),
                  title: Text("Perfil"),
                  subtitle: Text("Perfil do usuario..."),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                     Navigator.push(context,
                      MaterialPageRoute(builder: (context){
                        return PerfilUsuario();
                      }));

                    
                  }),
                  ListTile(
                    leading: Icon(Icons.credit_card),
                    title: Text("Cadastro de Cartões"),
                    subtitle: Text("Cadastro de cartões"),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context){
                        return cadcartao();
                      }));
                    }
                  ),
                  ListTile(
                    leading: Icon(Icons.password),
                    title: Text("Cadastro de Senhas"),
                    subtitle: Text("Cadastro uma nova senha"),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context){
                        return cadsenhas();
                      }));
                    }
                  ),
                   ListTile(
                    leading: Icon(Icons.password),
                    title: Text("Gerar Senha"),
                    subtitle: Text("Gere uma nova senha"),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context){
                        return geradorSenha();
                      }));
                    }
                  ),
                   ListTile(
                    leading: Icon(Icons.password),
                    title: Text("Lista de Senhas"),
                    subtitle: Text("..."),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context){
                        return listaSenhas();
                      }));
                    }
                  ),
                  ListTile(
                    leading: Icon(Icons.password),
                    title: Text("Lista de Cartões"),
                    subtitle: Text("..."),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context){
                        return listaCartao();
                      }));
                    }
                  ),
            ],
          ),
        ),
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: const Text('Tela1')
              ),
              body: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                  ),
                  child: Text('Voltar'),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: [
                   BottomNavigationBarItem(
                    icon: Icon(Icons.person), label:"Minha conta", 
                    backgroundColor: Color.fromRGBO(241, 241, 241, 1)),
                    BottomNavigationBarItem(icon: Icon(Icons.person), label:"Senhas"),
                    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Cartões"),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: "Favoritos",)
                ],
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.black,
              ),
            ),
          );
      }

  }


/*https://static.biologianet.com/2023/01/capivara.jpg*/

