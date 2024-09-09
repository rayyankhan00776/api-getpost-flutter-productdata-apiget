import 'package:api_app1/models/postmodel.dart';
import 'package:api_app1/pages/services/api_services.dart';
import 'package:flutter/material.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              color: Colors.white,
            ),
            Text(
              " D A T A",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        backgroundColor: Colors.purple[400],
      ),
      body: FutureBuilder(
        future: getpost(),
        builder: (context, AsyncSnapshot<List<Product>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Product> products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, int index) {
                return Card(
                  child: ListTile(
                    leading: Image.network(
                      products[index].thumbnail,
                      width: 100,
                    ),
                    title: Text(products[index].title),
                    subtitle: Row(
                      children: [
                        Expanded(
                          child: Text(products[index].description),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                              '\$${products[index].price.toString()}'), // Convert price to string
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
