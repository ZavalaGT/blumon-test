import 'package:flutter/material.dart';

class Spacing01 extends StatelessWidget {
  const Spacing01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return SizedBox(height: deviceHeight * 0.01);
  }
}

class Spacing02 extends StatelessWidget {
  const Spacing02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return SizedBox(height: deviceHeight * 0.02);
  }
}

class Spacing04 extends StatelessWidget {
  const Spacing04({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return SizedBox(height: deviceHeight * 0.04);
  }
}

class Spacing08 extends StatelessWidget {
  const Spacing08({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return SizedBox(height: deviceHeight * 0.08);
  }
}
