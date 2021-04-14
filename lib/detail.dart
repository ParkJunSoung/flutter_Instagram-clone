import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final dynamic document;

  Detail(this.document);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('둘러보기'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(document['userPhotoUrl']),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          document['email'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(document['displayName'])
                      ],
                    ),
                  )
                ],
              ),
            ),
            Hero(
                tag: document['photoUrl'],
                child: Image.network(document['photoUrl'])),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(document['contents']),
            )
          ],
        ),
      ),
    );
  }
}