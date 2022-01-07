import 'package:flutter/material.dart';
import 'package:search_helper/search_helper.dart';
import 'package:searchhelper_example/constats/datat.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  List<Map<String,dynamic>> filterList = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filterList = data;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Column(
            children:  [

               TextField(


                 onChanged: (String input){
                   if(input.isEmpty){
                     filterList = data;
                     setState(() {

                     });
                   }else{

                     /// Searching implementation

                     filterList = SearchHelper.stringInstantSearch(
                       data: filterList,
                       keys: ['name'],
                       searchWord: input
                     );

                     setState(() {

                     });


                   }
                 },

                decoration: const InputDecoration(
                  hintText: 'Search Here...',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder()
                ),

              ),
              
              
              Expanded(
                child: ListView.builder(itemBuilder: (ctx,i){
                  return ListTile(
                    title: Text(filterList[i]['name']),
                    subtitle: Text("Genus: ${filterList[i]['name']}"),
                    trailing: Text(filterList[i]['species'].toString()),
                  );
                },itemCount: filterList.length,),
              ),
              
              
              
              
            ],
          ),
        ),
      ),
    );
  }
}
