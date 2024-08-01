import 'package:daytodate_gdsc/reusables/buttons.dart';
import 'package:flutter/material.dart';

import '../numbertodate/NumberToDate.dart';

class reviewPage extends StatefulWidget {
  const reviewPage({super.key});

  @override
  State<reviewPage> createState() => _reviewPageState();
}

class _reviewPageState extends State<reviewPage> {
  TextEditingController _controller = TextEditingController();
  int _rating = 0;

  void _setRating(int rating) {
    setState(() {
      _rating = rating;
    });
  }
  Widget _buildStar(int index) {
    return IconButton(
      icon: Icon(
        index < _rating ? Icons.star_rounded : Icons.star_border_rounded,
        color: Color(0xffCACACA),
        size: 28,
      ),
      onPressed: () => _setRating(index + 1),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xff303030),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
            child: Row(
              children: List.generate(5, (index) => _buildStar(index)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xff535353),
                  borderRadius: BorderRadius.circular(12)
              ),
              child: TextField(
                controller: _controller,
                maxLines: null,
                minLines: 5,
                keyboardType: TextInputType.multiline,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
                decoration: InputDecoration(
                  hintText: 'Write your thoughts',
                  hintStyle: TextStyle(
                    color: Color(0xffA2A2A2),
                    fontSize: 18.0,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey,width: 0.3),
                      borderRadius: BorderRadius.circular(12)

                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey,width: 0.3),
                      borderRadius: BorderRadius.circular(12)

                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey,width: 0.3),
                    borderRadius: BorderRadius.circular(12)
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          blackButton(text: 'SUBMIT REVIEW',  onTab: (){
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return BottomSheet();
                  },
                ); },),
          SizedBox(height: 20),


        ],
      ),
    );
  }
  Widget BottomSheet(){
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xff535353),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 32,),
          ClipOval(
            child: Image.asset(
              'assets/feedback.png',
              fit: BoxFit.cover,
              height: 100,
              width: 100,
            ),
          ),
          SizedBox(height: 16,),
          Text("Thanks for giving \nyour feedback ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 36,color: Colors.white),textAlign: TextAlign.center,),
          SizedBox(height: 8,),

          Text("Your feedback means a lot for us and \nhelp us to improve our services.",style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,),
          Spacer(),
          blackButton(text: "DONE", onTab: (){Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NumberToDate()),
          );} ),
          SizedBox(height: 16,),
        ],
      ),

    );
  }
}
