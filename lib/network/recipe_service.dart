import 'package:http/http.dart';

const String apiKey = '60ae7309346de8a6372afd401889e5bc';
const String apiId = 'b925f969';
const String apiUrl = 'https://api.edamam.com/search';

class RecipeService {
  Future getData(String url) async {
    print('Calling url: $url');
    // response doesn’t have a value until await completes. Response and get() are from the HTTP package. get fetches data from the provided url.
    final response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      // return the results embedded in response.body.
      return response.body;
    } else {
      // Otherwise, you have an error — print the statusCode to the console.
      print(response.statusCode);
    }
  }

  Future<dynamic> getRecipes(String query, int from, int to) async {
    final recipeData = await getData(
        '$apiUrl?app_id=$apiId&app_key=$apiKey&q=$query&from=$from&to=$to');
    return recipeData;
  }
}
