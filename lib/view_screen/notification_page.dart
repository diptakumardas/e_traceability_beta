import 'package:e_traceability_beta/widget/custome_appbar_uthpadon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppbarUth(title: "বিজ্ঞপ্তি"),
      body: ListView.builder(
        itemCount: 2,
          itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Container(
                      height: MediaQuery.sizeOf(context).height*.1,
                      width: MediaQuery.sizeOf(context).width*.15,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent.shade100,
                        shape: BoxShape.circle
                      ),
                      


                      child: Icon(Icons.check_box_rounded,color: Colors.greenAccent,)),
                  title: Text("মাছ বিক্রয় সম্পন্ন হয়ছে"),
                  subtitle: Text("আজ ০৯:৩০ এ.ম"),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: Colors.green.shade600,
                        ),
            onPressed: (){},child: Text("new",style: TextStyle(color: Colors.white),),),
                ),
                Text("আপনার মাছ বিক্রি সম্পন্ন হয়েছে")
              ],
            ),
          );
          },



      )
    );
  }
}
