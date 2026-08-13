import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: Pantalla2(),
    );
  }
}

class Pantalla2 extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            children: [
              // -------Titulo-----------
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Add money",
                        style: TextStyle(fontSize: 24, fontWeight: .bold),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // -------Titulo-----------
              //----------Tarjeta -----------
              SizedBox(height: 15),
              Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    "Select card",
                    style: TextStyle(fontSize: 20, fontWeight: .bold),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 120,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          child: Column(
                            crossAxisAlignment: .start,
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: .spaceBetween,
                                children: [
                                  Icon(Icons.circle, color: Colors.black),
                                  Text("Visa", style: TextStyle(fontSize: 12)),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("Debit Card"),
                                  Text(
                                    "*** 4568",
                                    style: TextStyle(fontWeight: .bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Container(
                        width: 120,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          child: Column(
                            crossAxisAlignment: .start,
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: .spaceBetween,
                                children: [
                                  Icon(Icons.circle, color: Colors.white),
                                  Text(
                                    "Mastercard",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Debit Card",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "*** 4568",
                                    style: TextStyle(
                                      fontWeight: .bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              //----------Tarjeta -----------
              // ------ Lista -------
              SizedBox(height: 15),
              Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    "Add money to NeoBank",
                    style: TextStyle(fontSize: 20, fontWeight: .bold),
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 8,
                              ),
                              child: Icon(Icons.account_balance),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Text(
                                "Move your direct deposit",
                                style: TextStyle(fontWeight: .bold),
                              ),
                            ),
                            Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 8,
                              ),
                              child: Icon(Icons.compare_arrows),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Text(
                                "Transfer from other banks",
                                style: TextStyle(fontWeight: .bold),
                              ),
                            ),
                            Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 8,
                              ),
                              child: Icon(Icons.apple_outlined),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Text(
                                "Apple pay",
                                style: TextStyle(fontWeight: .bold),
                              ),
                            ),
                            Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 8,
                              ),
                              child: Icon(Icons.card_membership),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Text(
                                "Credit/Debid Card",
                                style: TextStyle(fontWeight: .bold),
                              ),
                            ),
                            Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // ------ Lista -------
            ],
          ),
        ),
      ),
    );
  }
}
