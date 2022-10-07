import 'package:flutter/material.dart';
import 'package:kuis/coffee_menu.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenPage extends StatefulWidget {
  final CoffeeMenu Coffee;
  const OpenPage({Key? key, required this.Coffee}) : super(key: key);

  @override
  State<OpenPage> createState() => _OpenPageState();
}

class _OpenPageState extends State<OpenPage> {
  @override
  bool toggle = false;
  Color change_color = Colors.black87;

  favorite(toggle){
    if(toggle=true) {
      setState(() {
        change_color = Colors.purple;
      });
    }else{
      change_color = Colors.black87;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: change_color,
      appBar: AppBar(
        title: Text("${widget.Coffee.name}"),
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                toggle = !toggle;
                favorite(toggle);
              });
            },
            icon: (toggle)
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: (MediaQuery.of(context).size.height)/3,
            child:  ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 40,vertical: 40),
                scrollDirection: Axis.horizontal,
                itemCount: widget.Coffee.imageUrls.length,
                itemBuilder: (context, index){
                  return  Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 15
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(widget.Coffee.imageUrls[index],
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                            fit: BoxFit.cover,)
                      )
                  );
                }
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: Card(
              shape: ContinuousRectangleBorder(
                side: BorderSide(
                    color: Colors.black87
                ),
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 100),
                shrinkWrap: true,
                children: [
                  Text(widget.Coffee.name,
                    style: TextStyle(
                      fontSize: 28,fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: 30,width: 30),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(widget.Coffee.description,
                      style: TextStyle(
                          fontSize: 20
                      ),),
                  ),
                  SizedBox(height: 30,width: 30),
                  Text("Price         :  ${widget.Coffee.price}",
                    style: TextStyle(
                        fontSize: 20
                    ),),
                  SizedBox(height: 30,width: 30),
                  Text("Ingredients   :  ${widget.Coffee.ingredients}",
                    style: TextStyle(
                        fontSize: 20
                    ),),
                  SizedBox(height: 30,width: 30),
                  Text("Nutrition     :  ${widget.Coffee.nutrition}",
                    style: TextStyle(
                        fontSize: 20
                    ),),
                  SizedBox(height: 30,width: 30),
                  Text("Reviews | Average : ${widget.Coffee.reviewAverage} ",
                    style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: 30,width: 30),
                  Container(
                    padding: EdgeInsets.only(right: 100,left: 100,) ,
                    height: 40,
                    child: ElevatedButton(
                        onPressed: (){
                          _launchURL(widget.Coffee.linkStore);
                        },
                        child: Text("Go To Store")),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  void _launchURL(_url) async{
    if(!await launch(_url)) throw 'could not launch $_url';
  }
}
