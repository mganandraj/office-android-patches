--- "e:\\github\\fb-react-native-forpatch-base\\README.md"	2020-01-30 13:55:48.035612000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\README.md"	2020-01-29 14:10:09.043915100 -0800
@@ -1,3 +1,16 @@
+# Working fork for Microsoft internal usage
+### **It is not our goal to have a long term fork of facebook/react-native/**
+
+The reasons for this fork to exist currently are 3 fold.
+
+1. Provide a staging ground for changes that Microsoft is submitting back to the main Facebook repo, such that our internal apps can share and validate these changes while the PRs go through the standard merge process with Facebook.
+1. A holding ground for our implementation of react-native for macOS. -- The eventual plan is to refactor a bunch of code within facebook/react-native to allow the macOS code to be implemented as an out of tree platform that works with the core react-native package.  But currently the implementation shares so much logic with the iOS platform that it would involve a lot of code duplication to move it out.  This process will take a while to work through but is the eventual goal.
+1. Hold various changes that we have made internally to support our apps, which we hope to revert as we update our internal code.  But we are putting it all out here since other projects require this changes exist for now.
+
+The eventual goal is for this fork to stop existing, or certainly have a much smaller delta between this fork and facebook/react-native.
+
+# [React Native](https://facebook.github.io/react-native/) &middot;  [![Circle CI Status](https://circleci.com/gh/facebook/react-native.svg?style=shield)](https://circleci.com/gh/facebook/react-native) [![Build status](https://ci.appveyor.com/api/projects/status/g8d58ipi3auqdtrk/branch/master?svg=true)](https://ci.appveyor.com/project/facebook/react-native/branch/master) [![npm version](https://badge.fury.io/js/react-native.svg)](https://badge.fury.io/js/react-native) [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md#pull-requests)
+
 <h1 align="center">
   <a href="https://facebook.github.io/react-native/">
     React Native
@@ -73,6 +86,7 @@
 React Native apps may target iOS 9.0 and Android 4.1 (API 16) or newer. You may use Windows, macOS, or Linux as your development operating system, though building and running iOS apps is limited to macOS. Tools like [Expo](https://expo.io) can be used to work around this.
 
 ## 🎉 Building your first React Native app
+>>>>>>> v0.60.0
 
 Follow the [Getting Started guide](https://facebook.github.io/react-native/docs/getting-started.html). The recommended way to install React Native depends on your project. Here you can find short guides for the most common scenarios:
 
