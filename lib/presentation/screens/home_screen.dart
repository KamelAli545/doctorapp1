import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/logic/doc_home/cubit.dart';
import 'package:untitled/logic/recomd_dr/cubit.dart';
import 'package:untitled/logic/recomd_dr/state.dart';
import 'package:untitled/logic/speciality/cubit.dart';
import 'package:untitled/logic/speciality/state.dart';
import 'package:untitled/presentation/screens/doctor_speciality_screen.dart';
import 'package:untitled/presentation/screens/dr_page.dart';
import 'package:untitled/presentation/screens/notification_screen.dart';
import 'package:untitled/presentation/screens/recommendation_screen.dart';
import 'package:untitled/presentation/widgets/home_widget.dart';
import 'package:untitled/presentation/widgets/recom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/presentation/widgets/speciality_widget.dart';

class HomeScreen extends StatefulWidget {
  final String? selectedDate;
  final String? selectedTime;
  const HomeScreen({super.key,
    this.selectedDate, this.selectedTime
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DoctorHomeCubit doctorCubit;
  late SpecialityCubit specializationsCubit;
  String? userName;
  final List<String> doctorImages = [
    "assets/images/Randy.png",
    "assets/images/Susan.png",
    "assets/images/Image (4).png",
    "assets/images/Image (5).png",
  ];


  @override
  void initState() {
    super.initState();
    doctorCubit = DoctorHomeCubit()..getDoctors();
    specializationsCubit = SpecialityCubit()..getSpecializations();
    loadUserName();
  }
  Future<void> loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('user_name') ?? "Guest";
    });
  }


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: doctorCubit),
        BlocProvider.value(value: specializationsCubit)
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: HomeWidget(),
        body: SingleChildScrollView(
          child: Column(
            children: [
               SizedBox(
                      width: 375,
                      height: 130,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                               Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 40),
                                 child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Hi, ${userName??'Guest'}!",
                                    style:TextStyle(
                                      color: Color.fromRGBO(36, 36, 36, 1),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18
                                    ),),
                                    SizedBox(height: 5,),
                                    Text("How Are you Today?",
                                      style:TextStyle(
                                          color: Color.fromRGBO(97, 97, 97, 1),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11
                                      ),),
                                  ],
                                 ),
                               ),
                            Container(
                                width:48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color:Color.fromRGBO(245, 245, 245, 1),
                                  borderRadius: BorderRadius.circular(48),
                                ),
                                child: InkWell(onTap: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
                                },
                                    child: Icon(Icons.notifications_active,))),
                            ]
                        ),
                      ),
            Center(
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Stack(
                        children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Container(
                            height: 160,
                            width: 343,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(36 , 124, 255, 1),
                              borderRadius: BorderRadius.circular(24)
                            ),
                            child: Padding(
                           padding: EdgeInsetsGeometry.symmetric( horizontal: 15),
                              child: Text(" Book and \n schedule with\n nearest doctor",
                              style: TextStyle(color:Color.fromRGBO(255, 255, 255, 1),
                              fontWeight: FontWeight.w500,
                                fontSize: 20
                              ),
                              ),
                            ),
                          ),
                        ),
                             SizedBox(height: 10,),
                             Positioned(
                               top: 110,
                               left: 50,
                               child: Container(

                                width: 109,
                                                         height: 38,
                                                         decoration:  BoxDecoration(borderRadius: BorderRadius.circular(48),
                                                         color: Color.fromRGBO(255, 255, 255, 1),
                                                         ),
                                child: Center(child:
                                  Text("Find Nearby",
                                   style: TextStyle(color: Color.fromRGBO(36, 124, 255, 1),
                                   fontSize: 12,
                                    fontWeight: FontWeight.w400),),),
                                                         ),
                             ),
                          Positioned(
                            left: 240,
                            child: Image.asset("assets/images/nerse.png",
                            height: 159,
                            width: 136,),
                          )
                                    ],
                                    ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  SizedBox(
                    width: 343,
                    height: 29,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text("Doctor Speciality",
                      style: TextStyle(fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color.fromRGBO(36, 36, 36, 1)),),
                    ),
                  ),
                  InkWell(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorSpecialityScreen()));
                  },
                    child: Text("See All",
                      style:TextStyle(color: Color.fromRGBO(36, 124, 255, 1),
                      fontSize: 15,fontWeight: FontWeight.w400) ,),
                  )
                ],
              ),
              BlocProvider(
                create: (_) => SpecialityCubit()..getSpecializations(),
                child: SpecialityWidget(showImages: true,
                showAllButton: false,),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 343,
                    height: 25,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text("Recommendation Doctor",
                        style: TextStyle(fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color.fromRGBO(36, 36, 36, 1)),),
                    ),
                  ),
                  InkWell(onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RecommendationScreen()));
                  },
                    child: Text("See All",
                      style:TextStyle(color: Color.fromRGBO(36, 124, 255, 1),
                          fontSize: 15,fontWeight: FontWeight.w400) ,),
                  )
                ],
              ),
              BlocProvider(create:(_)=>RecomdDrCubit()..getDoctors(),
                child: BlocBuilder<RecomdDrCubit,RecomndState>(
                  builder: (context, state) {
                    if (state is RecomndLoadingState){
                      return const Center(child: CircularProgressIndicator(),);
                    }else if (state is RecomndErrorState){
                      return Center(child: Text("error:${state.em}"),);
                    }else if (state is RecomndSuccessState){
                      final doctors=state.doctormodel;
                      return ListView.separated(
                        separatorBuilder: (_, __) => const SizedBox(height: 20),
                        itemCount: doctors.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final doc=doctors[index];
                          final imagePath = doctorImages[index % doctorImages.length];
                          return InkWell(
                            onTap: (){
                              Navigator.push(context,
                                MaterialPageRoute(
                                  builder: (context) => DrPage(
                                    doctor: doc,
                                    imagePath: imagePath,
                                  ), // pass image
                                ),
                              );
                            },
                            child: RecomWidget(
                                name: doc.name,
                                description: doc.description,
                                hostpial: doc.specialization!.name,
                                rate: doc.rating.toString(),
                                reviews: "${doc.reviewsCount } reviews",
                                imagePath:imagePath),
                          );

                        },);

                    }
                    return SizedBox.shrink();
                  },
                ),
              )

            ]
        )
        )
        ),
    );
 }
}
