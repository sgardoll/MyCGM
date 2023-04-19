// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// This file is transformed during the build process into a single library with
// part files (`dart:_engine`) by performing the following:
//
//  - Replace all exports with part directives.
//  - Rewrite the libraries into `part of` part files without imports.
//  - Add imports to this file sufficient to cover the needs of `dart:_engine`.
//
// The code that performs the transformations lives in:
//
//  - https://github.com/flutter/engine/blob/main/web_sdk/sdk_rewriter.dart

@JS()
library dart._engine;

import 'dart:async';
import 'dart:collection';
import 'dart:convert' hide Codec;
import 'dart:developer' as developer;
import 'dart:js_util' as js_util;
import 'dart:_js_annotations';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:_skwasm_stub' if (dart.library.ffi) 'dart:_skwasm_impl';
import 'dart:_web_unicode';
import 'dart:_web_locale_keymap' as locale_keymap;


part 'engine/alarm_clock.dart';
part 'engine/app_bootstrap.dart';
part 'engine/assets.dart';
part 'engine/browser_detection.dart';
part 'engine/canvas_pool.dart';
part 'engine/canvaskit/canvas.dart';
part 'engine/canvaskit/canvaskit_api.dart';
part 'engine/canvaskit/canvaskit_canvas.dart';
part 'engine/canvaskit/color_filter.dart';
part 'engine/canvaskit/embedded_views.dart';
part 'engine/canvaskit/embedded_views_diff.dart';
part 'engine/canvaskit/font_fallback_data.dart';
part 'engine/canvaskit/font_fallbacks.dart';
part 'engine/canvaskit/fonts.dart';
part 'engine/canvaskit/image.dart';
part 'engine/canvaskit/image_filter.dart';
part 'engine/canvaskit/image_wasm_codecs.dart';
part 'engine/canvaskit/image_web_codecs.dart';
part 'engine/canvaskit/interval_tree.dart';
part 'engine/canvaskit/layer.dart';
part 'engine/canvaskit/layer_scene_builder.dart';
part 'engine/canvaskit/layer_tree.dart';
part 'engine/canvaskit/mask_filter.dart';
part 'engine/canvaskit/n_way_canvas.dart';
part 'engine/canvaskit/noto_font.dart';
part 'engine/canvaskit/painting.dart';
part 'engine/canvaskit/path.dart';
part 'engine/canvaskit/path_metrics.dart';
part 'engine/canvaskit/picture.dart';
part 'engine/canvaskit/picture_recorder.dart';
part 'engine/canvaskit/raster_cache.dart';
part 'engine/canvaskit/rasterizer.dart';
part 'engine/canvaskit/renderer.dart';
part 'engine/canvaskit/shader.dart';
part 'engine/canvaskit/skia_object_cache.dart';
part 'engine/canvaskit/surface.dart';
part 'engine/canvaskit/surface_factory.dart';
part 'engine/canvaskit/text.dart';
part 'engine/canvaskit/util.dart';
part 'engine/canvaskit/vertices.dart';
part 'engine/clipboard.dart';
part 'engine/color_filter.dart';
part 'engine/configuration.dart';
part 'engine/dom.dart';
part 'engine/embedder.dart';
part 'engine/engine_canvas.dart';
part 'engine/font_change_util.dart';
part 'engine/fonts.dart';
part 'engine/frame_reference.dart';
part 'engine/host_node.dart';
part 'engine/html/backdrop_filter.dart';
part 'engine/html/bitmap_canvas.dart';
part 'engine/html/canvas.dart';
part 'engine/html/clip.dart';
part 'engine/html/color_filter.dart';
part 'engine/html/debug_canvas_reuse_overlay.dart';
part 'engine/html/dom_canvas.dart';
part 'engine/html/image_filter.dart';
part 'engine/html/offset.dart';
part 'engine/html/opacity.dart';
part 'engine/html/painting.dart';
part 'engine/html/path/conic.dart';
part 'engine/html/path/cubic.dart';
part 'engine/html/path/path.dart';
part 'engine/html/path/path_iterator.dart';
part 'engine/html/path/path_metrics.dart';
part 'engine/html/path/path_ref.dart';
part 'engine/html/path/path_to_svg.dart';
part 'engine/html/path/path_utils.dart';
part 'engine/html/path/path_windings.dart';
part 'engine/html/path/tangent.dart';
part 'engine/html/path_to_svg_clip.dart';
part 'engine/html/picture.dart';
part 'engine/html/platform_view.dart';
part 'engine/html/recording_canvas.dart';
part 'engine/html/render_vertices.dart';
part 'engine/html/renderer.dart';
part 'engine/html/scene.dart';
part 'engine/html/scene_builder.dart';
part 'engine/html/shader_mask.dart';
part 'engine/html/shaders/image_shader.dart';
part 'engine/html/shaders/normalized_gradient.dart';
part 'engine/html/shaders/shader.dart';
part 'engine/html/shaders/shader_builder.dart';
part 'engine/html/shaders/vertex_shaders.dart';
part 'engine/html/surface.dart';
part 'engine/html/surface_stats.dart';
part 'engine/html/transform.dart';
part 'engine/html_image_codec.dart';
part 'engine/initialization.dart';
part 'engine/js_interop/js_loader.dart';
part 'engine/js_interop/js_promise.dart';
part 'engine/key_map.g.dart';
part 'engine/keyboard_binding.dart';
part 'engine/mouse_cursor.dart';
part 'engine/navigation/history.dart';
part 'engine/navigation/js_url_strategy.dart';
part 'engine/navigation/url_strategy.dart';
part 'engine/onscreen_logging.dart';
part 'engine/picture.dart';
part 'engine/platform_dispatcher.dart';
part 'engine/platform_views.dart';
part 'engine/platform_views/content_manager.dart';
part 'engine/platform_views/message_handler.dart';
part 'engine/platform_views/slots.dart';
part 'engine/plugins.dart';
part 'engine/pointer_binding.dart';
part 'engine/pointer_converter.dart';
part 'engine/profiler.dart';
part 'engine/raw_keyboard.dart';
part 'engine/renderer.dart';
part 'engine/rrect_renderer.dart';
part 'engine/safe_browser_api.dart';
part 'engine/semantics/accessibility.dart';
part 'engine/semantics/checkable.dart';
part 'engine/semantics/image.dart';
part 'engine/semantics/incrementable.dart';
part 'engine/semantics/label_and_value.dart';
part 'engine/semantics/live_region.dart';
part 'engine/semantics/scrollable.dart';
part 'engine/semantics/semantics.dart';
part 'engine/semantics/semantics_helper.dart';
part 'engine/semantics/tappable.dart';
part 'engine/semantics/text_field.dart';
part 'engine/services/buffers.dart';
part 'engine/services/message_codec.dart';
part 'engine/services/message_codecs.dart';
part 'engine/services/serialization.dart';
part 'engine/shadow.dart';
part 'engine/svg.dart';
part 'engine/test_embedding.dart';
part 'engine/text/canvas_paragraph.dart';
part 'engine/text/font_collection.dart';
part 'engine/text/fragmenter.dart';
part 'engine/text/layout_fragmenter.dart';
part 'engine/text/layout_service.dart';
part 'engine/text/line_break_properties.dart';
part 'engine/text/line_breaker.dart';
part 'engine/text/measurement.dart';
part 'engine/text/paint_service.dart';
part 'engine/text/paragraph.dart';
part 'engine/text/ruler.dart';
part 'engine/text/text_direction.dart';
part 'engine/text/unicode_range.dart';
part 'engine/text/word_break_properties.dart';
part 'engine/text/word_breaker.dart';
part 'engine/text_editing/autofill_hint.dart';
part 'engine/text_editing/composition_aware_mixin.dart';
part 'engine/text_editing/input_action.dart';
part 'engine/text_editing/input_type.dart';
part 'engine/text_editing/text_capitalization.dart';
part 'engine/text_editing/text_editing.dart';
part 'engine/util.dart';
part 'engine/validators.dart';
part 'engine/vector_math.dart';
part 'engine/window.dart';
