

import 'package:flutter/material.dart';
class Vidu extends StatefulWidget {
  const Vidu({super.key});

  @override
  State<Vidu> createState() => _ViduState();
}
class _ViduState extends State<Vidu> {
final  TextEditingController a=TextEditingController();
String text='';
List<String> member=[];


  bool _isLoading=true;


  @override
  void initState() {
    super.initState();
    _startLoading();
  }
  void _startLoading()async{
    await Future.delayed(const Duration(seconds: 2));
    setState((){
      _isLoading=false;

    });
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Async Member Management'),),
      body:_isLoading? CircularProgressIndicator()
          :Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Text('Async Member Management'),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller:a ,
                  obscureText: false,
                  cursorColor:Colors.black,
                  decoration: const InputDecoration(
                    labelText: 'Enter member name',

                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),


                  ),
                ),
              ),
              TextButton(
                  onPressed:
                      (){
                    setState(() {
                      print(a.text);
                      member.add(a.text);
                    });
                  },
                child: const Text('Add'),
              ),

            ],
          ),
          ElevatedButton(
              onPressed: (){
                setState(() {


                });
              },
              child: Text('Cập nhat')
          ),
          Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: member.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.public),
                      title: Text(member[index]),
                      trailing:IconButton(onPressed: (){
                        setState(() {
                          member.remove(member[index]);
                        });
                      },
                      icon: Icon(Icons.delete),),
                    ),
                  );
                  //   SizedBox(
                  //   height: 80,
                  //   child:  Row(
                  //     children: [
                  //       Expanded(
                  //           flex: 3,
                  //           child: Text(member[index]),
                  //       ),
                  //       Expanded(
                  //         flex: 1,
                  //         child: TextButton(
                  //             onPressed:
                  //                 (){
                  //               setState(() {
                  //                 print(member[index]);
                  //                 member.remove(member[index]);
                  //               });
                  //               },
                  //             child:Icon(Icons.delete),
                  //         ),
                  //       ),
                  //       TextButton(
                  //           onPressed: (){
                  //             setState(() {
                  //               a.text=member[index];
                  //             });
                  //           },
                  //           child: Icon(Icons.edit)
                  //       ),
                  //       TextButton(
                  //           onPressed: (){
                  //             setState(() {
                  //              member[index]=a.text;
                  //             });
                  //           },
                  //           child: Icon(Icons.add)
                  //       ),
                  //
                  //
                  //     ],
                  //   ),
                  // );
                },
              )
          ),
        ],
      ),
    );
  }
}



