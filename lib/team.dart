import 'package:flutter/material.dart';

class TeamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Team Achievements'),
      ),
      body: ListView(
        children: [
          buildSection(
            title: 'Boys Section',
            subSections: [
              buildGameSection(
                gameTitle: 'Chess',
                achievements: [
                  'Winner - Chess Championship 2022',
                  'Runner-up - School Chess League 2023',
                ],
                imageAsset: 'assets/hsnc_logo.png',
              ),
              buildDivider(),
              buildGameSection(
                gameTitle: 'Badminton',
                achievements: [
                  '1st Place - Badminton Tournament 2023',
                  'Best Player - Inter-School Badminton Meet 2023',
                ],
                imageAsset: 'assets/hsnc_logo.png',
              ),
              // Add sections for other games...
              buildDivider(),
              buildSubSection(
                title: 'Syjc Boys',
                sports: {
                  // Add achievements for Syjc Boys
                },
                imageAsset: 'assets/hsnc_logo.png',
              ),
              buildDivider(),
              buildSubSection(
                title: 'UG - TY UG Boys',
                sports: {
                  // Add achievements for UG - TY UG Boys
                },
                imageAsset: 'assets/hsnc_logo.png',
              ),
            ],
          ),
          buildDivider(),
          buildSection(
            title: 'Girls Section',
            subSections: [
              buildSubSection(
                title: 'Fyjc Girls',
                sports: {
                  // Add achievements for Fyjc Girls
                },
                imageAsset: 'assets/hsnc_logo.png',
              ),
              buildDivider(),
              buildSubSection(
                title: 'Syjc Girls',
                sports: {
                  // Add achievements for Syjc Girls
                },
                imageAsset: 'assets/hsnc_logo.png',
              ),
              buildDivider(),
              buildSubSection(
                title: 'UG - TY UG Girls',
                sports: {
                  // Add achievements for UG - TY UG Girls
                },
                imageAsset: 'assets/hsnc_logo.png',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSection({required String title, required List<Widget> subSections}) {
    return Card(
      elevation: 5.0,
      child: ExpansionPanelList(
        elevation: 1,
        expandedHeaderPadding: const EdgeInsets.all(10),
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              );
            },
            body: Column(
              children: subSections,
            ),
            isExpanded: true,
          ),
        ],
      ),
    );
  }

  Widget buildGameSection({required String gameTitle, required List<String> achievements, required String imageAsset}) {
    return buildSubSection(
      title: gameTitle,
      sports: {gameTitle: achievements},
      imageAsset: imageAsset,
    );
  }

  Widget buildSubSection({required String title, required Map<String, List<String>> sports, required String imageAsset}) {
    return Card(
      elevation: 2.0,
      child: ListTile(
        title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        leading: Image.asset(imageAsset, width: 50, height: 50), // Add this line for image
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: sports.entries
                .map(
                  (entry) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...entry.value.map((achievement) => Text(achievement)),
                ],
              ),
            )
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget buildDivider() {
    return const Divider(
      color: Colors.grey,
      thickness: 1,
      height: 10,
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TeamPage(),
  ));
}
