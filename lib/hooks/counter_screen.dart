import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tmp/hooks/full_screen_img.dart';

class ApiFetchExample extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // State to hold fetched data
    final data = useState<List<dynamic>>([]);
    final isLoading = useState<bool>(true);

    // Function to fetch data from the API
    Future<void> fetchData() async {
      final url = Uri.parse('https://api.sampleapis.com/avatar/characters');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var decodedData = json.decode(response.body);
        String prettyJson = JsonEncoder.withIndent('  ').convert(decodedData);
        debugPrint("API RESPONSE==>$prettyJson", wrapWidth: 1024);

        // Parse the response and update the data state
        data.value = json.decode(response.body);
      } else {
        // Handle errors here
        print('Failed to load data');
      }

      // Set loading state to false after data is fetched
      isLoading.value = false;
    }

    // Fetch data when widget is rendered
    useEffect(() {
      fetchData();
      return; // Clean-up if necessary (optional)
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: Text('API with Hooks'),
      ),
      body: isLoading.value
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: data.value.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data.value[index]['name']??""),
            subtitle: Container(
              height: 200,
              width: 200,
              child: GestureDetector(
                onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FullScreenImg(image: data.value[index]['image']??""),));
                },
                  child: Image(image: NetworkImage(data.value[index]['image']??""))),
            )
          );
        },
      ),
    );
  }
}
