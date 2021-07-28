import 'package:burgerjoint/Widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //FOR DRAWER
  final GlobalKey<ScaffoldState> _key =  GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key:  _key,
      drawer: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(icon: const Icon(Icons.clear,color: Colors.white,), onPressed: (){
              Navigator.pop(context);
            }),
            // ignore: sized_box_for_whitespace
            Container(
              height: 400,
              width: MediaQuery.of(context).size.width*0.8,
              decoration:BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Drawer(

                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [

                    ListTile(
                      title:   Text('Item 1'),
                      onTap: () {

                      },
                    ),
                    ListTile(
                      title:   Text('Item 2'),
                      onTap: () {

                      },
                    ),

                    ListTile(
                      title:   Text('Item 3'),
                      onTap: () {

                      },
                    ),
                    ListTile(
                      title:   Text('Item 4'),
                      onTap: () {

                      },
                    ),
                    ListTile(
                      title:  Text('Item 5'),
                      onTap: () {

                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: CustomAppBar(title: "DELIVERING TO", backgroundColor: '#ED1C24' , onChanged: (value){
        if(value){
        _key.currentState!.openDrawer();
        }
      }),
      body:  Container()
    );
  }

}
