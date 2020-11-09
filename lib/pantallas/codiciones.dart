import 'package:flutter/material.dart';

class Condiciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Política de Privacidad"),
            centerTitle: true,
            leading: new Container(
              child: Icon(Icons.face),
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text('''Te damos la bienvenida a nuestra App!

Para ofrecer nuestro servicio y que puedas utilizar nuestra plataforma, debemos recopilar y usar tu información, la cuál es anónima en todo momento para los otros usuarios. En cualquier momento puedes actualizar tu información, desde la configuración. Debes aceptar los Términos y Condiciones para usar nuestra aplicación.

Todos los usuarios  que cumplan con nuestras políticas y condiciones pueden usar la app, y deberás proporcionar información veraz para poder registrarte.

El cuidado de tu cuenta y tu contraseña depende exclusivamente de cada usuario, la aplicación no puede evitar ingresos a cuentas por otros usuarios.

Tu información será utilizada exclusivamente para la aplicación y no será compartida o usada para otros fines; sin embargo debes tener muy en cuenta que la información que subas es pública por lo que cualquier persona podría verla e incluso compartir.

Es posible que a través de herramientas tecnológicas se te puedan presentar anuncios de publicidad como parte de la aplicación, sin que la información que hayas proporcionada sea revelada. Tus datos personales, siempre estarán protegidos.

Siempre que tengas dudas sobre la política de privacidad, podrás escribirnos en nuestro botó de ayuda.

'''),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                  minWidth: 200.0,
                  height: 40.0,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.purple,
                  child:
                      Text('Regresar', style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
        ));
  }
}
