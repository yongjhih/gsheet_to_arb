/*
 * Copyright (c) 2018, Marcin Marek Gocał
 * All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */

import 'dart:io';

import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:gsheet_to_arb/src/arb/arb_generator.dart';

class TranslationsGenerator {

  String buildTranslations(ArbDocument document, Directory directory) {

    var classBuilder = ClassBuilder();
    classBuilder.name = "Strings";

    var translationClass = classBuilder.build();

    final emitter = DartEmitter();

    var emitted = translationClass.accept(emitter);

    var formatted = DartFormatter().format('${emitted}');

    return formatted;
  }
}
