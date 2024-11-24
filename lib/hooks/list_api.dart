import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'package:tmp/provider/job_modal.dart';

class ListApi extends HookWidget {
  const ListApi({super.key});

  Future<List<JobModal>> fetchData() async {
    final url = Uri.parse('https://the-rosary-api.vercel.app/v1/monday');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var decodedata=json.decode(response.body);
      final prettyjson=JsonEncoder.withIndent(' ').convert(decodedata);
      debugPrint("API RESPONSE: ${prettyjson}",wrapWidth: 1024);
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => JobModal.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load data");
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = useState<List<JobModal>>([]);
    final isLoading = useState<bool>(true);
    final errorMessage = useState<String?>(null);

    useEffect(() {
      fetchData().then((result) {
        data.value = result;
      }).catchError((error) {
        errorMessage.value = error.toString();
      }).whenComplete(() {
        isLoading.value = false;
      });

      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(),
      body: isLoading.value
          ? Center(child: CircularProgressIndicator())
          : errorMessage.value != null
          ? Center(child: Text(errorMessage.value!))
          : ListView.builder(
        itemCount: data.value.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data.value[index].finalPrayer ?? ""),
          );
        },
      ),
    );
  }
}
