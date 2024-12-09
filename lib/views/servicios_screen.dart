import 'package:flutter/material.dart';
import 'package:completarprofe/views/widgets/app_bar_actions.dart';
import 'package:completarprofe/views/widgets/navigation_drawer.dart';


class Servicios extends StatelessWidget {
  const Servicios({super.key});

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


        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                color: Color(0xFF1A237E),
                height: 200,
                width: double.infinity,
                child: Text("Servicios",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 50,
                ),
                ),
              ),
              SizedBox(height: 30),




              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [


                  //prestamos personales

                    Column(
                    children: [                  
                      Container(
                        child: Text("Prestamos Personales",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A237E),
                          fontSize: 20,
                        ),),
                      ),
                      
                      Container(
                        
                        width: 250,
                        height: 250,
                  
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                  
                          child: Image.network(
                            "https://images.pexels.com/photos/8292854/pexels-photo-8292854.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                            fit: BoxFit.cover,),
                          
                  
                  
                        ),
                        
                  
                  
                        
                      ),
                    ],
                  
                  ),

                  











                  //prestamos empresariales

                    Column(
                    children: [                  
                      Container(
                        child: Text("Prestamos Empresariales",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xFF1A237E),
                        ),),
                      ),
                      SizedBox(height: 10),
                      Container(
                        
                        width: 250,
                        height: 250,
                  
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                  
                          child: Image.network(
                            "https://images.pexels.com/photos/4483862/pexels-photo-4483862.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                            fit: BoxFit.cover,),
                          
                  
                  
                        ),
                        
                  
                  
                        
                      ),
                    ],
                  
                  ),











                //prestamos hipotecarios




                  Column(
                    children: [                  
                      Container(
                        child: Text("Prestamos Hipotecarios",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A237E),
                          fontSize: 20,
                        ),),
                      ),
                      SizedBox(height: 10),
                      Container(
                        
                        width: 250,
                        height: 250,
                  
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                  
                          child: Image.network(
                            "https://images.pexels.com/photos/8293637/pexels-photo-8293637.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                            fit: BoxFit.cover,),
                          
                  
                  
                        ),
                        
                  
                  
                        
                      ),
                    ],
                  
                  ),
                ],
              )

            ],
          ),
        )
        
        
        
        
        );
  }
}