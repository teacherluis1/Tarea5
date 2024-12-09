
import 'package:completarprofe/views/widgets/app_bar_actions.dart';
import 'package:completarprofe/views/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';



class QuienesSomos extends StatelessWidget {
  




  const QuienesSomos({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width >= 600;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1A237E),
          title: const Text('FinanTech'),
          actions: isDesktop ? const [AppBarActions()] : null,
        ),
        drawer: isDesktop ? null : const CustomNavigationDrawer(),


        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              color: Color(0xFF1A237E),
              height: 200,
              width: double.infinity,
              child: Text("Institución",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 50,
              ),
              ),
            ),
                    SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                //Mision
        
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        child: Text("Misión",
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xFF1A237E),
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        width: 250,
                        height: 170,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text("Proveer soluciones tecnológicas innovadoras para la gestión financiera, impulsando la eficiencia y el crecimiento sostenible de nuestros clientes.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          
                        ),
                        ),
                      ),
                    ],
                  ),
                
                ),




              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        child: Text("Visión",
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xFF1A237E),
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        width: 250,
                        height: 170,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text("Ser líderes en el desarrollo de herramientas digitales financieras, reconocidos por nuestra excelencia, confiabilidad e impacto global.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          
                        ),
                        ),
                      ),
                    ],
                  ),
                
                ),



                //valores



              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        child: Text("Valores",
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xFF1A237E),
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        width: 250,
                        height: 170,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text("Fomentar la innovación, la integridad y la calidad, creando soluciones con impacto positivo, confiable, sostenible y responsable.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          
                        ),
                        ),
                      ),
                    ],
                  ),
                
                ),


              
                






              ],
            ),            
          ],
          
        ),
        
        
        
        
        );
  }
}