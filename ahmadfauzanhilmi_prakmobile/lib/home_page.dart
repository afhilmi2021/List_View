import 'package:flutter/material.dart';
import 'package:kuis/coffee_menu.dart';
import 'package:kuis/openpage.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Menu Kopi LokaPasar"),
      ),
      body: ListView.builder(
          itemBuilder: (context, index){
            final CoffeeMenu coffee = coffeeList[index];
            return InkWell(
              onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
              return OpenPage(Coffee: coffee);
              }));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 150,vertical: 50),
                child: Card(
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Column(
                    children: [
                      Image.network(coffee.imageUrls[0],),
                      Text(coffee.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,fontFamily:'Times New Roman' ,
                          fontSize: 18,
                        ) ,
                      ),
                      Text(coffee.price,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,fontFamily:'Calibri' ,
                          fontSize: 18,
                        ) ,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        itemCount: coffeeList.length,
      ),
    );
  }
}
