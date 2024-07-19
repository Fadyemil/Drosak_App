import 'package:drosak/data_layer/models/ed_st_model.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegateEdStScreen extends SearchDelegate {
  List<EdStModel> searchTerms;
  CustomSearchDelegateEdStScreen({
    required this.searchTerms,
    required this.scrollController,
  });
  final ScrollController scrollController;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Create an empty list to store the matched search results
    List<EdStModel> matchQuery = [];

    // Iterate over each item in the searchTerms list
    for (var stage in searchTerms) {
      // Check if the item's title contains the search query (case insensitive)
      if (stage.title.toLowerCase().contains(query.toLowerCase())) {
        // If it matches, add the item to the matchQuery list
        matchQuery.add(stage);
      }
    }

    // Return a ListView.builder to display the matched search results
    return ListView.builder(
      itemCount: matchQuery.length, // Set the number of items in the list
      itemBuilder: (context, index) {
        var result =
            matchQuery[index]; // Get the current item based on the index

        // Return a ListTile to display the result
        return ListTile(
          title: Text(
            result.title,
            style: const TextStyle(
              color: Color.fromARGB(249, 27, 126, 240),
            ),
          ),
          onTap: () {
            int position = searchTerms.indexOf(result);
            scrollController.animateTo(
              position * MediaQuery.sizeOf(context).height * .15,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            );

            // Close the search interface
            close(context, null);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<EdStModel> matchQuery = [];
    for (var stage in searchTerms) {
      if (stage.title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(stage);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(
            result.title,
            style: const TextStyle(
              color: Color.fromARGB(249, 27, 126, 240),
            ),
          ),
          onTap: () {
            int position = searchTerms.indexOf(result);
            scrollController.animateTo(
              position * MediaQuery.sizeOf(context).height * .15,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            );
            close(context, null);
          },
        );
      },
    );
  }
}
