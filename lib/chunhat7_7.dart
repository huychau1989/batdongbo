

import 'package:batdongbo/products.dart';

import 'package:flutter/material.dart';


class baitap2 extends StatefulWidget {
  const baitap2({super.key});

  @override
  State<baitap2> createState() => _baitap2State();
}

class _baitap2State extends State<baitap2> {
   bool _isloading=false;
   final TextEditingController _name=TextEditingController();
   final  TextEditingController _imageUrl=TextEditingController();
   final  TextEditingController _details=TextEditingController();
   final  TextEditingController _price=TextEditingController();
    final _nameKey = GlobalKey<FormState> ();
    final _priceKey = GlobalKey<FormState> ();
    String? _checkname(String?value){
      return (_name.text.length>=15||_name.text.isEmpty)?'tên không được để trống và ít hon 15 ký tự':null;
    }
    // String? _checkprice(String?value){
    //   return _price.text.runtimeType == double ? null :'Giá phải là chữ số ';
    // }


   @override
  void initState() {
    super.initState();
    setState(() {
      _startLoading();
    products1=products;
    });
  }
  int vitri=0;
   void _startLoading()async{
     await Future.delayed(const Duration(seconds: 2));
     setState((){
       _isloading=false;
     });
   }

  void themsanpham(){
    setState((){
      _isloading=true;
      _startLoading();
        if (_name.text.isNotEmpty && _details.text.isNotEmpty && _imageUrl.text.isNotEmpty&&_price.text.isNotEmpty) {
          int index;
          for(index=0;index<products1.length;index++){
            if(products1[index].name==_name.text&&products1[index].imageUrl==_imageUrl.text
                &&products1[index].details==_details.text&&products1[index].price==double.parse(_price.text)){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Thông tin đả tồn tại!'),
              ));
            }
          }
          // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //   content: Text('Thông tin đả tồn tại!'),
          // ));
        }
        else if(_name.text.isNotEmpty || _details.text.isNotEmpty || _imageUrl.text.isNotEmpty||_price.text.isNotEmpty){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Mời bạn nhập thêm thông tin!'),

          ));
        }
        else{
      products1.add(Product(name: _name.text, imageUrl: _imageUrl.text, details: _details.text, price: double.parse(_price.text)));

      }

    });


  }

  void capnhat(String name){
      setState(() {
        //products1.insert(vitri, Product(name: _name.text, imageUrl: _imageUrl.text, details: _details.text, price:double.parse(_price.text)));


          if(products1[vitri].name==_name.text){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Không có thay đổi nào để cập nhật!'),
            ));
          }
          else {
            products1.insert(vitri, Product(name: _name.text, imageUrl: _imageUrl.text, details: _details.text, price:double.parse(_price.text)));
          }

      });
  

  }
  // void delete(String name){
  //    setState(() {
  //      products1.removeWhere((product) => product.name==name);
  //    });
  // }

   List<Product> products1=[];
  final List<Product> products = [
    Product(
      name: 'ABC',
      imageUrl: 'https://i.postimg.cc/MTtsXC7T/pngwing-com.png',
      details: 'This is the detail of Product 1.',
      price: 29.99,
    ),
    Product(
      name: 'CDF',
      imageUrl: 'https://i.postimg.cc/MTtsXC7T/pngwing-com.png',
      details: 'This is the detail of Product 2.',
      price: 19.99,
    ),
    Product(
      name: 'HGG',
      imageUrl: 'https://i.postimg.cc/MTtsXC7T/pngwing-com.png',
      details: 'This is the detail of Product 3.',
      price: 59.99,
    ),
    Product(
      name: 'WQA',
      imageUrl: 'https://i.postimg.cc/MTtsXC7T/pngwing-com.png',
      details: 'This is the detail of Product 4.',
      price: 9.99,
    ),
    Product(
      name: 'HGDS',
      imageUrl: 'https://i.postimg.cc/MTtsXC7T/pngwing-com.png',
      details: 'This is the detail of Product 5.',
      price: 9.99,
    )];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text('Product Manager'),),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
               Form(
                 autovalidateMode: AutovalidateMode.onUserInteraction,
                 key: _nameKey,
                 child: TextFormField(
                   validator: _checkname,
                  controller:_name ,
                  obscureText: false,
                  cursorColor:Colors.black,
                  decoration: const InputDecoration(
                    labelText: 'Product Name',
        
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),

        
        
                  ),
                             ),
               ),
            SizedBox(height: 10,),
        
            //-------------------------------------------------------------------------------
            TextFormField(
                controller:_imageUrl ,
                obscureText: false,
                cursorColor:Colors.black,
                decoration: const InputDecoration(
                  labelText: 'Image Url',
        
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
        
        
                ),
              ),
            const SizedBox(height: 10,),
        
            //-------------------------------------------------------------------------------
             TextFormField(
                controller:_details ,
                obscureText: false,
                cursorColor:Colors.black,
                decoration: const InputDecoration(
                  labelText: 'Product details',
        
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
        
        
                ),
              ),
            const SizedBox(height: 10,),
        
            //-------------------------------------------------------------------------------
            Form(
              key: _priceKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: TextFormField(
                //validator: _checkprice,
                  controller:_price ,
                  obscureText: false,
                  cursorColor:Colors.black,
                  decoration: const InputDecoration(
                    labelText: 'Product price',

                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),


                  ),
                ),
            ),
            const SizedBox(height: 10,),
        
            //-------------------------------------------------------------------------------
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: themsanpham,
                    child: _isloading? const CircularProgressIndicator():const Text('Thêm sản phẩm')
                ),
                const SizedBox(width: 50,),
                ElevatedButton(
                    onPressed: (){
                      capnhat(_name.text);
                    },
                    child:_isloading?const CircularProgressIndicator(): const Text('Cập nhật sản phẩm')
                ),
              ],
            ),
            //-------------------------------------------------------------------------------
            Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: products1.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 80,
                      // color: Colors.amber[colorCodes[index]],
                      child:  Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //Image(image: NetworkImage(products[index].imageUrl)),
                          Expanded(
                            child: Text('${products1[index].name}\n'
                                '${products1[index].price}\n'
                                '${products1[index].details}'),
                          ),
                          
                          IconButton(
                              onPressed:
                                  (){
                                vitri=index;
                                
                            _name.text=products1[index].name!;
                            _imageUrl.text=products1[index].imageUrl!;
                            _details.text=products1[index].details!;
                            _price.text='${products1[index].price}';
                          },
                              icon:  const Icon(Icons.edit)),
                          IconButton(
                              onPressed:
                                  (){
                           setState(() {
                             products1.removeWhere((product) => product.name==products1[index].name);
                            });
                          },
                              icon: const Icon(Icons.delete))
                        ],
                      ),
                    );
                  },
                )
            ),
        
          ],
        ),
      ),
    );
  }
}


