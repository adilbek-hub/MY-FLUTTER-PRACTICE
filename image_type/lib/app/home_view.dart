import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const urlImage =
        'https://images.unsplash.com/photo-1618503551238-7df2c50d2236?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=423&q=80';
    const urlImage2 =
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80';

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      children: <Widget>[
        Center(
          child: Image.network(
            urlImage,
            height: 300,
            width: 400,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const CircleAvatar(
          backgroundImage: NetworkImage(urlImage2),
          radius: 120,
        ),
        const SizedBox(
          height: 16,
        ),
        CircleAvatar(
          radius: 100,
          child: ClipOval(
            child: Image.network(
              urlImage2,
              height: 300,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
