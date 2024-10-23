import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  final name = context.vars['name'] as String;
  final workingDir = "${name.snakeCase}";

  final getPackagesProgress = context.logger.progress("Getting packages...");
  await Process.run(
    'flutter',
    ['pub', 'get'],
    runInShell: true,
    workingDirectory: workingDir,
  );
  getPackagesProgress.complete();

  final generateLauncherIconProgress = context.logger.progress(
    "Generating Launcher Icon",
  );
  await Process.run(
    'dart',
    ['run', 'flutter_launcher_icons'],
    runInShell: true,
    workingDirectory: workingDir,
  );
  generateLauncherIconProgress.complete();

  final generateProgress = context.logger.progress("Generating code...");
  await Process.run(
    'dart',
    ['run', 'build_runner', 'build', '--delete-conflicting-outputs'],
    runInShell: true,
    workingDirectory: workingDir,
  );
  generateProgress.complete();
}
