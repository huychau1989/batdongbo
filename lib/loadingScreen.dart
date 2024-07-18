import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool _isloading=true;
  @override
  void initState() {
    super.initState();
    _startLoading();
  }
  void _startLoading()async{
    await Future.delayed(const Duration(seconds: 5));
    setState((){
      _isloading=false;

    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: _isloading
            ?const CircularProgressIndicator()
            :Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: null,
              child: Column(
                children: [
                  Container(
                    child: Icon(Icons.cloud_download,),

                  ),
                  Text('Du lieu tu Task 1 da duoc tai'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: null,
              child: Column(
                children: [
                  Icon(Icons.cloud_download),
                  Text('Du lieu tu Task 1 da duoc tai'),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: null,
                child: Text('ggggg'))
          ],
        ),
      ),
    );
  }
}
