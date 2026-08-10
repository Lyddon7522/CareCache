import 'dart:async';

import 'package:flutter/material.dart';

final class CarePageScrollCoordinator extends ChangeNotifier {
  int _revision = 0;
  int? _navigationIndex;
  bool _animate = false;

  int get revision => _revision;
  int? get navigationIndex => _navigationIndex;
  bool get animate => _animate;

  void requestScrollToTop({required int navigationIndex, required bool animate}) {
    _navigationIndex = navigationIndex;
    _animate = animate;
    _revision += 1;
    notifyListeners();
  }
}

class CarePageScrollScope extends InheritedNotifier<CarePageScrollCoordinator> {
  const CarePageScrollScope({required super.notifier, required super.child, super.key});

  static CarePageScrollCoordinator? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CarePageScrollScope>()?.notifier;
  }
}

class CarePageBody extends StatefulWidget {
  const CarePageBody({
    required this.children,
    this.maxWidth = 960,
    this.padding = const EdgeInsets.fromLTRB(20, 8, 20, 112),
    this.navigationIndex,
    super.key,
  });

  final List<Widget> children;
  final double maxWidth;
  final EdgeInsets padding;
  final int? navigationIndex;

  @override
  State<CarePageBody> createState() => _CarePageBodyState();
}

class _CarePageBodyState extends State<CarePageBody> {
  final ScrollController _scrollController = ScrollController();
  int _lastHandledRevision = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final coordinator = CarePageScrollScope.maybeOf(context);
    if (coordinator == null ||
        widget.navigationIndex == null ||
        coordinator.navigationIndex != widget.navigationIndex ||
        coordinator.revision == _lastHandledRevision) {
      return;
    }
    _lastHandledRevision = coordinator.revision;
    final reduceMotion = MediaQuery.maybeOf(context)?.disableAnimations ?? false;
    _scheduleScrollToTop(animate: coordinator.animate && !reduceMotion);
  }

  void _scheduleScrollToTop({required bool animate}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_scrollController.hasClients) {
        return;
      }
      final position = _scrollController.position;
      if (position.pixels <= position.minScrollExtent) {
        return;
      }
      if (animate) {
        unawaited(
          _scrollController.animateTo(
            position.minScrollExtent,
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
          ),
        );
      } else {
        _scrollController.jumpTo(position.minScrollExtent);
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
    return ListView(
      controller: _scrollController,
      padding: widget.padding,
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: widget.maxWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: widget.children,
            ),
          ),
        ),
      ],
    );
  }
}

class CarePageHeader extends StatelessWidget {
  const CarePageHeader({
    required this.title,
    required this.subtitle,
    this.trailing,
    super.key,
  });

  final String title;
  final String subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.8,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        if (trailing != null) ...<Widget>[const SizedBox(width: 12), trailing!],
      ],
    );
  }
}
