

const bool zDebugMode = !zProfileMode && !zReleaseMode;

const bool zProfileMode = bool.fromEnvironment('dart.vm.profile');

const bool zReleaseMode = bool.fromEnvironment('dart.vm.product');


void safePrint(Object? o) {
  if (zDebugMode) {
    // ignore: avoid_print
    print(o);
  }
}


void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}