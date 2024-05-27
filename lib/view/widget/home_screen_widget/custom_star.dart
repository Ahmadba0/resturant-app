import 'package:flutter/material.dart';

class stars extends StatelessWidget {
  final value;
  const stars({super.key, this.value});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: value >= 1
                  ? const Icon(
                      Icons.star,
                      color: Colors.yellowAccent,
                      size: 20,
                    )
                  : const Icon(Icons.star_border, color: Colors.yellowAccent),
            ),
            GestureDetector(
              child: value >= 2
                  ? const Icon(
                      Icons.star,
                      color: Colors.yellowAccent,
                      size: 20,
                    )
                  : const Icon(Icons.star_border, color: Colors.yellowAccent),
            ),
            GestureDetector(
              child: value >= 3
                  ? const Icon(
                      Icons.star,
                      color: Colors.yellowAccent,
                      size: 20,
                    )
                  : const Icon(Icons.star_border, color: Colors.yellowAccent),
            ),
            GestureDetector(
              child: value >= 4
                  ? const Icon(
                      Icons.star,
                      color: Colors.yellowAccent,
                      size: 20,
                    )
                  : const Icon(Icons.star_border, color: Colors.yellowAccent),
            ),
            GestureDetector(
              child: value >= 5
                  ? const Icon(
                      Icons.star,
                      color: Colors.yellowAccent,
                      size: 20,
                    )
                  : const Icon(Icons.star_border, color: Colors.yellowAccent),
            )
          ],
        ),
      ),
    );
  }
}
