import 'package:flutter/material.dart';

class PromptPage extends StatelessWidget {
  const PromptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Prompt'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: const <TextSpan>[
              TextSpan(
                  text: 'Objectives\n',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              TextSpan(
                  text:
                      '• Develop a Flutter application that fetches data from the Dog CEO API within 72 hours.\n'),
              TextSpan(
                  text:
                      '• Implement a main page that lists dog breeds retrieved from the API.\n'),
              TextSpan(
                  text:
                      '• Enable navigation from the main page to a details page that describes more information about the selected breed.\n'),
              TextSpan(
                  text:
                      '• Implement a user-friendly mechanism to navigate back to the main page from the details page.\n'),
              TextSpan(
                  text: 'Requirements\n',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              TextSpan(
                  text: 'Main Page\n',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              TextSpan(text: '1 API Integration:\n'),
              TextSpan(
                  text:
                      '• Utilize the Dog CEO API endpoint https://dog.ceo/api/breeds/list/all to fetch the list of dog breeds.\n'),
              TextSpan(
                  text:
                      '• Display a loading indicator while the data is being fetched.\n'),
              TextSpan(text: '2 UI Components:\n'),
              TextSpan(
                  text: '• Use a scrollable list to display the dog breeds.\n'),
              TextSpan(
                  text:
                      '• Each item in the list should be selectable and trigger navigation to the details page.\n'),
              TextSpan(text: '3 Error Handling:\n'),
              TextSpan(
                  text: '• Implement error handling for network requests.\n'),
              TextSpan(
                  text:
                      '• Display a user-friendly error message if the data fails to load.\n'),
              TextSpan(
                  text: 'Details Page\n',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              TextSpan(text: '1 Content Display:\n'),
              TextSpan(
                  text:
                      '• Display detailed information about the selected dog breed, including images if available.\n'),
              TextSpan(
                  text:
                      '• Use the endpoint https://dog.ceo/api/breed/[breed name]/images/random to fetch a random image of the selected breed.\n'),
              TextSpan(
                  text: 'Navigation\n',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              TextSpan(text: '• Implement smooth transitions between pages.\n'),
              TextSpan(
                  text:
                      '• Ensure the navigation stack is managed properly to avoid memory leaks.\n'),
              TextSpan(
                  text:
                      '• Provide a button or gesture control to navigate back to the main page.\n'),
              TextSpan(
                  text: 'Testing Scenarios\n',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              TextSpan(text: '1 Functionality Testing:\n'),
              TextSpan(
                  text:
                      '• Verify that all dog breeds are correctly fetched and listed on the main page.\n'),
              TextSpan(
                  text:
                      '• Ensure each breed is clickable and navigates to the correct details page.\n'),
              TextSpan(
                  text:
                      '• Check that the details page displays all relevant information correctly.\n'),
              TextSpan(text: '2 Usability Testing:\n'),
              TextSpan(
                  text:
                      '• Test the responsiveness of the application on different devices and orientations.\n'),
              TextSpan(
                  text: '• Ensure that the UI is intuitive and accessible.\n'),
              TextSpan(text: '3 Performance Testing:\n'),
              TextSpan(
                  text:
                      '• Monitor the application\'s performance during data fetching and navigation.\n'),
              TextSpan(
                  text:
                      '• Identify any potential bottlenecks or performance issues.\n'),
              TextSpan(text: '4 Edge Case Testing:\n'),
              TextSpan(
                  text: '• Simulate server errors to verify error handling.\n'),
              TextSpan(
                  text: 'Deliverables\n',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              TextSpan(
                  text:
                      '• Source code of the Flutter application via a public Github repository.\n'),
              TextSpan(
                  text:
                      '• The final apk file for testing on Android Devices.\n'),
              TextSpan(
                  text:
                      '• Documentation including setup instructions and a list of any dependencies.\n'),
              TextSpan(
                  text:
                      '• A brief report summarizing the architecture of the application and any further comments.\n'),
              TextSpan(
                  text: 'Bonus Objectives\n',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              TextSpan(
                  text:
                      '• Custom theming providing a unique experience for the user.\n'),
              TextSpan(
                  text:
                      '• Integrate an in-app testing framework such as Flutter\'s built-in testing capabilities or a third-party solution. This should include unit tests and integration tests.\n'),
            ],
          ),
        ),
      ),
    );
  }
}
