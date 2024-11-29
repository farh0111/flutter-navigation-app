import 'package:flutter/material.dart';
import 'package:flutter_app_2/models/data_model.dart';
//import 'package:flutter_app_2/utils/api_client.dart';

class DataScreen extends StatefulWidget {
  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  late Future<List<DataModel>> futureData;
  late ApiClient apiClient;

  @override
  void initState() {
    super.initState();
    apiClient = ApiClient(); // Initialize the instance
    futureData = apiClient.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Screen'),
      ),
      body: FutureBuilder<List<DataModel>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].name),
                  subtitle: Text(snapshot.data![index].email),
                );
              },
            );
          }
        },
      ),
    );
  }
}
