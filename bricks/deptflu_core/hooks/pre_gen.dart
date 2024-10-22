import 'package:deptflu_core_hooks/hook_utils.dart';
import 'package:mason/mason.dart';

void run(HookContext context) {
  final name = context.vars['name'];
  final immutable = context.vars['immutable'];
  final stateManagement = context.vars['state_management'];
  final org = context.vars['org'] as String;
  final orgName = org.split('.').last;
  final orgDomain = org.split('.').first;

  final isUsingEquatable = immutable == 'equatable';
  final isUsingFreezed = immutable == 'freezed';

  final isUsingBloc = stateManagement == 'bloc';

  context.vars['using_equatable'] = isUsingEquatable;
  context.vars['using_freezed'] = isUsingFreezed;

  context.vars['using_bloc'] = isUsingBloc;

  context.vars['org_name'] = orgName;
  context.vars['org_domain'] = orgDomain;
  context.vars['app_id'] = HookUtils.getAppId(org: org, name: name);
}
