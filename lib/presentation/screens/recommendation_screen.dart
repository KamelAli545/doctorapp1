import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/logic/recomd_dr/cubit.dart';
import 'package:untitled/logic/recomd_dr/state.dart';
import 'package:untitled/presentation/screens/dr_page.dart';
import 'package:untitled/presentation/widgets/recom_widget.dart';
import 'package:untitled/presentation/widgets/search_widget.dart';
import 'package:untitled/presentation/widgets/upper_bar.dart';
import 'package:flutter/material.dart';

class RecommendationScreen extends StatefulWidget {
  const RecommendationScreen({super.key});

  @override
  State<RecommendationScreen> createState() => _RecommendationScreenState();
}

class _RecommendationScreenState extends State<RecommendationScreen> {
  final List<String> doctorImages = [
    "assets/images/Randy.png",
    "assets/images/Susan.png",
    "assets/images/Image (4).png",
    "assets/images/Image (5).png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        automaticallyImplyLeading: false,
        title:               UpperBar(
        title: "Recommendation Doctor",
        trailing: Icon(Icons.more_horiz_outlined),),
          ),
      body:  SingleChildScrollView(
          child: Column(
            children: [
              SearchWidget(hintTxt: "Search"),
              SizedBox(height: 20,),
              BlocProvider(create:(_)=>RecomdDrCubit()..getDoctors(),
                child: BlocBuilder<RecomdDrCubit,RecomndState>(
                  builder: (context, state) {
                    if (state is RecomndLoadingState){
                      return const Center(child: CircularProgressIndicator(),);
                    }else if (state is RecomndErrorState){
                      return  Center(
                        child: Column(
                          children: [
                            Text("Error: ${state.em}"),
                            ElevatedButton(
                              onPressed: () {
                                context.read<RecomdDrCubit>().getDoctors();
                              },
                              child: const Text("Retry"),
                            ),
                          ],
                        ),
                      );
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

            ],
          )
      ),





    );
  }
}
