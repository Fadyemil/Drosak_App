import 'package:drosak/data_layer/models/audience_model.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegatePay extends SearchDelegate {
  List<AudienceModel> searchTerms;
  CustomSearchDelegatePay({
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
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<AudienceModel> matchQuery = [];

    for (var stage in searchTerms) {
      if (stage.InputName != null &&
              stage.InputName!.toLowerCase().contains(query.toLowerCase()) ||
          stage.ExpenseName != null &&
              stage.ExpenseName!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(stage);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];

        return ListTile(
          title: Text(
            result.InputName ?? result.ExpenseName ?? 'Unknown',
            style: const TextStyle(
              color: Color.fromARGB(249, 27, 126, 240),
            ),
          ),
          onTap: () {
            int position = searchTerms.indexOf(result);
            scrollController.animateTo(
              position * MediaQuery.sizeOf(context).height * .35,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            );

            close(context, null);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<AudienceModel> matchQuery = [];
    for (var stage in searchTerms) {
      if (stage.InputName != null &&
              stage.InputName!.toLowerCase().contains(query.toLowerCase()) ||
          stage.ExpenseName != null &&
              stage.ExpenseName!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(stage);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(
            result.InputName ?? result.ExpenseName ?? 'Unknown',
            style: const TextStyle(
              color: Color.fromARGB(249, 27, 126, 240),
            ),
          ),
          onTap: () {
            int position = searchTerms.indexOf(result);
            scrollController.animateTo(
              position * MediaQuery.sizeOf(context).height * .165,
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
