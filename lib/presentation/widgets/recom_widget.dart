import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecomWidget extends StatefulWidget {
  String name;
  String description;
  String hostpial;
  String rate;
  String reviews;
  String imagePath;
  final Widget? trailing;


  RecomWidget({super.key,
    required this.name,
    required this.description,
    required this.hostpial,
    required this.rate,
    required this.reviews,
    required this.imagePath,
    this.trailing
  });

  @override
  State<RecomWidget> createState() => _NotifactionWidgetsState();
}

class _NotifactionWidgetsState extends State<RecomWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            ClipRRect(
                child: Image.asset(widget.imagePath,width: 74,height:74,fit: BoxFit.cover,
                )
            ),
            SizedBox(width: 20,),
             Expanded(
               child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(widget.name,
                      maxLines: 1,
                      style: TextStyle(
                          color:Color.fromRGBO(36, 36, 36, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(widget.description,
                            maxLines: 1,
                            style: TextStyle(
                                color:Color.fromRGBO(117, 117, 117, 1),
                                fontSize: 12,
                                fontWeight: FontWeight.w400
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text("|",
                        ),
                        SizedBox(width: 5,),
                        Flexible(
                          child: Text(widget.hostpial,
                            maxLines: 1,
                            style: TextStyle(
                                color:Color.fromRGBO(117, 117, 117, 1),
                                fontSize: 12,
                                fontWeight: FontWeight.w400
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.star,color: Colors.amberAccent,),
                         SizedBox(width: 5,),
                         Text(widget.rate,
                           maxLines: 1,
                           style: TextStyle(
                                fontWeight:FontWeight.w400,
                                fontSize: 10,
                                color: Color.fromRGBO(158, 158, 158, 1)
                            ),),
                        SizedBox(width: 5,),
                         Flexible(
                           child: Text((widget.reviews),
                               maxLines: 1,
                               style: TextStyle(
                                 fontWeight:FontWeight.w400,
                                 fontSize: 10,
                                 color: Color.fromRGBO(158, 158, 158, 1)
                             ),
                             overflow: TextOverflow.ellipsis,
                           ),
                         )
                      ],
                    ),
                  ],
                ),
             ),
            SizedBox(width: 25,),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: widget.trailing ?? SizedBox(width: 20),
            ),

          ],
        ),
      ),
    );
  }
}
