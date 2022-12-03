import 'package:flutter/material.dart';

class ExeciseTile extends StatelessWidget {
  const ExeciseTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Көнүгүүлөр',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Icon(
                Icons.more_horiz,
                color: Colors.black,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 170, 241, 173),
                borderRadius: BorderRadius.circular(20)),
            child: const ListTile(
              leading: Icon(Icons.favorite),
              title: Text('сүйлөө жөндөмдөрү'),
              subtitle: Text('15 тапшырма'),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
