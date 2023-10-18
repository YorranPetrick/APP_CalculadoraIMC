import 'package:flutter/material.dart';

class homeIMC extends StatefulWidget {
  @override
  State<homeIMC> createState() => _homeIMCState();
}

class _homeIMCState extends State<homeIMC> {
  // Criando Controladores para pegar o valor do Peso e Altura
  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();

  String valorImc = '0';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: 70,
              height: 70,
              child: Card(
                child: Center(
                  child: Text(
                    valorImc,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            _textFormField('Digite o seu Peso', 'Altura', controllerAltura),
            const SizedBox(height: 30),
            _textFormField('Digite a sua Altura', 'Peso', controllerPeso),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                //Logica para o Calculo do IMC
              },
              child: const Text('Calcular'),
            ),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //Área de Informações
            showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Abaixo do peso (IMC < 18,5)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Peso normal (IMC 18,5 - 24,9)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Sobrepeso (IMC 25,0 - 29,9)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Obesidade grau I (IMC 30,0 - 34,9)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Obesidade grau II (IMC 35,0 - 39,9)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Obesidade grau III (IMC ≥ 40,0)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: const Icon(Icons.info),
        ),
      ),
    );
  }
}

AppBar _appBar() {
  return AppBar(
    elevation: 0,
    leading: Padding(
      padding: const EdgeInsets.only(left: 20),
      child: IconButton(
        onPressed: () => print('Menu Tapped'),
        icon: Image.asset(
          'lib/image/menu.png',
          fit: BoxFit.fitWidth,
        ),
      ),
    ),
  );
}

// Caixa de entrada

TextFormField _textFormField(
    String texto, String label, TextEditingController controller) {
  return TextFormField(
    keyboardType: TextInputType.number, // Colocando Teclado Numerico
    controller: controller,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blue, width: 4.0),
        borderRadius: BorderRadius.circular(15),
      ),
      labelText: label,
      hintText: texto,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
    ),
  );
}
