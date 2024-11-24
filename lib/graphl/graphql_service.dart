import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  late GraphQLClient _client;

  GraphQLService() {
    // Initialize GraphQL client
    HttpLink link = HttpLink("https://rickandmortyapi.com/graphql");
    _client = GraphQLClient(
      link: link,
      cache: GraphQLCache(store: HiveStore()),
    );
  }

  Future<QueryResult> performQuery(String query) async {
    final options = QueryOptions(document: gql(query));
    final result = await _client.query(options);
    return result;
  }
}
