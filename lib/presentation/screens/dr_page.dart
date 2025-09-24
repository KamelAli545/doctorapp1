import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled/presentation/screens/book_apponint.dart';
import 'package:untitled/presentation/widgets/recom_widget.dart';
import 'package:untitled/presentation/widgets/reviews_widget.dart';
import 'package:untitled/presentation/widgets/upper_bar.dart';
import 'package:flutter/material.dart';
import 'package:untitled/data/doctor_model.dart';

class DrPage extends StatefulWidget {
  final DoctorModel doctor;
  final String imagePath;
  const DrPage({super.key, required this.doctor,required this.imagePath});

  @override
  State<DrPage> createState() => _DrPageState();
}

class _DrPageState extends State<DrPage> {
  TextEditingController reviewcontroller= TextEditingController();
late double _rating;
  @override
  Widget build(BuildContext context) {
    final doctor =widget.doctor;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          title: UpperBar(title:
            doctor.name,
            trailing: Icon(Icons.more_horiz),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            RecomWidget(
              imagePath: widget.imagePath,
              rate: doctor.rating.toString(),
              description: doctor.description,
              hostpial: doctor.specialization!.name ?? "Unknown Hospital",
              name: doctor.name,
              reviews: "${doctor.reviewsCount} reviews",
              trailing: InkWell(onTap: (){
                showModalBottomSheet(isScrollControlled: true,
                    context: context, builder: (BuildContext context){
                  return SizedBox(
                    height: 515,
                    width: 375,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          Center(
                            child: Text("Give Rate",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),),
                          ),
                          Divider(),
                          SizedBox(height: 30),
                          RatingBar(
                                maxRating: 5,
                                  minRating: 0,
                                  allowHalfRating: false,
                                  ratingWidget: RatingWidget(
                                    half: Icon(Icons.star),
                                      full: Icon(Icons.star,color: Color.fromRGBO(255, 214, 0, 1),),
                                      empty: Icon(Icons.star,color: Color.fromRGBO(224, 224, 224, 1),),),
                                  onRatingUpdate: (rating){
                                  setState((){
                                    _rating=rating;
                                  });
                                  },
                                updateOnDrag: true,
                                  ),
                          SizedBox(height: 30),
                          Center(
                            child: Text("Share your feedback about the doctor",
                            style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(height: 40),

                          Center(child:SizedBox(
                            width: 344,
                            height: 93,
                            child: TextFormField(
                              maxLines: 5,
                              minLines: 1,
                              cursorColor: Colors.black,
                                controller: reviewcontroller,
                              decoration: InputDecoration(
                                fillColor: Color.fromRGBO(158, 158, 158, 1),
                                border:  OutlineInputBorder(borderRadius: BorderRadius.circular(12)
                                ),
                                hintText: "Your review",
                                hintStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 12,color: Color.fromRGBO(158, 158, 158, 1),
                                )
                              ),

                                ),
                          )
                          ),
                          SizedBox(height: 90,),
                          InkWell(
                            onTap: (){
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
                });
              },
                  child: Icon(Icons.message_outlined)),
            ),
            Container(
              color: Colors.white,
              child: TabBar(
                isScrollable: false,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Color.fromRGBO(36, 124, 255, 1),
                indicatorWeight: 3,
                labelColor: Color.fromRGBO(36, 124, 255, 1),
                unselectedLabelColor: Color.fromRGBO(158, 158, 158, 1),
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
                tabs: [
                  Tab(text: "About"),
                  Tab(text: "Location"),
                  Tab(text: "Reviews"),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView(
                    children: [
                      Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 30),                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                               Text("About me",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight:  FontWeight.w600
                              ),),
                            SizedBox(height: 5,),
                            Text( doctor.description != null && doctor.description!.isNotEmpty
                                ? doctor.description!
                                : "Dr. ${doctor.name} is available for consultation.\n"
                                "Contact: ${doctor.phone ?? "N/A"}\n"
                                "Email: ${doctor.email ?? "N/A"}",
                            style: TextStyle(fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color.fromRGBO(117, 117, 117 ,1)
                            ),
                            ),
                            SizedBox(height: 15,),
                            Text("Working Time",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight:  FontWeight.w600
                              ),),
                            SizedBox(height: 5,),
                            Text(doctor.startTime != null && doctor.endTime != null
                                ? "Monday - Friday, ${doctor.startTime} - ${doctor.endTime}"
                                : "Working hours not available",
                              style: TextStyle(fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color.fromRGBO(117, 117, 117 ,1)
                              ),
                            ),
                            SizedBox(height: 15,),
                            Text("STR",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight:  FontWeight.w600
                              ),),
                            SizedBox(height: 5,),
                            Text(doctor.id.toString(),
                              style: TextStyle(fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color.fromRGBO(117, 117, 117 ,1)
                              ),
                            ),
                            SizedBox(height: 15,),
                            Text("Pengalaman Praktik",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight:  FontWeight.w600
                              ),),
                            SizedBox(height: 10,),
                            Text("RSPAD Gatot Soebroto",
                              style: TextStyle(fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color.fromRGBO(36, 36, 36 ,1)
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text("2017 - sekarang",
                              style: TextStyle(fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color.fromRGBO(117, 117, 117 ,1)
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 30),
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Practice Place",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight:  FontWeight.w600
                            ),),
                          SizedBox(height: 5,),
                          Text(doctor.address??"unknown",
                            style: TextStyle(fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color.fromRGBO(117, 117, 117 ,1)
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text("Location",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight:  FontWeight.w600
                            ),),
                          SizedBox(height: 10,),
                          SizedBox(height: 200,
                          child: GoogleMap(initialCameraPosition: CameraPosition(
                              target: LatLng(30.0444, 31.2357),
                          zoom: 14,
                          ),
                             markers: {
                            Marker(markerId: MarkerId("clinic"),
                            position: LatLng(30.0444, 31.2357),
                            infoWindow: InfoWindow(title: "Dr Randy Wigham"))
                             },
                          ),
                          ),
                        ],
                      ),
                      )
                    ],
                  ),
                  ListView(
                    children: [
                      ReviewsWidget(
                          name: "Jane Cooper",
                          description: "As someone who lives in a remote area with limited access to healthcare, this telemedicine app has been a game changer for me. I can easily schedule virtual appointments with doctors and get the care I need without having to travel long distances.",
                          imagePath: "assets/images/Rectangle.png"),
                      ReviewsWidget(
                          name: "Robert Fox",
                          description: "As someone who lives in a remote area with limited access to healthcare, this telemedicine app has been a game changer for me. I can easily schedule virtual appointments with doctors and get the care I need without having to travel long distances.",
                          imagePath: "assets/images/Rectangle 318.png"),
                      ReviewsWidget(
                          name: "Jane Cooper",
                          description: "As someone who lives in a remote area with limited access to healthcare, this telemedicine app has been a game changer for me. I can easily schedule virtual appointments with doctors and get the care I need without having to travel long distances.",
                          imagePath: "assets/images/Rectangle.png")

                    ],
                  ),
                ],
              ),
            ),

            InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BookApponint(
                  imagePath: widget.imagePath,
                doctor: widget.doctor,)));
              },
              child: Container(
                width: 327,
                height: 52,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(36, 124, 255, 1),
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                  child: Text("Make An Appointment",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
