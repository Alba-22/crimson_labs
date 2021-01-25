import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HomeItemWidget extends StatelessWidget {

  final String title;
  final IconData icon;
  final Function onTap;
  final String description;

  const HomeItemWidget({
    Key key,
    @required this.title,
    @required this.icon,
    @required this.onTap,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "$title",
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16
                      ),
                    ),
                    description != null
                    ? AutoSizeText(
                      "$description",
                      maxLines: 3,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    )
                    : Container()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
