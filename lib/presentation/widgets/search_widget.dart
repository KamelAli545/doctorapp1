import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:untitled/logic/speciality/cubit.dart';
import 'package:untitled/presentation/widgets/speciality_widget.dart';

class SearchWidget extends StatefulWidget {
  String hintTxt;
  final Function(String)? onChanged; // for text search
  final Function(int?)? onSpecialtyChanged; // optional specialty filter
  final Function(double?)? onRatingChanged; // optional rating filter
  SearchWidget({super.key,
   required this.hintTxt,
    this.onChanged,
    this.onSpecialtyChanged,
    this.onRatingChanged,


  });

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  List <String> speciality=[
    "All","General","Neurologic","Pediatric","Radiology"
  ];
  int selectIndex=0;
  late double _rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50.0),
      child: Row(
        children: [
          Container(
            width: 300,
            height: 46,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Color.fromRGBO(245, 245, 245, 1)),
            child: Row(
              children: [
                Icon(Icons.search,color: Color.fromRGBO(194, 194, 194, 1),),
                SizedBox(width: 8,),
                Expanded(
                  child: TextFormField(
                    cursorColor: Colors.black,
                    style: TextStyle(
                        color: Colors.black
                    ),
                    decoration: InputDecoration(
                        hintText: widget.hintTxt,
                        hintStyle: TextStyle(
                            color: Color.fromRGBO(194, 194, 194, 1)
                        ),
                        border: InputBorder.none
                    ),
                    onChanged: widget.onChanged,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 5,),
          Center( child:  InkWell(onTap: (){
            showModalBottomSheet(isScrollControlled: true,
                context: context, builder: (BuildContext context){
                  return StatefulBuilder(
                   builder: (context, setState) {
                     return SingleChildScrollView(
                       child: Padding(
                         padding: const EdgeInsets.all(20.0),
                         child: Column(
                           children: [
                             SizedBox(height: 30),
                             Center(
                               child: Text("Sort By",
                                 style: TextStyle(
                                   fontWeight: FontWeight.w600,
                                   fontSize: 18,
                                 ),),
                             ),
                             Divider(),
                             SizedBox(height: 30),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Padding(
                                   padding:  EdgeInsets.symmetric(horizontal: 30.0),
                                   child: Text("Speciality",
                                     style: TextStyle(fontSize: 16,
                                       fontWeight: FontWeight.w500,
                                     ),),
                                 ),
                                 BlocProvider(
                                   create: (_) => SpecialityCubit()..getSpecializations(),
                                   child: SpecialityWidget(showImages: false,
                                     showAllButton: true,),
                                 ),

                                 // SizedBox(
                                 //   height: 60,
                                 //   child: ListView.builder(
                                 //     shrinkWrap: true,
                                 //     itemCount: speciality.length,
                                 //     scrollDirection: Axis.horizontal,
                                 //     itemBuilder: (context, index) {
                                 //       bool isSelected = index == selectIndex;
                                 //       return InkWell(
                                 //         onTap: () {
                                 //           setState(() {
                                 //             selectIndex = index;
                                 //           });
                                 //           int? speialtyId=index==0?null:index;
                                 //           if(widget.onSpecialtyChanged!=null){
                                 //             widget.onSpecialtyChanged!(speialtyId);
                                 //           }
                                 //         },
                                 //         child: Container(
                                 //           margin: EdgeInsets.symmetric(
                                 //               horizontal: 3),
                                 //           padding: EdgeInsets.symmetric(
                                 //               horizontal: 20),
                                 //           height: 41,
                                 //           decoration: BoxDecoration(
                                 //               borderRadius: BorderRadius
                                 //                   .circular(24),
                                 //               color: isSelected ? Color.fromRGBO(
                                 //                   36, 124, 255, 1) : Color
                                 //                   .fromRGBO(242, 244, 247, 1)
                                 //           ),
                                 //           child: Center(
                                 //             child: Text(speciality[index],
                                 //               style: TextStyle(color: isSelected
                                 //                   ? Colors.white
                                 //                   : Color.fromRGBO(
                                 //                   194, 194, 194, 1),
                                 //                 fontWeight: FontWeight.w400,
                                 //               ),),
                                 //
                                 //           ),
                                 //         ),
                                 //       );
                                 //     },),
                                 // )
                               ],
                             ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                        child: Text("Rating",
                                           style: TextStyle(fontSize: 16,
                                             fontWeight: FontWeight.w500,
                                           ),),
                                      ),
                                    ],
                                  ),
                                 RatingBar(
                                   maxRating: 5,
                                   minRating: 0,
                                   itemCount: 5,
                                   allowHalfRating: false,
                                   ratingWidget: RatingWidget(
                                     half: Icon(Icons.star),
                                     full: Icon(Icons.star,color: Color.fromRGBO(255, 214, 0, 1),),
                                     empty: Icon(Icons.star,color: Color.fromRGBO(224, 224, 224, 1),),),
                                   onRatingUpdate: (rating){
                                     setState((){
                                       _rating=rating;
                                     });
                                     if(widget.onRatingChanged!=null)
                                       {
                                         widget.onRatingChanged!(rating);
                                       }
                                   },
                                   updateOnDrag: true,
                                 ),
                             SizedBox(height: 40,),
                             InkWell(
                               onTap: () {
                                 Navigator.pop(context);
                               },
                               child: Container(
                                 width: 327,
                                 height: 52,
                                 decoration: BoxDecoration(
                                     color: Color.fromRGBO(36, 124, 255, 1),
                                     borderRadius: BorderRadius.circular(16)),
                                 child: Center(
                                   child: Text("Done",
                                       style: TextStyle(color: Colors.white)),
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                     );
                   }
                  );
                });
          },
              child: Icon(Icons.sort))
          )
        ],

      ),
    );
  }
}
