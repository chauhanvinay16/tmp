import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SingleApiFetchExample extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // State to hold fetched data (single object)
    final data = useState<Map<String, dynamic>?>(null);
    // final post = useState<Post?>(null); //model class
    final isLoading = useState<bool>(true);

    // Function to fetch data from the API
    Future<void> fetchData() async {
      final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        print(response.body);
        // Parse the response and update the data state
        data.value = json.decode(response.body);

        // Parse the response and update the state with a Post object
        // post.value = Post.fromJson(json.decode(response.body));

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
        title: Text('Single API Fetch Example'),
      ),
      body: isLoading.value
          ? Center(child: CircularProgressIndicator())
          : data.value != null
          ? Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: ${data.value!['title']}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Body: ${data.value!['body']}', style: TextStyle(fontSize: 16)),
          ],
        ),
      )
          : Center(child: Text('No data available')),
    );
  }
}
