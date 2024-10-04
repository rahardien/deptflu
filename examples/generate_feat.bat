@echo off
Rem Script to generate feature boilerplate
Rem args

set feat_name=%1

if %feat_name% == "" echo Please provide feature name
endif

mason make deptflu_feat --name %feat_name%