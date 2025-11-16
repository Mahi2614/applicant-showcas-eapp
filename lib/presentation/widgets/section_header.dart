import 'package:assetwize/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatefulWidget {
  final TabController controller;
  final List<Map<String, String>> tabs;

  const SectionHeader({
    super.key,
    required this.controller,
    required this.tabs,
  });

  @override
  State<SectionHeader> createState() => _SectionHeaderState();
}

class _SectionHeaderState extends State<SectionHeader> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToSelected(int index) {
    double screenWidth = MediaQuery.of(context).size.width;
    double offset = (index * 100) - screenWidth / 2 + 50;
    if (offset < 0) offset = 0;
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (mounted && !widget.controller.indexIsChanging) {
        setState(() {});
        _scrollToSelected(widget.controller.index);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isWideScreen = screenWidth > 800; // 💻 threshold for PC/tablet

    return Container(
      child: Stack(
        children: [
          // bottom divider line
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(height: 2, color: lightGrey),
          ),

          // 📱 MOBILE: Scrollable tabs
          // 💻 PC/TABLET: Expanded full width tabs
          isWideScreen
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget.tabs.asMap().entries.map((entry) {
                    int index = entry.key;
                    bool isSelected = widget.controller.index == index;
                    Map<String, String> tab = entry.value;

                    return GestureDetector(
                      onTap: () => widget.controller.animateTo(index),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 20),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            child: Image.asset(
                              tab["icon"]!,
                              height: 50,
                              width: 50,
                              color: isSelected ? teal : greyDark,
                            ),
                          ),
                          const SizedBox(height: 6),
                          AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 200),
                            style: TextStyle(
                              color: isSelected ? teal : greyDark,
                              fontSize: 13,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                            child: Text(tab["title"]!),
                          ),
                          const SizedBox(height: 8),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: 3,
                            width: 80,
                            color: isSelected ? teal : transparent,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                )
              : SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: widget.tabs.asMap().entries.map((entry) {
                      int index = entry.key;
                      bool isSelected = widget.controller.index == index;
                      Map<String, String> tab = entry.value;

                      return GestureDetector(
                        onTap: () => widget.controller.animateTo(index),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 20),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                child: Image.asset(
                                  tab["icon"]!,
                                  height: 40,
                                  width: 40,
                                  color: isSelected ? teal : greyDark,
                                ),
                              ),
                              const SizedBox(height: 6),
                              AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 200),
                                style: TextStyle(
                                  color: isSelected ? teal : greyDark,
                                  fontSize: 12,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                                child: Text(tab["title"]!),
                              ),
                              const SizedBox(height: 10),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                height: 3,
                                width: 80,
                                color: isSelected ? teal : transparent,
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
        ],
      ),
    );
  }
}
