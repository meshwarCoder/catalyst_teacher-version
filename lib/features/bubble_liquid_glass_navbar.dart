import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// بيانات كل عنصر في الـ Navigation Bar
class LiquidGlassNavItem {
  final IconData icon;
  final String label;

  const LiquidGlassNavItem({required this.icon, required this.label});
}

/// الـ Navigation Bar الرئيسية (مفيش فيها أي تعديل)
class LiquidBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<LiquidGlassNavItem> items;
  final Color backgroundColor;
  final Color itemColor;
  final Color bubbleColor;
  final double backgroundOpacity;
  final double bubbleOpacity;
  final double blurStrength;
  final double height;
  final double borderRadius;
  final double bubbleWidth;
  final double bubbleHeight;
  final double iconSize;
  final double fontSize;
  final bool showBubble;
  final bool enableDragging;
  final bool jumpOnDrag; // 👈 الإضافة الجديدة هنا
  final double elevation;
  final double bottomPadding;
  final double horizontalPadding;
  final Color? bubbleBorderColor;
  final double bubbleBorderWidth;
  final int animationDuration;

  const LiquidBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    this.backgroundColor = Colors.white,
    this.itemColor = Colors.white,
    this.bubbleColor = Colors.white,
    this.backgroundOpacity = 0.2,
    this.bubbleOpacity = 0.25,
    this.blurStrength = 10.0,
    this.height = 65,
    this.borderRadius = 50,
    this.bubbleWidth = 96,
    this.bubbleHeight = 60,
    this.iconSize = 26,
    this.fontSize = 11,
    this.showBubble = true,
    this.enableDragging = true,
    this.jumpOnDrag = false, // 👈 القيمة الافتراضية false
    this.elevation = 10,
    this.bottomPadding = 25,
    this.horizontalPadding = 20,
    this.bubbleBorderColor,
    this.bubbleBorderWidth = 1.0,
    this.animationDuration = 300,
  });

  @override
  State<LiquidBottomNavBar> createState() => _LiquidBottomNavBarState();
}

class _LiquidBottomNavBarState extends State<LiquidBottomNavBar> {
  double dragPosition = 0;
  bool isDragging = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;
        final itemWidth = availableWidth / widget.items.length;

        return GestureDetector(
          onHorizontalDragStart: widget.enableDragging
              ? (_) => setState(() => isDragging = true)
              : null,
          onHorizontalDragUpdate: widget.enableDragging
              ? (details) {
                  setState(() {
                    dragPosition += details.delta.dx;
                    dragPosition = dragPosition.clamp(
                      0.0,
                      (widget.items.length - 1) * itemWidth,
                    );
                  });

                  final currentIndexDuringDrag = (dragPosition / itemWidth)
                      .round();

                  // 👇 لو jumpOnDrag = true يتحرك بين الصفحات أثناء السحب
                  if (widget.jumpOnDrag &&
                      currentIndexDuringDrag != widget.currentIndex) {
                    widget.onTap(currentIndexDuringDrag);
                  }
                }
              : null,
          onHorizontalDragEnd: widget.enableDragging
              ? (_) {
                  final index = (dragPosition / itemWidth).round();

                  // 👇 دايماً لما تسيب إيدك، ينتقل للصفحة دي
                  widget.onTap(index);

                  setState(() {
                    dragPosition = index * itemWidth;
                    isDragging = false;
                  });
                }
              : null,
          child: Material(
            elevation: widget.elevation,
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: widget.blurStrength,
                  sigmaY: widget.blurStrength,
                ),
                child: Container(
                  height: widget.height,
                  decoration: BoxDecoration(
                    color: widget.backgroundColor.withOpacity(
                      widget.backgroundOpacity,
                    ),
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                  ),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      if (widget.showBubble)
                        AnimatedPositioned(
                          duration: Duration(
                            milliseconds: widget.animationDuration,
                          ),
                          curve: Curves.easeOutCubic,
                          left:
                              ((isDragging
                                          ? dragPosition
                                          : widget.currentIndex * itemWidth) +
                                      (itemWidth / 2) -
                                      (widget.bubbleWidth / 2))
                                  .clamp(
                                    0,
                                    availableWidth - widget.bubbleWidth,
                                  ),
                          top: (widget.height - widget.bubbleHeight) / 2,
                          child: Container(
                            width: widget.bubbleWidth,
                            height: widget.bubbleHeight,
                            decoration: BoxDecoration(
                              color: widget.bubbleColor.withOpacity(
                                widget.bubbleOpacity,
                              ),
                              borderRadius: BorderRadius.circular(
                                widget.borderRadius,
                              ),
                              border: Border.all(
                                color:
                                    (widget.bubbleBorderColor ??
                                            widget.bubbleColor)
                                        .withOpacity(0.3),
                                width: widget.bubbleBorderWidth,
                              ),
                            ),
                          ),
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(widget.items.length, (index) {
                          final item = widget.items[index];
                          final isSelected = index == widget.currentIndex;

                          return SizedBox(
                            width: itemWidth,
                            child: GestureDetector(
                              onTap: () {
                                widget.onTap(index);
                                if (widget.enableDragging) {
                                  setState(() {
                                    dragPosition = index * itemWidth;
                                  });
                                }
                              },
                              behavior: HitTestBehavior.translucent,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    item.icon,
                                    color: widget.itemColor.withOpacity(0.9),
                                    size: widget.iconSize,
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    item.label,
                                    style: TextStyle(
                                      fontSize: widget.fontSize,
                                      color: widget.itemColor.withOpacity(0.9),
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// النسخة الوحيدة اللي يستخدمها المستخدم (بإخفاء تلقائي + كل الإعدادات)
class LiquidGlassNavBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onPageChanged;
  final List<Widget> pages;
  final List<LiquidGlassNavItem> items;

  // جميع الإعدادات الخاصة بالـ NavBar
  final Color backgroundColor;
  final Color itemColor;
  final Color bubbleColor;
  final double backgroundOpacity;
  final double bubbleOpacity;
  final double blurStrength;
  final double height;
  final double borderRadius;
  final double bubbleWidth;
  final double bubbleHeight;
  final double iconSize;
  final double fontSize;
  final bool showBubble;
  final bool enableDragging;
  final double elevation;
  final double bottomPadding;
  final double horizontalPadding;
  final Color? bubbleBorderColor;
  final double bubbleBorderWidth;
  final int animationDuration;
  final bool jumpOnDrag;

  const LiquidGlassNavBar({
    super.key,
    required this.currentIndex,
    required this.onPageChanged,
    required this.pages,
    required this.items,
    this.backgroundColor = Colors.white,
    this.itemColor = Colors.white,
    this.bubbleColor = Colors.white,
    this.backgroundOpacity = 0.2,
    this.bubbleOpacity = 0.25,
    this.blurStrength = 10.0,
    this.height = 65,
    this.borderRadius = 50,
    this.bubbleWidth = 96,
    this.bubbleHeight = 60,
    this.iconSize = 26,
    this.fontSize = 11,
    this.showBubble = true,
    this.enableDragging = true,
    this.elevation = 10,
    this.bottomPadding = 25,
    this.horizontalPadding = 20,
    this.bubbleBorderColor,
    this.bubbleBorderWidth = 1.0,
    this.animationDuration = 300,
    this.jumpOnDrag = false,
  });

  @override
  State<LiquidGlassNavBar> createState() => _LiquidGlassNavBarState();
}

class _LiquidGlassNavBarState extends State<LiquidGlassNavBar> {
  bool _isNavVisible = true;
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
    _pageController = PageController(initialPage: widget.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              if (notification.direction == ScrollDirection.reverse) {
                if (_isNavVisible) setState(() => _isNavVisible = false);
              } else if (notification.direction == ScrollDirection.forward) {
                if (!_isNavVisible) setState(() => _isNavVisible = true);
              }
              return false;
            },
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
                widget.onPageChanged(index);
              },
              children: widget.pages,
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInOut,
            bottom: _isNavVisible ? widget.bottomPadding : -120,
            left: widget.horizontalPadding,
            right: widget.horizontalPadding,
            child: IgnorePointer(
              ignoring: !_isNavVisible,
              child: LiquidBottomNavBar(
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() => _currentIndex = index);
                  _pageController.jumpToPage(index);
                },
                jumpOnDrag: widget.jumpOnDrag,
                items: widget.items,
                backgroundColor: widget.backgroundColor,
                itemColor: widget.itemColor,
                bubbleColor: widget.bubbleColor,
                backgroundOpacity: widget.backgroundOpacity,
                bubbleOpacity: widget.bubbleOpacity,
                blurStrength: widget.blurStrength,
                height: widget.height,
                borderRadius: widget.borderRadius,
                bubbleWidth: widget.bubbleWidth,
                bubbleHeight: widget.bubbleHeight,
                iconSize: widget.iconSize,
                fontSize: widget.fontSize,
                showBubble: widget.showBubble,
                enableDragging: widget.enableDragging,
                elevation: widget.elevation,
                bottomPadding: 0,
                horizontalPadding: 0,
                bubbleBorderColor: widget.bubbleBorderColor,
                bubbleBorderWidth: widget.bubbleBorderWidth,
                animationDuration: widget.animationDuration,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
