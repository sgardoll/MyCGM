// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

@JS()
library dart._skwasm_impl;

import 'dart:async';
import 'dart:collection';
import 'dart:convert' hide Codec;
import 'dart:developer' as developer;
import 'dart:js_util' as js_util;
import 'dart:_js_annotations';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:_engine';
import 'dart:_web_unicode';
import 'dart:_web_locale_keymap' as locale_keymap;


part 'skwasm_impl/renderer.dart';
