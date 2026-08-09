import 'dart:io';

import 'package:image/image.dart' as image;

void main() {
  final masterFile = File('assets/brand/carecache-icon-1024.png');
  if (!masterFile.existsSync()) {
    throw StateError('Missing approved CareCache app-icon master: ${masterFile.path}');
  }
  final decodedMaster = image.decodePng(masterFile.readAsBytesSync());
  if (decodedMaster == null || decodedMaster.width != 1024 || decodedMaster.height != 1024) {
    throw StateError('CareCache app-icon master must be a valid 1024 × 1024 PNG.');
  }
  final master = decodedMaster.convert(numChannels: 3);
  _writePng(masterFile, master, 1024);
  final launchLogoFile = File('assets/brand/carecache-glyph-1024.png');
  if (!launchLogoFile.existsSync()) {
    throw StateError('Missing transparent CareCache glyph: ${launchLogoFile.path}');
  }
  final decodedLaunchLogo = image.decodePng(launchLogoFile.readAsBytesSync());
  if (decodedLaunchLogo == null ||
      decodedLaunchLogo.width != 1024 ||
      decodedLaunchLogo.height != 1024) {
    throw StateError('CareCache launch glyph must be a valid 1024 × 1024 PNG.');
  }
  final launchLogo = decodedLaunchLogo.convert(numChannels: 4);

  final ios = <String, int>{
    'Icon-App-20x20@1x.png': 20,
    'Icon-App-20x20@2x.png': 40,
    'Icon-App-20x20@3x.png': 60,
    'Icon-App-29x29@1x.png': 29,
    'Icon-App-29x29@2x.png': 58,
    'Icon-App-29x29@3x.png': 87,
    'Icon-App-40x40@1x.png': 40,
    'Icon-App-40x40@2x.png': 80,
    'Icon-App-40x40@3x.png': 120,
    'Icon-App-60x60@2x.png': 120,
    'Icon-App-60x60@3x.png': 180,
    'Icon-App-76x76@1x.png': 76,
    'Icon-App-76x76@2x.png': 152,
    'Icon-App-83.5x83.5@2x.png': 167,
    'Icon-App-1024x1024@1x.png': 1024,
  };
  final iosRoot = Directory('ios/Runner/Assets.xcassets/AppIcon.appiconset');
  for (final entry in ios.entries) {
    _writePng(File('${iosRoot.path}/${entry.key}'), master, entry.value);
  }
  final iosLaunchRoot = Directory('ios/Runner/Assets.xcassets/LaunchImage.imageset');
  final iosLaunch = <String, int>{
    'LaunchImage.png': 96,
    'LaunchImage@2x.png': 192,
    'LaunchImage@3x.png': 288,
  };
  for (final entry in iosLaunch.entries) {
    _writePng(File('${iosLaunchRoot.path}/${entry.key}'), launchLogo, entry.value);
  }

  final android = <String, int>{
    'mipmap-mdpi': 48,
    'mipmap-hdpi': 72,
    'mipmap-xhdpi': 96,
    'mipmap-xxhdpi': 144,
    'mipmap-xxxhdpi': 192,
  };
  for (final entry in android.entries) {
    _writePng(File('android/app/src/main/res/${entry.key}/ic_launcher.png'), master, entry.value);
    _writePng(
      File('android/app/src/main/res/${entry.key}/ic_launcher_round.png'),
      master,
      entry.value,
    );
    _writePng(
      File('android/app/src/main/res/${entry.key}/launch_image.png'),
      launchLogo,
      entry.value * 2,
    );
  }
}

void _writePng(File file, image.Image source, int size) {
  final output = size == source.width
      ? source
      : image.copyResize(
          source,
          width: size,
          height: size,
          interpolation: image.Interpolation.cubic,
        );
  file.writeAsBytesSync(image.encodePng(output, level: 9), flush: true);
}
