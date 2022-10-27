import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget profileHeaderWidget(BuildContext context) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
    child: Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 75,
                alignment: Alignment.center,
                decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.yellow, Colors.purple,],), shape: BoxShape.circle,),
                child: Container(
                  width: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage:
                      AssetImage('assets/images/fotoku.JPG'),
                  ),
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "9",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        "Posts",
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 0.4,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      Text(
                        "1.5M",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        "Followers",
                        style: TextStyle(
                          letterSpacing: 0.4,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      Text(
                        "1",
                        style: TextStyle(
                          letterSpacing: 0.4,
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        "Following",
                        style: TextStyle(
                          letterSpacing: 0.4,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Danni Hernando Haryoyudhanto",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              letterSpacing: 0.4,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "Hangker Luarbiasa\ngak percaya hubungi saja dibwh",
            style: TextStyle(
              letterSpacing: 0.4,
            ),
          ),
          SizedBox(
            height: 6),
          Text(
            "Contact : daninando@gmail.com",
            style: TextStyle(
              letterSpacing: 0.4,
              color: Colors.blue,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          actions(context),
          SizedBox(
            height: 0,
          ),
          
        ],
      ),
    ),
  );
}

Widget actions(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: OutlinedButton(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text("Edit Profile", style: TextStyle(color: Colors.black)),
          ),
          style: OutlinedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: Size(0, 30),
              side: BorderSide(
                color: Colors.grey[400],
              )),
          onPressed: () {},
        ),
      ),
    ],
  );
}

