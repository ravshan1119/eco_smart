import 'package:flutter/material.dart';
import 'rotate_icon.dart';
import 'text_widget.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    super.key,
    required this.items,
    this.onChange,
    this.value,
    this.enable,
    this.errorText,
    this.error,
    this.onTap,
    this.fillColor,
    this.maxHeight,
  });

  final List<String> items;

  final Function(String)? onChange;

  final Function()? onTap;

  final String? value;

  final bool? enable;

  final String? errorText;

  final bool? error;

  final Color? fillColor;

  final double? maxHeight;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown>
    with TickerProviderStateMixin {
  OverlayEntry? _overlayEntry;
  OverlayEntry? _barrierOverlay;
  final LayerLink _layerLink = LayerLink();
  OverlayState? overlayState;
  late AnimationController _controller;

  // String? value;

  Function(String)? get onChange => widget.onChange;

  Function()? get onTap => widget.onTap;

  List<String> get items => widget.items;

  bool? get enable => widget.enable;

  String? get value => widget.value;

  String? get errorText => widget.errorText;

  bool? get error => widget.error;

  @override
  void initState() {
    super.initState();
    overlayState = Overlay.of(context);

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
  }

  _showOverlay() {
    _createOverlay();
    _openOutSideClickOverlay();
    overlayState!.insert(_overlayEntry!);
  }

  _createOverlay() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    _controller.forward();
    Size size = renderBox.size;
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height),
          child: SizeTransition(
            sizeFactor: _controller,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  constraints:
                      BoxConstraints(maxHeight: widget.maxHeight ?? 150),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                            items.length,
                            (index) => _listTile(
                                title: items[index],
                                onTap: () {
                                  if (onChange != null) {
                                    onChange!(items[index]);
                                  }
                                  _hideOverlay();
                                })),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _listTile({required String title, required Function() onTap}) {
    return ListTile(
      onTap: onTap,
      title: TextWidget(
          text: title,
          maxLines: 1,
          textColor: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 15),
    );
  }

  _openOutSideClickOverlay() {
    _barrierOverlay = OverlayEntry(builder: (context) {
      return GestureDetector(
        onTap: () {
          _hideOverlay();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.transparent,
        ),
      );
    });
    overlayState!.insert(_barrierOverlay!);
  }

  _hideOverlay() {
    _controller.reverse().then((value) {
      _barrierOverlay!.remove();
      _overlayEntry!.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
        link: _layerLink,
        child: AnimatedBuilder(
          animation: _controller.view,
          builder: (context, _) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: !(error ?? false)
                          ? Colors.black45.withOpacity(.1)
                          : Colors.red,
                    ),
                    color: widget.fillColor),
                child: InkWell(
                  onTap: (enable ?? true)
                      ? () {
                          if (onTap != null) {
                            onTap!();
                          }
                          if (items.isEmpty) {
                            return;
                          }
                          _showOverlay();
                        }
                      : null,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextWidget(
                              text: value ?? '',
                              textColor: Colors.black,
                              maxLines: 1,
                              overFlow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        RotateIcon(
                          rotate: _controller.isCompleted,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              (error ?? false)
                  ? Padding(
                      padding: const EdgeInsets.only(left: 16, top: 8),
                      child: TextWidget(
                          text: errorText ?? '',
                          textColor: Colors.red,
                          fontWeight: FontWeight.w400,
                          fontSize: 13),
                    )
                  : const SizedBox()
            ],
          ),
        ));
  }

  @override
  void dispose() {
    if (_controller.isCompleted) {
      _barrierOverlay!.remove();
      _overlayEntry!.remove();
    }
    _controller.dispose();
    super.dispose();
  }
}
