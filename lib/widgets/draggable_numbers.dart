import 'package:flutter/material.dart';

class DraggableNumbers extends StatefulWidget {
  const DraggableNumbers({Key? key}) : super(key: key);

  @override
  State<DraggableNumbers> createState() => _DraggableNumbersState();
}

class _DraggableNumbersState extends State<DraggableNumbers> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Draggable numbers in a Stack
        SizedBox(
          height: 90, // Adjust height as needed
          child: Container(
            width: double.infinity, // Adjust width as needed
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 5,
                  left: 10,
                  child: Draggable<int>(
                    data: 1,
                    feedback: Material(
                      // Wrap in Material for visibility during drag
                      color: Colors.transparent, // No background color
                      child: Text(
                        '1', // Display the number as plain text during drag
                        style: TextStyle(
                          fontSize: 24, // Adjust size as desired
                          color: Colors.black, // Black text color
                        ),
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text('1'),
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 60,
                  child: Draggable<int>(
                    data: 2,
                    feedback: Material(
                      // Wrap in Material for visibility during drag
                      color: Colors.transparent, // No background color
                      child: Text(
                        '2', // Display the number as plain text during drag
                        style: TextStyle(
                          fontSize: 24, // Adjust size as desired
                          color: Colors.black, // Black text color
                        ),
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text('2'),
                    ),
                  ),
                ),
                // Add more numbers for the first row...
                Positioned(
                  top: 5,
                  left: 110,
                  child: Draggable<int>(
                    data: 3,
                    feedback: Material(
                      // Wrap in Material for visibility during drag
                      color: Colors.transparent, // No background color
                      child: Text(
                        '3', // Display the number as plain text during drag
                        style: TextStyle(
                          fontSize: 24, // Adjust size as desired
                          color: Colors.black, // Black text color
                        ),
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text('3'),
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 160,
                  child: Draggable<int>(
                    data: 4,
                    feedback: Material(
                      // Wrap in Material for visibility during drag
                      color: Colors.transparent, // No background color
                      child: Text(
                        '4', // Display the number as plain text during drag
                        style: TextStyle(
                          fontSize: 24, // Adjust size as desired
                          color: Colors.black, // Black text color
                        ),
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text('4'),
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 210,
                  child: Draggable<int>(
                    data: 5,
                    feedback: Material(
                      // Wrap in Material for visibility during drag
                      color: Colors.transparent, // No background color
                      child: Text(
                        '5', // Display the number as plain text during drag
                        style: TextStyle(
                          fontSize: 24, // Adjust size as desired
                          color: Colors.black, // Black text color
                        ),
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text('5'),
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 260,
                  child: Draggable<int>(
                    data: 6,
                    feedback: Material(
                      // Wrap in Material for visibility during drag
                      color: Colors.transparent, // No background color
                      child: Text(
                        '6', // Display the number as plain text during drag
                        style: TextStyle(
                          fontSize: 24, // Adjust size as desired
                          color: Colors.black, // Black text color
                        ),
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text('6'),
                    ),
                  ),
                ),
                // second row starts here
                Positioned(
                  top: 50,
                  left: 10,
                  child: Draggable<int>(
                    data: 7,
                    feedback: Material(
                      // Wrap in Material for visibility during drag
                      color: Colors.transparent, // No background color
                      child: Text(
                        '7', // Display the number as plain text during drag
                        style: TextStyle(
                          fontSize: 24, // Adjust size as desired
                          color: Colors.black, // Black text color
                        ),
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text('7'),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 60,
                  child: Draggable<int>(
                    data: 8,
                    feedback: Material(
                      // Wrap in Material for visibility during drag
                      color: Colors.transparent, // No background color
                      child: Text(
                        '8', // Display the number as plain text during drag
                        style: TextStyle(
                          fontSize: 24, // Adjust size as desired
                          color: Colors.black, // Black text color
                        ),
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text('8'),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 110,
                  child: Draggable<int>(
                    data: 9,
                    feedback: Material(
                      // Wrap in Material for visibility during drag
                      color: Colors.transparent, // No background color
                      child: Text(
                        '9', // Display the number as plain text during drag
                        style: TextStyle(
                          fontSize: 24, // Adjust size as desired
                          color: Colors.black, // Black text color
                        ),
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text('9'),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 160,
                  child: Draggable<int>(
                    data: 10,
                    feedback: Material(
                      // Wrap in Material for visibility during drag
                      color: Colors.transparent, // No background color
                      child: Text(
                        '10', // Display the number as plain text during drag
                        style: TextStyle(
                          fontSize: 24, // Adjust size as desired
                          color: Colors.black, // Black text color
                        ),
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text('10'),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 210,
                  child: Draggable<int>(
                    data: 11,
                    feedback: Material(
                      // Wrap in Material for visibility during drag
                      color: Colors.transparent, // No background color
                      child: Text(
                        '11', // Display the number as plain text during drag
                        style: TextStyle(
                          fontSize: 24, // Adjust size as desired
                          color: Colors.black, // Black text color
                        ),
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text('11'),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 260,
                  child: Draggable<int>(
                    data: 12,
                    feedback: Material(
                      // Wrap in Material for visibility during drag
                      color: Colors.transparent, // No background color
                      child: Text(
                        '12', // Display the number as plain text during drag
                        style: TextStyle(
                          fontSize: 24, // Adjust size as desired
                          color: Colors.black, // Black text color
                        ),
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text('12'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
