import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  final name = context.vars['name'] as String;

  final getPackagesProgress = context.logger.progress("Getting packages...");
  await Process.run(
    'flutter',
    ['pub', 'get'],
    runInShell: true,
    workingDirectory: name,
  );
  getPackagesProgress.complete();

  final generateAssetsProggress = context.logger.progress(
    "Generating assets...",
  );
  await Process.run(
    'fluttergen',
    [],
    runInShell: true,
    workingDirectory: name,
  );
  generateAssetsProggress.complete();

  final generateLauncherIconProgress = context.logger.progress(
    "Generating Launcher Icon",
  );
  await Process.run(
    'dart',
    ['run', 'flutter_launcher_icons'],
    runInShell: true,
    workingDirectory: name,
  );
  generateLauncherIconProgress.complete();

  final generateProgress = context.logger.progress("Generating code...");
  await Process.run(
    'dart',
    ['run', 'build_runner', 'build', '--delete-conflicting-outputs'],
    runInShell: true,
    workingDirectory: name,
  );
  generateProgress.complete();
}
