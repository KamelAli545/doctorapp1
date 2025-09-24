import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/logic/speciality/cubit.dart';
import 'package:untitled/logic/speciality/state.dart';

class SpecialityWidget extends StatefulWidget {
  final bool showImages; // 👈 show icon + text (home) or just chip style (search)
  final bool showAllButton; // 👈 add "All" button at the start
  final Function(int?)? onSpecialtySelected; // 👈 notify parent (SearchScreen)

  const SpecialityWidget({
    super.key,
    this.showImages = true,
    this.showAllButton = true,
    this.onSpecialtySelected,
  });

  @override
  State<SpecialityWidget> createState() => _SpecialityWidgetState();
}

class _SpecialityWidgetState extends State<SpecialityWidget> {
  final List<String> specialityIcons = [
    "assets/images/Man Doctor Europe 1.png",
    "assets/images/Brain 1.png",
    "assets/images/Iamge.png",
    "assets/images/Kidneys 1.png",
  ];

  int selectedIndex = 0; // default: first item ("All" if enabled)

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecialityCubit, SpecialityState>(
      builder: (context, state) {
        if (state is SpecialityLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SpecialityErrorState) {
          return Center(child: Text(state.em));
        } else if (state is SpecialitySuccessState) {
          final specialities = state.specialization;
          if (specialities.isEmpty) {
            return const Center(child: Text("No specialities found"));
          }

          // Build items list (with or without "All")
          final items = widget.showAllButton
              ? ["All", ...specialities.map((e) => e.name ?? "Unknown")]
              : specialities.map((e) => e.name ?? "Unknown").toList();

          return SizedBox(
            height: widget.showImages ? 90 : 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final isSelected = index == selectedIndex;

                // Case: "All" button
                if (widget.showAllButton && index == 0) {
                  return GestureDetector(
                    onTap: () {
                      setState(() => selectedIndex = index);
                      widget.onSpecialtySelected?.call(null); // null = no filter
                    },
                    child: _buildChip(
                      text: "All",
                      isSelected: isSelected,
                    ),
                  );
                }

                // Case: real speciality
                final specialityIndex =
                widget.showAllButton ? index - 1 : index;
                final speciality = specialities[specialityIndex];

                return GestureDetector(
                  onTap: () {
                    setState(() => selectedIndex = index);
                    widget.onSpecialtySelected?.call(speciality.id);
                  },
                  child: widget.showImages
                      ? _buildIconItem(
                    speciality.name ?? "Unknown",
                    specialityIcons[specialityIndex %
                        specialityIcons.length],
                    isSelected,
                  )
                      : _buildChip(
                    text: speciality.name ?? "Unknown",
                    isSelected: isSelected,
                  ),
                );
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  /// Build chip-style item (used in SearchScreen)
  Widget _buildChip({required String text, required bool isSelected}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: isSelected
            ? const Color.fromRGBO(36, 124, 255, 1)
            : const Color.fromRGBO(242, 244, 247, 1),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color:
            isSelected ? Colors.white : const Color.fromRGBO(194, 194, 194, 1),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  /// Build icon + text item (used in HomeScreen)
  Widget _buildIconItem(String text, String iconPath, bool isSelected) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: isSelected
                ? Border.all(color: const Color.fromRGBO(36, 124, 255, 1))
                : null,
          ),
          child: Center(
            child: Image.asset(
              iconPath,
              width: 32,
              height: 32,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
