import 'package:flutter/material.dart';
import 'profilepage.dart'; // Import your existing ProfilePage

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  // Use a map to associate each card with its detailed content
  final Map<String, String> detailedContent = {
    'Latest News Headline': 'Brief description of the latest news...',
    'Important Notice': 'Details of the notice...',
    'Download Documents': 'Click to access important documents...',
    'Upcoming Event': 'Details of the upcoming event...',
    'Event Registration': 'Register for the upcoming event...',
    'Featured Content': 'Explore our featured articles...',
    'Follow Us on Twitter': 'Stay updated with our tweets...',
  };

  // Track the currently selected card
  String? selectedCard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: detailedContent.keys.map((title) {
            return Column(
              children: [
                _buildCard(title, detailedContent[title]!),
                if (selectedCard == title) _buildDetailedContent(detailedContent[title]!),
                SizedBox(height: 16),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildCard(String title, String subtitle) {
    return Card(
      elevation: 5.0,
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(subtitle),
        onTap: () {
          // Toggle the detailed content visibility
          setState(() {
            selectedCard = selectedCard == title ? null : title;
          });
        },
      ),
    );
  }

  Widget _buildDetailedContent(String content) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.grey[200],
      child: Text(content),
    );
  }
}
