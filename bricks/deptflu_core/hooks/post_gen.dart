import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  final getPackagesProgress = context.logger.progress("Getting packages...");
  await Process.run('flutter', ['pub', 'get'], runInShell: true);
  getPackagesProgress.complete();

  final generateAssetsProggress = context.logger.progress(
    "Generating assets...",
  );
  await Process.run('fluttergen', [], runInShell: true);
  generateAssetsProggress.complete();

  final generateLauncherIconProgress = context.logger.progress(
    "Generating Launcher Icon",
  );
  await Process.run(
    'dart',
    ['run', 'flutter_launcher_icons'],
    runInShell: true,
  );
  generateLauncherIconProgress.complete();

  final generateProgress = context.logger.progress("Generating code...");
  await Process.run(
    'dart',
    ['run', 'build_runner', 'build', '--delete-conflicting-outputs'],
    runInShell: true,
  );
  generateProgress.complete();

  await Process.run('flutter', ['pub', 'get'], runInShell: true);
  getPackagesProgress.complete();
}
