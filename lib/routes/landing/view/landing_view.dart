import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../navigation/routes.gr.dart';

void main() {
  runApp(const LandingPage());
}

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _currentPageNotifier = ValueNotifier<int>(0);
  final controller = PageController();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SafeArea(
              child: Padding(
        padding: const EdgeInsets.only(top: 50),
        // child: Container(width: 100, height: 100, color: Colors.blue)
        child: Stack(
          children: [
            PageView(
              controller: controller,
              onPageChanged: (int idx) {
                _currentPageNotifier.value = idx;
                setState(() {
                  index = idx;
                });
              },
              children: const [
                Page1(),
                Page2(),
                Page3(),
              ],
            ),
            _buildCircleIndicator(),
          ],
        ),
      ))),
    );
  }

  _buildCircleIndicator() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: CirclePageIndicator(
          dotColor: const Color(0xFFB4C7ED),
          selectedDotColor: const Color(0xFF4E89FD),
          onPageSelected: (idx) {
            _currentPageNotifier.value = idx;
            controller.animateToPage(idx,
                duration: const Duration(milliseconds: 300),
                curve: Interval(0, 1));
            print("HERE HERE HERE ${controller.page}");
            setState(() {
              index = idx;
            });
          },
          itemCount: 3,
          currentPageNotifier: _currentPageNotifier,
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/images/Upcarta_Discover.png", height: 300),
        const Text("Discover",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 34)),
        const Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra nibh nulla ante adipiscing ut montes, eu placerat massa.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17)),
        ),
      ],
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/images/Upcarta_Organize.png", height: 300),
        const Text("Organize",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 34)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra nibh nulla ante adipiscing ut montes, eu placerat massa.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17)),
        )
      ],
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/images/Upcarta_Share.png", height: 300),
        const Text("Share",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 34)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra nibh nulla ante adipiscing ut montes, eu placerat massa.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17)),
        ),
        SizedBox(height: 50),
        ElevatedButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setBool("landingCompleted", true);
              context.router.replace(LoginScreenRoute());
            },
            child: const Text("Let's Go", style: TextStyle(fontSize: 17)),
            style: ElevatedButton.styleFrom(
                primary: const Color(0xFF4E89FD),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))))
      ],
    );
  }
}

class CirclePageIndicator extends StatefulWidget {
  static const double _defaultSize = 8.0;
  static const double _defaultSelectedSize = 8.0;
  static const double _defaultSpacing = 8.0;
  static const Color _defaultDotColor = Color(0x509E9E9E);
  static const Color _defaultSelectedDotColor = Colors.grey;

  /// The current page index ValueNotifier
  final ValueNotifier<int> currentPageNotifier;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int>? onPageSelected;

  ///The dot color
  final Color dotColor;

  ///The selected dot color
  final Color selectedDotColor;

  ///The normal dot size
  final double size;

  ///The selected dot size
  final double selectedSize;

  ///The space between dots
  final double dotSpacing;

  ///The border width of the indicator
  final double borderWidth;

  ///The borderColor is set to dotColor if not set
  final Color? borderColor;

  ///The selectedBorderColor is set to selectedDotColor if not set
  final Color? selectedBorderColor;

  CirclePageIndicator({
    Key? key,
    required this.currentPageNotifier,
    required this.itemCount,
    this.onPageSelected,
    this.size = _defaultSize,
    this.dotSpacing = _defaultSpacing,
    Color? dotColor,
    Color? selectedDotColor,
    this.selectedSize = _defaultSelectedSize,
    this.borderWidth = 0,
    this.borderColor,
    this.selectedBorderColor,
  })  : this.dotColor = dotColor ??
            ((selectedDotColor?.withAlpha(150)) ?? _defaultDotColor),
        this.selectedDotColor = selectedDotColor ?? _defaultSelectedDotColor,
        assert(borderWidth < size,
            'Border width cannot be bigger than dot size, duh!'),
        super(key: key);

  @override
  State<CirclePageIndicator> createState() => _CirclePageIndicatorState();
}

class _CirclePageIndicatorState extends State<CirclePageIndicator> {
  int _currentPageIndex = 0;
  Color? _borderColor;
  Color? _selectedBorderColor;

  @override
  void initState() {
    _readCurrentPageIndex();
    widget.currentPageNotifier.addListener(_handlePageIndex);
    _borderColor = widget.borderColor ?? widget.dotColor;
    _selectedBorderColor =
        widget.selectedBorderColor ?? widget.selectedDotColor;
    super.initState();
  }

  @override
  void dispose() {
    widget.currentPageNotifier.removeListener(_handlePageIndex);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: List<Widget>.generate(widget.itemCount, (int index) {
          double size = widget.size;
          Color color = widget.dotColor;
          Color? borderColor = _borderColor;
          if (isSelected(index)) {
            size = widget.selectedSize;
            color = widget.selectedDotColor;
            borderColor = _selectedBorderColor;
          }
          return GestureDetector(
            onTap: () => widget.onPageSelected == null
                ? null
                : widget.onPageSelected!(index),
            child: Container(
              width: size + widget.dotSpacing,
              child: Material(
                color: widget.borderWidth > 0 ? borderColor : color,
                type: MaterialType.circle,
                child: Container(
                  width: size,
                  height: size,
                  child: Center(
                    child: Material(
                      type: MaterialType.circle,
                      color: color,
                      child: Container(
                        width: size - widget.borderWidth,
                        height: size - widget.borderWidth,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }));
  }

  bool isSelected(int dotIndex) => _currentPageIndex == dotIndex;

  _handlePageIndex() {
    setState(_readCurrentPageIndex);
  }

  _readCurrentPageIndex() {
    _currentPageIndex = widget.currentPageNotifier.value;
  }
}
