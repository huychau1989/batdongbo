import 'package:flutter/material.dart';

class bai1 extends StatefulWidget {
  const bai1({super.key});

  @override
  State<bai1> createState() => _bai1State();
}

class _bai1State extends State<bai1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('hhhhhhhhhhhhhhhh'),),
      body: Center(
        child:  Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: null,
                child: Column(
                  children: [
                    Container(
                        child: const Icon(Icons.cloud_download,),

                    ),
                    const Text('Du lieu tu Task 1 da duoc tai'),
                  ],
                ),
            ),
            const ElevatedButton(
              onPressed: null,
              child: Column(
                children: [
                  Icon(Icons.cloud_download),
                  Text('Du lieu tu Task 1 da duoc tai'),
                ],
              ),
            ),
            const ElevatedButton(
                onPressed: null,
                child: Text('ggggg'))
          ],
        ),
      ),
    );
  }
}
