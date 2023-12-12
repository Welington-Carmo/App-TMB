import 'package:flutter/material.dart';
import 'package:coin_convrt/models/my_obj.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double? dolar;
  double? euro;
  double? real;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("\$ Conversor \$"),
        backgroundColor: Color(0xffdaa520),
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
        future: objJson(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                  child: Text('carregando...',
                      style: TextStyle(
                        color: Color(0xffdaa520),
                        fontSize: 25,
                      )));
            default:
              if (snapshot.hasError) {
                return Center(
                    child: Text('Algo deu errado :(',
                        style: TextStyle(
                          color: Color(0xffdaa520),
                          fontSize: 25,
                        )));
              } else {
                dolar = snapshot.data?["results"]["currencies"]["USD"]["buy"];
                euro = snapshot.data?["results"]["currencies"]["EUR"]["buy"];
                return SingleChildScrollView(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Icon(
                          Icons.monetization_on,
                          size: 150,
                          color: Color(0xffdaa520),
                        ),
                        TextField(
                          decoration: InputDecoration(
                              labelText: 'Real',
                              labelStyle: TextStyle(
                                  fontSize: 20, color: Color(0xffdaa520)),
                              border: OutlineInputBorder(),
                              prefixText: 'R\$ ',
                              prefixStyle: TextStyle(
                                  color: Color(0xffdaa520), fontSize: 18)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: 'Dólar',
                                labelStyle: TextStyle(
                                    fontSize: 20, color: Color(0xffdaa520)),
                                border: OutlineInputBorder(),
                                prefixText: 'US\$ ',
                                prefixStyle: TextStyle(
                                    color: Color(0xffdaa520), fontSize: 15)),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                              labelText: 'Euro',
                              labelStyle: TextStyle(
                                  fontSize: 20, color: Color(0xffdaa520)),
                              border: OutlineInputBorder(),
                              prefixText: '€ ',
                              prefixStyle: TextStyle(
                                  color: Color(0xffdaa520), fontSize: 20)),
                        )
                      ],
                    ));
              }
          }
        },
      ),
    );
  }
}
