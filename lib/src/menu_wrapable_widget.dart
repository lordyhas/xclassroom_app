import 'package:flutter/material.dart';
import 'package:utils_component/utils_component.dart';

import '../data_logic/values/colors_theme.dart';


class MenuAnimatedContainer extends StatefulWidget {
  MenuAnimatedContainer({
    Key? key,
    required double startDelayFraction,
    required this.controller,
    required this.child,
  })  : topPaddingAnimation = Tween(
          begin: 60.0,
          end: 0.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.000 + startDelayFraction,
              0.400 + startDelayFraction,
              curve: Curves.ease,
            ),
          ),
        ),
        super(key: key);

  final Widget child;
  final AnimationController controller;
  final Animation<double> topPaddingAnimation;

  @override
  State<MenuAnimatedContainer> createState() => _MenuAnimatedContainerState();
}

class _MenuAnimatedContainerState extends State<MenuAnimatedContainer> {
  @override
  void dispose() {
    //if(widget.controller.is){}
    //widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        return Padding(
          padding: EdgeInsets.only(top: widget.topPaddingAnimation.value),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class MenuWrapped extends StatefulWidget {
  final MenuWrappedItem menuItem;
  final double radius;
  final double expandedRadius;
  final Size size;

  const MenuWrapped(
      {Key? key,
      required this.menuItem,
      this.radius = 16,
      this.expandedRadius = 8,
      this.size = Size.zero})
      : super(key: key);

  @override
  _MenuWrappedState createState() => _MenuWrappedState();
}

class _MenuWrappedState extends State<MenuWrapped>
    with SingleTickerProviderStateMixin {
  late bool isExpanded;
  late AnimationController controller;
  late Animation<EdgeInsetsGeometry> marginAnim;
  late Animation<BorderRadius?> radiusAnim;

  @override
  void initState() {
    super.initState();
    isExpanded = false;
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    marginAnim = Tween(
      begin: const EdgeInsets.symmetric(horizontal: 16),
      end: EdgeInsets.zero,
    ).animate(controller);
    radiusAnim = BorderRadiusTween(
      begin: BorderRadius.circular(widget.radius),
      end: BorderRadius.circular(widget.expandedRadius), //BorderRadius.zero,
    ).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Container(
            margin: marginAnim.value,
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.only().copyWith(
                bottomLeft: radiusAnim.value?.bottomLeft,
                bottomRight: radiusAnim.value?.bottomRight,
                topLeft: radiusAnim.value?.topLeft,
                topRight: radiusAnim.value?.topRight,
              ) // r,
                  ),
              color: AppTheme.nearlyBlue, //Color(0xfffB2EBF2),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () => _onTap(),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            // widget.categoryBean.icon,
                            child: Icon(
                              widget.menuItem.iconData,
                              size: 32,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              widget.menuItem.title,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ClipRect(
                      child: Align(
                        heightFactor: controller.value,
                        child: child,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: BooleanBuilder(
          check: isExpanded || controller.isDismissed,
          ifTrue: Column(
              children: widget.menuItem.items!
                  .map((item) => MenuWrappedItemWidget(item))
                  .toList()),
          ifFalse: const SizedBox(),
        ));
  }

  void _onTap() {
    isExpanded = !isExpanded;
    if (isExpanded) {
      controller.forward();
      setState(() {});
    } else {
      controller.reverse().then<void>((value) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }
  }
}

class MenuWrappedItemWidget extends StatelessWidget {
  final MenuWrappedItem categoryBeanItem;

  const MenuWrappedItemWidget(this.categoryBeanItem, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //leading: Icon(categoryBeanItem.iconData),
      onTap: categoryBeanItem.onTap,
      title: Text(
        categoryBeanItem.title,
        style: const TextStyle(color: Colors.black, fontSize: 22),
      ),
    );
  }
}

class MenuWrappedItem {
  IconData? iconData;
  String title;
  List<MenuWrappedItem>? items;
  VoidCallback? onTap;

  MenuWrappedItem({this.iconData, required this.title, this.items, this.onTap});
}
