import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/logic/search/cubit.dart';
import 'package:untitled/logic/search/state.dart';
import 'package:untitled/logic/speciality/cubit.dart';
import 'package:untitled/presentation/screens/dr_page.dart';
import 'package:untitled/presentation/widgets/button_widget.dart';
import 'package:untitled/presentation/widgets/home_widget.dart';
import 'package:untitled/presentation/widgets/recom_widget.dart';
import 'package:untitled/presentation/widgets/search_widget.dart';
import 'package:untitled/presentation/widgets/speciality_widget.dart';
import 'package:untitled/presentation/widgets/upper_bar.dart';
import 'package:untitled/data/doctor_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List <String> speciality=[
    "All","General","Neurologic","Pediatric","Radiology"
  ];
  int selectIndex=0;
  int? selectedSpecialtyId;
  String searchText = "";
  double? selectedRating;
  final List<String> doctorImages = [
    "assets/images/Randy.png",
    "assets/images/Susan.png",
    "assets/images/Image (4).png",
    "assets/images/Image (5).png",
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=>SearchCubit()..getAllDoctors(),
      child:
             Builder(
               builder: (context){
               return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: UpperBar(title: "Search"),),
                bottomNavigationBar: HomeWidget(),
                body: Column(
                      children: [SearchWidget(hintTxt: "Search",
                        onChanged: (text) {
                          setState(() => searchText = text);
                          context.read<SearchCubit>().searchDoctors(query: searchText,specialtyId: selectedSpecialtyId);

                        },
                      ),
                        SizedBox(
                          height: 10,
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
                        //             selectedSpecialtyId =
                        //             index == 0 ? null : index; // map to ID
                        //           });
                        //           context.read<SearchCubit>().searchDoctors(
                        //               query: searchText, specialtyId: selectedSpecialtyId);
                        //         },
                        //         child: Container(
                        //           margin: EdgeInsets.symmetric(
                        //               horizontal: 8),
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
                        // ),
                        BlocProvider(
                          create: (_) => SpecialityCubit()..getSpecializations(),
                          child: SpecialityWidget(showImages: false,
                          showAllButton: true,
                          onSpecialtySelected: (id){
                            setState(() =>selectedSpecialtyId=id);
                            context.read<SearchCubit>().searchDoctors(query: searchText,specialtyId: selectedSpecialtyId);
                          },),
                        ),
                        SizedBox(height: 10,),
                        Expanded(
                          child: BlocBuilder<SearchCubit, SearchState>(
                            builder: (context, state) {
                              if (state is SearchLoadingState) {
                                return const Center(child: CircularProgressIndicator());
                              } else if (state is SearchSuccessState) {
                                final doctors = state.doctormodel;
                                if (doctors.isEmpty) {
                                  return const Center(child: Text("No doctor found"));
                                }
                                return ListView.separated(
                                  separatorBuilder: (_, __) => const SizedBox(height: 20),
                                  itemCount: doctors.length,
                                  itemBuilder: (context, index) {
                                    final doc = doctors[index];
                                    final imagePath = doctorImages[index % doctorImages.length];
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DrPage(
                                              doctor: doc,
                                              imagePath: imagePath,
                                            ),
                                          ),
                                        );
                                      },
                                      child: RecomWidget(
                                        name: doc.name,
                                        description: doc.description,
                                        hostpial: doc.specialization!.name,
                                        rate: doc.rating.toString(),
                                        reviews: "${doc.reviewsCount} reviews",
                                        imagePath: imagePath,
                                      ),
                                    );
                                  },
                                );
                              } else if (state is SearchErrorState) {
                                return Center(child: Text("Error: ${state.em}"));
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                      ],
                  ),
                );
               },
             ),
    );
  }
}
