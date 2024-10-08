import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  final immutable = context.vars['immutable'];

  if (immutable == 'freezed') {
    final generateProgress = context.logger.progress("Generating code...");

    await Process.run(
      'dart',
      ['run', 'build_runner', 'build', '--delete-conflicting-outputs'],
      runInShell: true,
    );

    generateProgress.complete();
  }
}
