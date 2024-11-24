import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class FackScreen extends StatefulWidget {
  const FackScreen({super.key});

  @override
  State<FackScreen> createState() => _FackScreenState();
}

class _FackScreenState extends State<FackScreen> {
  var faker = new Faker();
  final fakerFa = Faker(provider: FakerDataProviderFa());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facker Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Generate some different types of data.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Email: ${faker.internet.email()}"),
            Text("User  Name: ${faker.internet.userName()}"),
            Text("Location: ${faker.internet.uri(AutofillHints.location)}"),
            Text("Password: ${faker.internet.password(length: 10)}"),
            Text("Domain Name: ${faker.internet.domainName()}"),
            Text("Https URL: ${faker.internet.httpsUrl()}"),
            Text("Free Email: ${faker.internet.freeEmail()}"),
            Text("Http URL: ${faker.internet.httpUrl()}"),

            SizedBox(height: 20),
            Text(
              "Generate  JSON Web Token (JWT)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('JWT token: ${faker.jwt.valid()}'),
            // Text("JWT : ${faker.jwt.valid(expiresIn: DateTime.now().add(Duration(hours: 2)))}"),
            // Text("JWT : ${faker.jwt.expired()}"),
            SizedBox(height: 20),

            Text(
              "Generate a random geo.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Longitude: ${faker.geo.longitude().toStringAsFixed(4)}'),
            Text('Latitude: ${faker.geo.latitude().toStringAsFixed(4)}'),

            SizedBox(height: 20),

            Text(faker.internet.domainName()),

            Text(
              "Generate random DateTime",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Between the years 2000 and 2020: ${faker.date.dateTime(minYear: 2000, maxYear: 2020)}'),
            SizedBox(height: 6,),
            Text('Between the 2 dates: ${faker.date.dateTimeBetween(DateTime(2017, 9, 7), DateTime(2020, 9, 7))}'),
          ],
        ),
      )
    );
  }
}
