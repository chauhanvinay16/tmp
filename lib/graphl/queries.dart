const String fetchCharactersAndEpisodesQuery = """
query {
  characters {
    results {
      name
      image
    }
  }
  episodes {
    results {
      name
      episode
    }
  }
}
""";
