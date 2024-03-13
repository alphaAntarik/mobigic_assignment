import 'package:flutter/material.dart';
import 'package:mobigic_antarik/home_screens/providers/homescreen_provider.dart';
import 'package:mobigic_antarik/home_screens/widgets/grid_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static String homescreenroute = '/homescreenroute';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobigic'),
      ),
      body: Consumer<HomeScreenProvider>(
        builder: (context, value, child) => SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(8),
            child: Column(children: [
              Form(
                key: value.formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: value.m,
                      decoration: InputDecoration(
                        hintText: 'Enter no of rows',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value != null && int.tryParse(value) == null ||
                            int.parse(value!) == 0) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: value.n,
                      decoration:
                          InputDecoration(hintText: 'Enter no of Columns'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value != null && int.tryParse(value) == null ||
                            int.parse(value!) == 0) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: value.generateGrid, child: Text('Generate grid')),
              SizedBox(
                height: 30,
              ),
              if (value.m.text != '' && value.n.text != '') GridWidget(),
              SizedBox(
                height: 30,
              ),
              Form(
                key: value.formkeysearch,
                child: TextFormField(
                  controller: value.search,
                  decoration: InputDecoration(
                    hintText: 'Enter search text',
                  ),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null) {
                      return 'Please enter a valid String';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: value.searchAndHighlight, child: Text('Search')),
            ]),
          ),
        ),
      ),
    );
  }
}
