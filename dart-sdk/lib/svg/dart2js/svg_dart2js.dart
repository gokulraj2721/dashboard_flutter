/// Scalable Vector Graphics:
/// Two-dimensional vector graphics with support for events and animation.
///
/// > [!Note]
/// > New projects should prefer to use
/// > [package:web](https://pub.dev/packages/web). For existing projects, see
/// > our [migration guide](https://dart.dev/go/package-web).
///
/// For details about the features and syntax of SVG, a W3C standard,
/// refer to the
/// [Scalable Vector Graphics Specification](http://www.w3.org/TR/SVG/).
///
/// {@category Web (Legacy)}
library dart.dom.svg;

import 'dart:async';
import 'dart:collection' hide LinkedList, LinkedListEntry;
import 'dart:_internal' show FixedLengthListMixin;
import 'dart:html';
import 'dart:html_common';
import 'dart:_js_helper' show Creates, Returns, JSName, Native;
import 'dart:_foreign_helper' show JS;
import 'dart:_interceptors' show JavaScriptObject;
// DO NOT EDIT - unless you are editing documentation as per:
// https://code.google.com/p/dart/wiki/ContributingHTMLDocumentation
// Auto-generated dart:svg library.

// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class _SvgElementFactoryProvider {
  static SvgElement createSvgElement_tag(String tag) {
    final Element temp =
        document.createElementNS("http://www.w3.org/2000/svg", tag);
    return temp as SvgElement;
  }
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGAElement")
class AElement extends GraphicsElement implements UriReference {
  // To suppress missing implicit constructor warnings.
  factory AElement._() {
    throw UnsupportedError("Not supported");
  }

  factory AElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("a") as AElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  AElement.created() : super.created();

  AnimatedString get target native;

  // From SVGURIReference

  @override
  AnimatedString? get href native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGAngle")
class Angle extends JavaScriptObject {
  // To suppress missing implicit constructor warnings.
  factory Angle._() {
    throw UnsupportedError("Not supported");
  }

  static const int SVG_ANGLETYPE_DEG = 2;

  static const int SVG_ANGLETYPE_GRAD = 4;

  static const int SVG_ANGLETYPE_RAD = 3;

  static const int SVG_ANGLETYPE_UNKNOWN = 0;

  static const int SVG_ANGLETYPE_UNSPECIFIED = 1;

  int? get unitType native;

  num? get value native;

  set value(num? value) native;

  String? get valueAsString native;

  set valueAsString(String? value) native;

  num? get valueInSpecifiedUnits native;

  set valueInSpecifiedUnits(num? value) native;

  void convertToSpecifiedUnits(int unitType) native;

  void newValueSpecifiedUnits(int unitType, num valueInSpecifiedUnits) native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX)
@SupportedBrowser(SupportedBrowser.SAFARI)
@Unstable()
@Native("SVGAnimateElement")
class AnimateElement extends AnimationElement {
  // To suppress missing implicit constructor warnings.
  factory AnimateElement._() {
    throw UnsupportedError("Not supported");
  }

  factory AnimateElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("animate")
          as AnimateElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  AnimateElement.created() : super.created();

  /// Checks if this type is supported on the current platform.
  static bool get supported =>
      SvgElement.isTagSupported('animate') &&
      (SvgElement.tag('animate') is AnimateElement);
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX)
@SupportedBrowser(SupportedBrowser.SAFARI)
@Unstable()
@Native("SVGAnimateMotionElement")
class AnimateMotionElement extends AnimationElement {
  // To suppress missing implicit constructor warnings.
  factory AnimateMotionElement._() {
    throw UnsupportedError("Not supported");
  }

  factory AnimateMotionElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("animateMotion")
          as AnimateMotionElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  AnimateMotionElement.created() : super.created();

  /// Checks if this type is supported on the current platform.
  static bool get supported =>
      SvgElement.isTagSupported('animateMotion') &&
      (SvgElement.tag('animateMotion') is AnimateMotionElement);
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX)
@SupportedBrowser(SupportedBrowser.SAFARI)
@Unstable()
@Native("SVGAnimateTransformElement")
class AnimateTransformElement extends AnimationElement {
  // To suppress missing implicit constructor warnings.
  factory AnimateTransformElement._() {
    throw UnsupportedError("Not supported");
  }

  factory AnimateTransformElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("animateTransform")
          as AnimateTransformElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  AnimateTransformElement.created() : super.created();

  /// Checks if this type is supported on the current platform.
  static bool get supported =>
      SvgElement.isTagSupported('animateTransform') &&
      (SvgElement.tag('animateTransform') is AnimateTransformElement);
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGAnimatedAngle")
class AnimatedAngle extends JavaScriptObject {
  // To suppress missing implicit constructor warnings.
  factory AnimatedAngle._() {
    throw UnsupportedError("Not supported");
  }

  Angle? get animVal native;

  Angle? get baseVal native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGAnimatedBoolean")
class AnimatedBoolean extends JavaScriptObject {
  // To suppress missing implicit constructor warnings.
  factory AnimatedBoolean._() {
    throw UnsupportedError("Not supported");
  }

  bool? get animVal native;

  bool? get baseVal native;

  set baseVal(bool? value) native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGAnimatedEnumeration")
class AnimatedEnumeration extends JavaScriptObject {
  // To suppress missing implicit constructor warnings.
  factory AnimatedEnumeration._() {
    throw UnsupportedError("Not supported");
  }

  int? get animVal native;

  int? get baseVal native;

  set baseVal(int? value) native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGAnimatedInteger")
class AnimatedInteger extends JavaScriptObject {
  // To suppress missing implicit constructor warnings.
  factory AnimatedInteger._() {
    throw UnsupportedError("Not supported");
  }

  int? get animVal native;

  int? get baseVal native;

  set baseVal(int? value) native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGAnimatedLength")
class AnimatedLength extends JavaScriptObject {
  // To suppress missing implicit constructor warnings.
  factory AnimatedLength._() {
    throw UnsupportedError("Not supported");
  }

  Length? get animVal native;

  Length? get baseVal native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGAnimatedLengthList")
class AnimatedLengthList extends JavaScriptObject {
  // To suppress missing implicit constructor warnings.
  factory AnimatedLengthList._() {
    throw UnsupportedError("Not supported");
  }

  LengthList? get animVal native;

  LengthList? get baseVal native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGAnimatedNumber")
class AnimatedNumber extends JavaScriptObject {
  // To suppress missing implicit constructor warnings.
  factory AnimatedNumber._() {
    throw UnsupportedError("Not supported");
  }

  num? get animVal native;

  num? get baseVal native;

  set baseVal(num? value) native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGAnimatedNumberList")
class AnimatedNumberList extends JavaScriptObject {
  // To suppress missing implicit constructor warnings.
  factory AnimatedNumberList._() {
    throw UnsupportedError("Not supported");
  }

  NumberList? get animVal native;

  NumberList? get baseVal native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGAnimatedPreserveAspectRatio")
class AnimatedPreserveAspectRatio extends JavaScriptObject {
  // To suppress missing implicit constructor warnings.
  factory AnimatedPreserveAspectRatio._() {
    throw UnsupportedError("Not supported");
  }

  PreserveAspectRatio? get animVal native;

  PreserveAspectRatio? get baseVal native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGAnimatedRect")
class AnimatedRect extends JavaScriptObject {
  // To suppress missing implicit constructor warnings.
  factory AnimatedRect._() {
    throw UnsupportedError("Not supported");
  }

  Rect? get animVal native;

  Rect? get baseVal native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGAnimatedString")
class AnimatedString extends JavaScriptObject {
  // To suppress missing implicit constructor warnings.
  factory AnimatedString._() {
    throw UnsupportedError("Not supported");
  }

  String? get animVal native;

  String? get baseVal native;

  set baseVal(String? value) native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGAnimatedTransformList")
class AnimatedTransformList extends JavaScriptObject {
  // To suppress missing implicit constructor warnings.
  factory AnimatedTransformList._() {
    throw UnsupportedError("Not supported");
  }

  TransformList? get animVal native;

  TransformList? get baseVal native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGAnimationElement")
class AnimationElement extends SvgElement implements Tests {
  // To suppress missing implicit constructor warnings.
  factory AnimationElement._() {
    throw UnsupportedError("Not supported");
  }

  factory AnimationElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("animation")
          as AnimationElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  AnimationElement.created() : super.created();

  SvgElement? get targetElement native;

  void beginElement() native;

  void beginElementAt(num offset) native;

  void endElement() native;

  void endElementAt(num offset) native;

  double getCurrentTime() native;

  double getSimpleDuration() native;

  double getStartTime() native;

  // From SVGTests

  @override
  StringList? get requiredExtensions native;

  @override
  StringList? get systemLanguage native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGCircleElement")
class CircleElement extends GeometryElement {
  // To suppress missing implicit constructor warnings.
  factory CircleElement._() {
    throw UnsupportedError("Not supported");
  }

  factory CircleElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("circle")
          as CircleElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  CircleElement.created() : super.created();

  AnimatedLength? get cx native;

  AnimatedLength? get cy native;

  AnimatedLength? get r native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGClipPathElement")
class ClipPathElement extends GraphicsElement {
  // To suppress missing implicit constructor warnings.
  factory ClipPathElement._() {
    throw UnsupportedError("Not supported");
  }

  factory ClipPathElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("clipPath")
          as ClipPathElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  ClipPathElement.created() : super.created();

  AnimatedEnumeration? get clipPathUnits native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGDefsElement")
class DefsElement extends GraphicsElement {
  // To suppress missing implicit constructor warnings.
  factory DefsElement._() {
    throw UnsupportedError("Not supported");
  }

  factory DefsElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("defs") as DefsElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  DefsElement.created() : super.created();
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGDescElement")
class DescElement extends SvgElement {
  // To suppress missing implicit constructor warnings.
  factory DescElement._() {
    throw UnsupportedError("Not supported");
  }

  factory DescElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("desc") as DescElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  DescElement.created() : super.created();
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Native("SVGDiscardElement")
class DiscardElement extends SvgElement {
  // To suppress missing implicit constructor warnings.
  factory DiscardElement._() {
    throw UnsupportedError("Not supported");
  }
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  DiscardElement.created() : super.created();
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGEllipseElement")
class EllipseElement extends GeometryElement {
  // To suppress missing implicit constructor warnings.
  factory EllipseElement._() {
    throw UnsupportedError("Not supported");
  }

  factory EllipseElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("ellipse")
          as EllipseElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  EllipseElement.created() : super.created();

  AnimatedLength? get cx native;

  AnimatedLength? get cy native;

  AnimatedLength? get rx native;

  AnimatedLength? get ry native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX)
@SupportedBrowser(SupportedBrowser.IE, '10')
@SupportedBrowser(SupportedBrowser.SAFARI)
@Unstable()
@Native("SVGFEBlendElement")
class FEBlendElement extends SvgElement
    implements FilterPrimitiveStandardAttributes {
  // To suppress missing implicit constructor warnings.
  factory FEBlendElement._() {
    throw UnsupportedError("Not supported");
  }

  factory FEBlendElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("feBlend")
          as FEBlendElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  FEBlendElement.created() : super.created();

  /// Checks if this type is supported on the current platform.
  static bool get supported =>
      SvgElement.isTagSupported('feBlend') &&
      (SvgElement.tag('feBlend') is FEBlendElement);

  static const int SVG_FEBLEND_MODE_DARKEN = 4;

  static const int SVG_FEBLEND_MODE_LIGHTEN = 5;

  static const int SVG_FEBLEND_MODE_MULTIPLY = 2;

  static const int SVG_FEBLEND_MODE_NORMAL = 1;

  static const int SVG_FEBLEND_MODE_SCREEN = 3;

  static const int SVG_FEBLEND_MODE_UNKNOWN = 0;

  AnimatedString? get in1 native;

  AnimatedString? get in2 native;

  AnimatedEnumeration? get mode native;

  // From SVGFilterPrimitiveStandardAttributes

  @override
  AnimatedLength? get height native;

  @override
  AnimatedString? get result native;

  @override
  AnimatedLength? get width native;

  @override
  AnimatedLength? get x native;

  @override
  AnimatedLength? get y native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX)
@SupportedBrowser(SupportedBrowser.IE, '10')
@SupportedBrowser(SupportedBrowser.SAFARI)
@Unstable()
@Native("SVGFEColorMatrixElement")
class FEColorMatrixElement extends SvgElement
    implements FilterPrimitiveStandardAttributes {
  // To suppress missing implicit constructor warnings.
  factory FEColorMatrixElement._() {
    throw UnsupportedError("Not supported");
  }

  factory FEColorMatrixElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("feColorMatrix")
          as FEColorMatrixElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  FEColorMatrixElement.created() : super.created();

  /// Checks if this type is supported on the current platform.
  static bool get supported =>
      SvgElement.isTagSupported('feColorMatrix') &&
      (SvgElement.tag('feColorMatrix') is FEColorMatrixElement);

  static const int SVG_FECOLORMATRIX_TYPE_HUEROTATE = 3;

  static const int SVG_FECOLORMATRIX_TYPE_LUMINANCETOALPHA = 4;

  static const int SVG_FECOLORMATRIX_TYPE_MATRIX = 1;

  static const int SVG_FECOLORMATRIX_TYPE_SATURATE = 2;

  static const int SVG_FECOLORMATRIX_TYPE_UNKNOWN = 0;

  AnimatedString get in1 native;

  AnimatedEnumeration? get type native;

  AnimatedNumberList? get values native;

  // From SVGFilterPrimitiveStandardAttributes

  @override
  AnimatedLength? get height native;

  @override
  AnimatedString? get result native;

  @override
  AnimatedLength? get width native;

  @override
  AnimatedLength? get x native;

  @override
  AnimatedLength? get y native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX)
@SupportedBrowser(SupportedBrowser.IE, '10')
@SupportedBrowser(SupportedBrowser.SAFARI)
@Unstable()
@Native("SVGFEComponentTransferElement")
class FEComponentTransferElement extends SvgElement
    implements FilterPrimitiveStandardAttributes {
  // To suppress missing implicit constructor warnings.
  factory FEComponentTransferElement._() {
    throw UnsupportedError("Not supported");
  }

  factory FEComponentTransferElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("feComponentTransfer")
          as FEComponentTransferElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  FEComponentTransferElement.created() : super.created();

  /// Checks if this type is supported on the current platform.
  static bool get supported =>
      SvgElement.isTagSupported('feComponentTransfer') &&
      (SvgElement.tag('feComponentTransfer') is FEComponentTransferElement);

  AnimatedString? get in1 native;

  // From SVGFilterPrimitiveStandardAttributes

  @override
  AnimatedLength? get height native;

  @override
  AnimatedString? get result native;

  @override
  AnimatedLength? get width native;

  @override
  AnimatedLength? get x native;

  @override
  AnimatedLength? get y native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGFECompositeElement")
class FECompositeElement extends SvgElement
    implements FilterPrimitiveStandardAttributes {
  // To suppress missing implicit constructor warnings.
  factory FECompositeElement._() {
    throw UnsupportedError("Not supported");
  }
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  FECompositeElement.created() : super.created();

  static const int SVG_FECOMPOSITE_OPERATOR_ARITHMETIC = 6;

  static const int SVG_FECOMPOSITE_OPERATOR_ATOP = 4;

  static const int SVG_FECOMPOSITE_OPERATOR_IN = 2;

  static const int SVG_FECOMPOSITE_OPERATOR_OUT = 3;

  static const int SVG_FECOMPOSITE_OPERATOR_OVER = 1;

  static const int SVG_FECOMPOSITE_OPERATOR_UNKNOWN = 0;

  static const int SVG_FECOMPOSITE_OPERATOR_XOR = 5;

  AnimatedString? get in1 native;

  AnimatedString? get in2 native;

  AnimatedNumber? get k1 native;

  AnimatedNumber? get k2 native;

  AnimatedNumber? get k3 native;

  AnimatedNumber? get k4 native;

  AnimatedEnumeration? get operator native;

  // From SVGFilterPrimitiveStandardAttributes

  @override
  AnimatedLength? get height native;

  @override
  AnimatedString? get result native;

  @override
  AnimatedLength? get width native;

  @override
  AnimatedLength? get x native;

  @override
  AnimatedLength? get y native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX)
@SupportedBrowser(SupportedBrowser.IE, '10')
@SupportedBrowser(SupportedBrowser.SAFARI)
@Unstable()
@Native("SVGFEConvolveMatrixElement")
class FEConvolveMatrixElement extends SvgElement
    implements FilterPrimitiveStandardAttributes {
  // To suppress missing implicit constructor warnings.
  factory FEConvolveMatrixElement._() {
    throw UnsupportedError("Not supported");
  }

  factory FEConvolveMatrixElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("feConvolveMatrix")
          as FEConvolveMatrixElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  FEConvolveMatrixElement.created() : super.created();

  /// Checks if this type is supported on the current platform.
  static bool get supported =>
      SvgElement.isTagSupported('feConvolveMatrix') &&
      (SvgElement.tag('feConvolveMatrix') is FEConvolveMatrixElement);

  static const int SVG_EDGEMODE_DUPLICATE = 1;

  static const int SVG_EDGEMODE_NONE = 3;

  static const int SVG_EDGEMODE_UNKNOWN = 0;

  static const int SVG_EDGEMODE_WRAP = 2;

  AnimatedNumber? get bias native;

  AnimatedNumber? get divisor native;

  AnimatedEnumeration? get edgeMode native;

  AnimatedString? get in1 native;

  AnimatedNumberList? get kernelMatrix native;

  AnimatedNumber? get kernelUnitLengthX native;

  AnimatedNumber? get kernelUnitLengthY native;

  AnimatedInteger? get orderX native;

  AnimatedInteger? get orderY native;

  AnimatedBoolean? get preserveAlpha native;

  AnimatedInteger? get targetX native;

  AnimatedInteger? get targetY native;

  // From SVGFilterPrimitiveStandardAttributes

  @override
  AnimatedLength? get height native;

  @override
  AnimatedString? get result native;

  @override
  AnimatedLength? get width native;

  @override
  AnimatedLength? get x native;

  @override
  AnimatedLength? get y native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX)
@SupportedBrowser(SupportedBrowser.IE, '10')
@SupportedBrowser(SupportedBrowser.SAFARI)
@Unstable()
@Native("SVGFEDiffuseLightingElement")
class FEDiffuseLightingElement extends SvgElement
    implements FilterPrimitiveStandardAttributes {
  // To suppress missing implicit constructor warnings.
  factory FEDiffuseLightingElement._() {
    throw UnsupportedError("Not supported");
  }

  factory FEDiffuseLightingElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("feDiffuseLighting")
          as FEDiffuseLightingElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  FEDiffuseLightingElement.created() : super.created();

  /// Checks if this type is supported on the current platform.
  static bool get supported =>
      SvgElement.isTagSupported('feDiffuseLighting') &&
      (SvgElement.tag('feDiffuseLighting') is FEDiffuseLightingElement);

  AnimatedNumber? get diffuseConstant native;

  AnimatedString? get in1 native;

  AnimatedNumber? get kernelUnitLengthX native;

  AnimatedNumber? get kernelUnitLengthY native;

  AnimatedNumber? get surfaceScale native;

  // From SVGFilterPrimitiveStandardAttributes

  @override
  AnimatedLength? get height native;

  @override
  AnimatedString? get result native;

  @override
  AnimatedLength? get width native;

  @override
  AnimatedLength? get x native;

  @override
  AnimatedLength? get y native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX)
@SupportedBrowser(SupportedBrowser.IE, '10')
@SupportedBrowser(SupportedBrowser.SAFARI)
@Unstable()
@Native("SVGFEDisplacementMapElement")
class FEDisplacementMapElement extends SvgElement
    implements FilterPrimitiveStandardAttributes {
  // To suppress missing implicit constructor warnings.
  factory FEDisplacementMapElement._() {
    throw UnsupportedError("Not supported");
  }

  factory FEDisplacementMapElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("feDisplacementMap")
          as FEDisplacementMapElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  FEDisplacementMapElement.created() : super.created();

  /// Checks if this type is supported on the current platform.
  static bool get supported =>
      SvgElement.isTagSupported('feDisplacementMap') &&
      (SvgElement.tag('feDisplacementMap') is FEDisplacementMapElement);

  static const int SVG_CHANNEL_A = 4;

  static const int SVG_CHANNEL_B = 3;

  static const int SVG_CHANNEL_G = 2;

  static const int SVG_CHANNEL_R = 1;

  static const int SVG_CHANNEL_UNKNOWN = 0;

  AnimatedString? get in1 native;

  AnimatedString? get in2 native;

  AnimatedNumber? get scale native;

  AnimatedEnumeration? get xChannelSelector native;

  AnimatedEnumeration? get yChannelSelector native;

  // From SVGFilterPrimitiveStandardAttributes

  @override
  AnimatedLength? get height native;

  @override
  AnimatedString? get result native;

  @override
  AnimatedLength? get width native;

  @override
  AnimatedLength? get x native;

  @override
  AnimatedLength? get y native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX)
@SupportedBrowser(SupportedBrowser.IE, '10')
@SupportedBrowser(SupportedBrowser.SAFARI)
@Unstable()
@Native("SVGFEDistantLightElement")
class FEDistantLightElement extends SvgElement {
  // To suppress missing implicit constructor warnings.
  factory FEDistantLightElement._() {
    throw UnsupportedError("Not supported");
  }

  factory FEDistantLightElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("feDistantLight")
          as FEDistantLightElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  FEDistantLightElement.created() : super.created();

  /// Checks if this type is supported on the current platform.
  static bool get supported =>
      SvgElement.isTagSupported('feDistantLight') &&
      (SvgElement.tag('feDistantLight') is FEDistantLightElement);

  AnimatedNumber? get azimuth native;

  AnimatedNumber? get elevation native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX)
@SupportedBrowser(SupportedBrowser.IE, '10')
@SupportedBrowser(SupportedBrowser.SAFARI)
@Unstable()
@Native("SVGFEFloodElement")
class FEFloodElement extends SvgElement
    implements FilterPrimitiveStandardAttributes {
  // To suppress missing implicit constructor warnings.
  factory FEFloodElement._() {
    throw UnsupportedError("Not supported");
  }

  factory FEFloodElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("feFlood")
          as FEFloodElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  FEFloodElement.created() : super.created();

  /// Checks if this type is supported on the current platform.
  static bool get supported =>
      SvgElement.isTagSupported('feFlood') &&
      (SvgElement.tag('feFlood') is FEFloodElement);

  // From SVGFilterPrimitiveStandardAttributes

  @override
  AnimatedLength? get height native;

  @override
  AnimatedString? get result native;

  @override
  AnimatedLength? get width native;

  @override
  AnimatedLength? get x native;

  @override
  AnimatedLength? get y native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX)
@SupportedBrowser(SupportedBrowser.IE, '10')
@SupportedBrowser(SupportedBrowser.SAFARI)
@Unstable()
@Native("SVGFEFuncAElement")
class FEFuncAElement extends _SVGComponentTransferFunctionElement {
  // To suppress missing implicit constructor warnings.
  factory FEFuncAElement._() {
    throw UnsupportedError("Not supported");
  }

  factory FEFuncAElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("feFuncA")
          as FEFuncAElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  FEFuncAElement.created() : super.created();

  /// Checks if this type is supported on the current platform.
  static bool get supported =>
      SvgElement.isTagSupported('feFuncA') &&
      (SvgElement.tag('feFuncA') is FEFuncAElement);
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX)
@SupportedBrowser(SupportedBrowser.IE, '10')
@SupportedBrowser(SupportedBrowser.SAFARI)
@Unstable()
@Native("SVGFEFuncBElement")
class FEFuncBElement extends _SVGComponentTransferFunctionElement {
  // To suppress missing implicit constructor warnings.
  factory FEFuncBElement._() {
    throw UnsupportedError("Not supported");
  }

  factory FEFuncBElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("feFuncB")
          as FEFuncBElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  FEFuncBElement.created() : super.created();

  /// Checks if this type is supported on the current platform.
  static bool get supported =>
      SvgElement.isTagSupported('feFuncB') &&
      (SvgElement.tag('feFuncB') is FEFuncBElement);
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX)
@SupportedBrowser(SupportedBrowser.IE, '10')
@SupportedBrowser(SupportedBrowser.SAFARI)
@Unstable()
@Native("SVGFEFuncGElement")
class FEFuncGElement extends _SVGComponentTransferFunctionElement {
  // To suppress missing implicit constructor warnings.
  factory FEFuncGElement._() {
    throw UnsupportedError("Not supported");
  }

  factory FEFuncGElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("feFuncG")
          as FEFuncGElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  FEFuncGElement.created() : super.created();

  /// Checks if this type is supported on the current platform.
  static bool get supported =>
      SvgElement.isTagSupported('feFuncG') &&
      (SvgElement.tag('feFuncG') is FEFuncGElement);
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX)
@SupportedBrowser(SupportedBrowser.IE, '10')
@SupportedBrowser(SupportedBrowser.SAFARI)
@Unstable()
@Native("SVGFEFuncRElement")
class FEFuncRElement extends _SVGComponentTransferFunctionElement {
  // To suppress missing implicit constructor warnings.
  factory FEFuncRElement._() {
    throw UnsupportedError("Not supported");
  }

  factory FEFuncRElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("feFuncR")
          as FEFuncRElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  FEFuncRElement.created() : super.created();

  /// Checks if this type is supported on the current platform.
  static bool get supported =>
      SvgElement.isTagSupported('feFuncR') &&
      (SvgElement.tag('feFuncR') is FEFuncRElement);
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX)
@SupportedBrowser(SupportedBrowser.IE, '10')
@SupportedBrowser(SupportedBrowser.SAFARI)
@Unstable()
@Native("SVGFEGaussianBlurElement")
class FEGaussianBlurElement extends SvgElement
    implements FilterPrimitiveStandardAttributes {
  // To suppress missing implicit constructor warnings.
  factory FEGaussianBlurElement._() {
    throw UnsupportedError("Not supported");
  }

  factory FEGaussianBlurElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("feGaussianBlur")
          as FEGaussianBlurElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  FEGaussianBlurElement.created() : super.created();

  /// Checks if this type is supported on the current platform.
  static bool get supported =>
      SvgElement.isTagSupported('feGaussianBlur') &&
      (SvgElement.tag('feGaussianBlur') is FEGaussianBlurElement);

  AnimatedString? get in1 native;

  AnimatedNumber? get stdDeviationX native;

  AnimatedNumber? get stdDeviationY native;

  void setStdDeviation(num stdDeviationX, num stdDeviationY) native;

  // From SVGFilterPrimitiveStandardAttributes

  @override
  AnimatedLength? get height native;

  @override
  AnimatedString? get result native;

  @override
  AnimatedLength? get width native;

  @override
  AnimatedLength? get x native;

  @override
  AnimatedLength? get y native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX)
@SupportedBrowser(SupportedBrowser.IE, '10')
@SupportedBrowser(SupportedBrowser.SAFARI)
@Unstable()
@Native("SVGFEImageElement")
class FEImageElement extends SvgElement
    implements FilterPrimitiveStandardAttributes, UriReference {
  // To suppress missing implicit constructor warnings.
  factory FEImageElement._() {
    throw UnsupportedError("Not supported");
  }

  factory FEImageElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("feImage")
          as FEImageElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  FEImageElement.created() : super.created();

  /// Checks if this type is supported on the current platform.
  static bool get supported =>
      SvgElement.isTagSupported('feImage') &&
      (SvgElement.tag('feImage') is FEImageElement);

  AnimatedPreserveAspectRatio? get preserveAspectRatio native;

  // From SVGFilterPrimitiveStandardAttributes

  @override
  AnimatedLength? get height native;

  @override
  AnimatedString? get result native;

  @override
  AnimatedLength? get width native;

  @override
  AnimatedLength? get x native;

  @override
  AnimatedLength? get y native;

  // From SVGURIReference

  @override
  AnimatedString? get href native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX)
@SupportedBrowser(SupportedBrowser.IE, '10')
@SupportedBrowser(SupportedBrowser.SAFARI)
@Unstable()
@Native("SVGFEMergeElement")
class FEMergeElement extends SvgElement
    implements FilterPrimitiveStandardAttributes {
  // To suppress missing implicit constructor warnings.
  factory FEMergeElement._() {
    throw UnsupportedError("Not supported");
  }

  factory FEMergeElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("feMerge")
          as FEMergeElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  FEMergeElement.created() : super.created();

  /// Checks if this type is supported on the current platform.
  static bool get supported =>
      SvgElement.isTagSupported('feMerge') &&
      (SvgElement.tag('feMerge') is FEMergeElement);

  // From SVGFilterPrimitiveStandardAttributes

  @override
  AnimatedLength? get height native;

  @override
  AnimatedString? get result native;

  @override
  AnimatedLength? get width native;

  @override
  AnimatedLength? get x native;

  @override
  AnimatedLength? get y native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX)
@SupportedBrowser(SupportedBrowser.IE, '10')
@SupportedBrowser(SupportedBrowser.SAFARI)
@Unstable()
@Native("SVGFEMergeNodeElement")
class FEMergeNodeElement extends SvgElement {
  // To suppress missing implicit constructor warnings.
  factory FEMergeNodeElement._() {
    throw UnsupportedError("Not supported");
  }

  factory FEMergeNodeElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("feMergeNode")
          as FEMergeNodeElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  FEMergeNodeElement.created() : super.created();

  /// Checks if this type is supported on the current platform.
  static bool get supported =>
      SvgElement.isTagSupported('feMergeNode') &&
      (SvgElement.tag('feMergeNode') is FEMergeNodeElement);

  AnimatedString? get in1 native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX)
@SupportedBrowser(SupportedBrowser.IE, '10')
@SupportedBrowser(SupportedBrowser.SAFARI)
@Unstable()
@Native("SVGFEMorphologyElement")
class FEMorphologyElement extends SvgElement
    implements FilterPrimitiveStandardAttributes {
  // To suppress missing implicit constructor warnings.
  factory FEMorphologyElement._() {
    throw UnsupportedError("Not supported");
  }
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  FEMorphologyElement.created() : super.created();

  static const int SVG_MORPHOLOGY_OPERATOR_DILATE = 2;

  static const int SVG_MORPHOLOGY_OPERATOR_ERODE = 1;

  static const int SVG_MORPHOLOGY_OPERATOR_UNKNOWN = 0;

  AnimatedString? get in1 native;

  AnimatedEnumeration? get operator native;

  AnimatedNumber? get radiusX native;

  AnimatedNumber? get radiusY native;

  // From SVGFilterPrimitiveStandardAttributes

  @override
  AnimatedLength? get height native;

  @override
  AnimatedString? get result native;

  @override
  AnimatedLength? get width native;

  @override
  AnimatedLength? get x native;

  @override
  AnimatedLength? get y native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX)
@SupportedBrowser(SupportedBrowser.IE, '10')
@SupportedBrowser(SupportedBrowser.SAFARI)
@Unstable()
@Native("SVGFEOffsetElement")
class FEOffsetElement extends SvgElement
    implements FilterPrimitiveStandardAttributes {
  // To suppress missing implicit constructor warnings.
  factory FEOffsetElement._() {
    throw UnsupportedError("Not supported");
  }

  factory FEOffsetElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("feOffset")
          as FEOffsetElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  FEOffsetElement.created() : super.created();

  /// Checks if this type is supported on the current platform.
  static bool get supported =>
      SvgElement.isTagSupported('feOffset') &&
      (SvgElement.tag('feOffset') is FEOffsetElement);

  AnimatedNumber? get dx native;

  AnimatedNumber? get dy native;

  AnimatedString? get in1 native;

  // From SVGFilterPrimitiveStandardAttributes

  @override
  AnimatedLength? get height native;

  @override
  AnimatedString? get result native;

  @override
  AnimatedLength? get width native;

  @override
  AnimatedLength? get x native;

  @override
  AnimatedLength? get y native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX)
@SupportedBrowser(SupportedBrowser.IE, '10')
@SupportedBrowser(SupportedBrowser.SAFARI)
@Unstable()
@Native("SVGFEPointLightElement")
class FEPointLightElement extends SvgElement {
  // To suppress missing implicit constructor warnings.
  factory FEPointLightElement._() {
    throw UnsupportedError("Not supported");
  }

  factory FEPointLightElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("fePointLight")
          as FEPointLightElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  FEPointLightElement.created() : super.created();

  /// Checks if this type is supported on the current platform.
  static bool get supported =>
      SvgElement.isTagSupported('fePointLight') &&
      (SvgElement.tag('fePointLight') is FEPointLightElement);

  AnimatedNumber? get x native;

  AnimatedNumber? get y native;

  AnimatedNumber? get z native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX)
@SupportedBrowser(SupportedBrowser.IE, '10')
@SupportedBrowser(SupportedBrowser.SAFARI)
@Unstable()
@Native("SVGFESpecularLightingElement")
class FESpecularLightingElement extends SvgElement
    implements FilterPrimitiveStandardAttributes {
  // To suppress missing implicit constructor warnings.
  factory FESpecularLightingElement._() {
    throw UnsupportedError("Not supported");
  }

  factory FESpecularLightingElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("feSpecularLighting")
          as FESpecularLightingElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  FESpecularLightingElement.created() : super.created();

  /// Checks if this type is supported on the current platform.
  static bool get supported =>
      SvgElement.isTagSupported('feSpecularLighting') &&
      (SvgElement.tag('feSpecularLighting') is FESpecularLightingElement);

  AnimatedString? get in1 native;

  AnimatedNumber? get kernelUnitLengthX native;

  AnimatedNumber? get kernelUnitLengthY native;

  AnimatedNumber? get specularConstant native;

  AnimatedNumber? get specularExponent native;

  AnimatedNumber? get surfaceScale native;

  // From SVGFilterPrimitiveStandardAttributes

  @override
  AnimatedLength? get height native;

  @override
  AnimatedString? get result native;

  @override
  AnimatedLength? get width native;

  @override
  AnimatedLength? get x native;

  @override
  AnimatedLength? get y native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX)
@SupportedBrowser(SupportedBrowser.IE, '10')
@SupportedBrowser(SupportedBrowser.SAFARI)
@Unstable()
@Native("SVGFESpotLightElement")
class FESpotLightElement extends SvgElement {
  // To suppress missing implicit constructor warnings.
  factory FESpotLightElement._() {
    throw UnsupportedError("Not supported");
  }

  factory FESpotLightElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("feSpotLight")
          as FESpotLightElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  FESpotLightElement.created() : super.created();

  /// Checks if this type is supported on the current platform.
  static bool get supported =>
      SvgElement.isTagSupported('feSpotLight') &&
      (SvgElement.tag('feSpotLight') is FESpotLightElement);

  AnimatedNumber? get limitingConeAngle native;

  AnimatedNumber? get pointsAtX native;

  AnimatedNumber? get pointsAtY native;

  AnimatedNumber? get pointsAtZ native;

  AnimatedNumber? get specularExponent native;

  AnimatedNumber? get x native;

  AnimatedNumber? get y native;

  AnimatedNumber? get z native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX)
@SupportedBrowser(SupportedBrowser.IE, '10')
@SupportedBrowser(SupportedBrowser.SAFARI)
@Unstable()
@Native("SVGFETileElement")
class FETileElement extends SvgElement
    implements FilterPrimitiveStandardAttributes {
  // To suppress missing implicit constructor warnings.
  factory FETileElement._() {
    throw UnsupportedError("Not supported");
  }

  factory FETileElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("feTile")
          as FETileElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  FETileElement.created() : super.created();

  /// Checks if this type is supported on the current platform.
  static bool get supported =>
      SvgElement.isTagSupported('feTile') &&
      (SvgElement.tag('feTile') is FETileElement);

  AnimatedString? get in1 native;

  // From SVGFilterPrimitiveStandardAttributes

  @override
  AnimatedLength? get height native;

  @override
  AnimatedString? get result native;

  @override
  AnimatedLength? get width native;

  @override
  AnimatedLength? get x native;

  @override
  AnimatedLength? get y native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX)
@SupportedBrowser(SupportedBrowser.IE, '10')
@SupportedBrowser(SupportedBrowser.SAFARI)
@Unstable()
@Native("SVGFETurbulenceElement")
class FETurbulenceElement extends SvgElement
    implements FilterPrimitiveStandardAttributes {
  // To suppress missing implicit constructor warnings.
  factory FETurbulenceElement._() {
    throw UnsupportedError("Not supported");
  }

  factory FETurbulenceElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("feTurbulence")
          as FETurbulenceElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  FETurbulenceElement.created() : super.created();

  /// Checks if this type is supported on the current platform.
  static bool get supported =>
      SvgElement.isTagSupported('feTurbulence') &&
      (SvgElement.tag('feTurbulence') is FETurbulenceElement);

  static const int SVG_STITCHTYPE_NOSTITCH = 2;

  static const int SVG_STITCHTYPE_STITCH = 1;

  static const int SVG_STITCHTYPE_UNKNOWN = 0;

  static const int SVG_TURBULENCE_TYPE_FRACTALNOISE = 1;

  static const int SVG_TURBULENCE_TYPE_TURBULENCE = 2;

  static const int SVG_TURBULENCE_TYPE_UNKNOWN = 0;

  AnimatedNumber? get baseFrequencyX native;

  AnimatedNumber? get baseFrequencyY native;

  AnimatedInteger? get numOctaves native;

  AnimatedNumber? get seed native;

  AnimatedEnumeration? get stitchTiles native;

  AnimatedEnumeration? get type native;

  // From SVGFilterPrimitiveStandardAttributes

  @override
  AnimatedLength? get height native;

  @override
  AnimatedString? get result native;

  @override
  AnimatedLength? get width native;

  @override
  AnimatedLength? get x native;

  @override
  AnimatedLength? get y native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX)
@SupportedBrowser(SupportedBrowser.IE, '10')
@SupportedBrowser(SupportedBrowser.SAFARI)
@Unstable()
@Native("SVGFilterElement")
class FilterElement extends SvgElement implements UriReference {
  // To suppress missing implicit constructor warnings.
  factory FilterElement._() {
    throw UnsupportedError("Not supported");
  }

  factory FilterElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("filter")
          as FilterElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  FilterElement.created() : super.created();

  /// Checks if this type is supported on the current platform.
  static bool get supported =>
      SvgElement.isTagSupported('filter') &&
      (SvgElement.tag('filter') is FilterElement);

  AnimatedEnumeration? get filterUnits native;

  AnimatedLength? get height native;

  AnimatedEnumeration? get primitiveUnits native;

  AnimatedLength? get width native;

  AnimatedLength? get x native;

  AnimatedLength? get y native;

  // From SVGURIReference

  @override
  AnimatedString? get href native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
abstract class FilterPrimitiveStandardAttributes extends JavaScriptObject {
  // To suppress missing implicit constructor warnings.
  factory FilterPrimitiveStandardAttributes._() {
    throw UnsupportedError("Not supported");
  }

  AnimatedLength? get height native;

  AnimatedString? get result native;

  AnimatedLength? get width native;

  AnimatedLength? get x native;

  AnimatedLength? get y native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
abstract class FitToViewBox extends JavaScriptObject {
  // To suppress missing implicit constructor warnings.
  factory FitToViewBox._() {
    throw UnsupportedError("Not supported");
  }

  AnimatedPreserveAspectRatio? get preserveAspectRatio native;

  AnimatedRect? get viewBox native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX)
@SupportedBrowser(SupportedBrowser.SAFARI)
@Unstable()
@Native("SVGForeignObjectElement")
class ForeignObjectElement extends GraphicsElement {
  // To suppress missing implicit constructor warnings.
  factory ForeignObjectElement._() {
    throw UnsupportedError("Not supported");
  }

  factory ForeignObjectElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("foreignObject")
          as ForeignObjectElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  ForeignObjectElement.created() : super.created();

  /// Checks if this type is supported on the current platform.
  static bool get supported =>
      SvgElement.isTagSupported('foreignObject') &&
      (SvgElement.tag('foreignObject') is ForeignObjectElement);

  AnimatedLength? get height native;

  AnimatedLength? get width native;

  AnimatedLength? get x native;

  AnimatedLength? get y native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGGElement")
class GElement extends GraphicsElement {
  // To suppress missing implicit constructor warnings.
  factory GElement._() {
    throw UnsupportedError("Not supported");
  }

  factory GElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("g") as GElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  GElement.created() : super.created();
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Native("SVGGeometryElement")
class GeometryElement extends GraphicsElement {
  // To suppress missing implicit constructor warnings.
  factory GeometryElement._() {
    throw UnsupportedError("Not supported");
  }
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  GeometryElement.created() : super.created();

  AnimatedNumber? get pathLength native;

  Point getPointAtLength(num distance) native;

  double getTotalLength() native;

  bool isPointInFill(Point point) native;

  bool isPointInStroke(Point point) native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Native("SVGGraphicsElement")
class GraphicsElement extends SvgElement implements Tests {
  // To suppress missing implicit constructor warnings.
  factory GraphicsElement._() {
    throw UnsupportedError("Not supported");
  }
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  GraphicsElement.created() : super.created();

  SvgElement? get farthestViewportElement native;

  SvgElement? get nearestViewportElement native;

  AnimatedTransformList? get transform native;

  Rect getBBox() native;

  @JSName('getCTM')
  Matrix getCtm() native;

  @JSName('getScreenCTM')
  Matrix getScreenCtm() native;

  // From SVGTests

  @override
  StringList? get requiredExtensions native;

  @override
  StringList? get systemLanguage native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGImageElement")
class ImageElement extends GraphicsElement implements UriReference {
  // To suppress missing implicit constructor warnings.
  factory ImageElement._() {
    throw UnsupportedError("Not supported");
  }

  factory ImageElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("image") as ImageElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  ImageElement.created() : super.created();

  String? get async native;

  set async(String? value) native;

  AnimatedLength? get height native;

  AnimatedPreserveAspectRatio? get preserveAspectRatio native;

  AnimatedLength? get width native;

  AnimatedLength? get x native;

  AnimatedLength? get y native;

  Future decode() => promiseToFuture(JS("", "#.decode()", this));

  // From SVGURIReference

  @override
  AnimatedString? get href native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGLength")
class Length extends JavaScriptObject {
  // To suppress missing implicit constructor warnings.
  factory Length._() {
    throw UnsupportedError("Not supported");
  }

  static const int SVG_LENGTHTYPE_CM = 6;

  static const int SVG_LENGTHTYPE_EMS = 3;

  static const int SVG_LENGTHTYPE_EXS = 4;

  static const int SVG_LENGTHTYPE_IN = 8;

  static const int SVG_LENGTHTYPE_MM = 7;

  static const int SVG_LENGTHTYPE_NUMBER = 1;

  static const int SVG_LENGTHTYPE_PC = 10;

  static const int SVG_LENGTHTYPE_PERCENTAGE = 2;

  static const int SVG_LENGTHTYPE_PT = 9;

  static const int SVG_LENGTHTYPE_PX = 5;

  static const int SVG_LENGTHTYPE_UNKNOWN = 0;

  int? get unitType native;

  num? get value native;

  set value(num? value) native;

  String? get valueAsString native;

  set valueAsString(String? value) native;

  num? get valueInSpecifiedUnits native;

  set valueInSpecifiedUnits(num? value) native;

  void convertToSpecifiedUnits(int unitType) native;

  void newValueSpecifiedUnits(int unitType, num valueInSpecifiedUnits) native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGLengthList")
class LengthList extends JavaScriptObject
    with ListMixin<Length>, ImmutableListMixin<Length>
    implements List<Length> {
  // To suppress missing implicit constructor warnings.
  factory LengthList._() {
    throw UnsupportedError("Not supported");
  }

  @override
  int get length => JS("int", "#.length", this);

  int? get numberOfItems native;

  @override
  Length operator [](int index) {
    if (JS("bool", "# >>> 0 !== # || # >= #", index, index, index, length)) {
      throw IndexError.withLength(index, length, indexable: this);
    }
    return getItem(index);
  }

  @override
  void operator []=(int index, Length value) {
    throw UnsupportedError("Cannot assign element of immutable List.");
  }
  // -- start List<Length> mixins.
  // Length is the element type.

  @override
  set length(int newLength) {
    throw UnsupportedError("Cannot resize immutable List.");
  }

  @override
  Length get first {
    if (length > 0) {
      return JS('Length', '#[0]', this);
    }
    throw StateError("No elements");
  }

  @override
  Length get last {
    int len = length;
    if (len > 0) {
      return JS('Length', '#[#]', this, len - 1);
    }
    throw StateError("No elements");
  }

  @override
  Length get single {
    int len = length;
    if (len == 1) {
      return JS('Length', '#[0]', this);
    }
    if (len == 0) throw StateError("No elements");
    throw StateError("More than one element");
  }

  @override
  Length elementAt(int index) => this[index];
  // -- end List<Length> mixins.

  void __setter__(int index, Length newItem) native;

  Length appendItem(Length newItem) native;

  @override
  void clear() native;

  Length getItem(int index) native;

  Length initialize(Length newItem) native;

  Length insertItemBefore(Length newItem, int index) native;

  Length removeItem(int index) native;

  Length replaceItem(Length newItem, int index) native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGLineElement")
class LineElement extends GeometryElement {
  // To suppress missing implicit constructor warnings.
  factory LineElement._() {
    throw UnsupportedError("Not supported");
  }

  factory LineElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("line") as LineElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  LineElement.created() : super.created();

  AnimatedLength? get x1 native;

  AnimatedLength? get x2 native;

  AnimatedLength? get y1 native;

  AnimatedLength? get y2 native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGLinearGradientElement")
class LinearGradientElement extends _GradientElement {
  // To suppress missing implicit constructor warnings.
  factory LinearGradientElement._() {
    throw UnsupportedError("Not supported");
  }

  factory LinearGradientElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("linearGradient")
          as LinearGradientElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  LinearGradientElement.created() : super.created();

  AnimatedLength? get x1 native;

  AnimatedLength? get x2 native;

  AnimatedLength? get y1 native;

  AnimatedLength? get y2 native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGMarkerElement")
class MarkerElement extends SvgElement implements FitToViewBox {
  // To suppress missing implicit constructor warnings.
  factory MarkerElement._() {
    throw UnsupportedError("Not supported");
  }

  factory MarkerElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("marker")
          as MarkerElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  MarkerElement.created() : super.created();

  static const int SVG_MARKERUNITS_STROKEWIDTH = 2;

  static const int SVG_MARKERUNITS_UNKNOWN = 0;

  static const int SVG_MARKERUNITS_USERSPACEONUSE = 1;

  static const int SVG_MARKER_ORIENT_ANGLE = 2;

  static const int SVG_MARKER_ORIENT_AUTO = 1;

  static const int SVG_MARKER_ORIENT_UNKNOWN = 0;

  AnimatedLength get markerHeight native;

  AnimatedEnumeration get markerUnits native;

  AnimatedLength get markerWidth native;

  AnimatedAngle? get orientAngle native;

  AnimatedEnumeration? get orientType native;

  AnimatedLength get refX native;

  AnimatedLength get refY native;

  void setOrientToAngle(Angle angle) native;

  void setOrientToAuto() native;

  // From SVGFitToViewBox

  @override
  AnimatedPreserveAspectRatio? get preserveAspectRatio native;

  @override
  AnimatedRect? get viewBox native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGMaskElement")
class MaskElement extends SvgElement implements Tests {
  // To suppress missing implicit constructor warnings.
  factory MaskElement._() {
    throw UnsupportedError("Not supported");
  }

  factory MaskElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("mask") as MaskElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  MaskElement.created() : super.created();

  AnimatedLength? get height native;

  AnimatedEnumeration? get maskContentUnits native;

  AnimatedEnumeration? get maskUnits native;

  AnimatedLength? get width native;

  AnimatedLength? get x native;

  AnimatedLength? get y native;

  // From SVGTests

  @override
  StringList? get requiredExtensions native;

  @override
  StringList? get systemLanguage native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGMatrix")
class Matrix extends JavaScriptObject {
  // To suppress missing implicit constructor warnings.
  factory Matrix._() {
    throw UnsupportedError("Not supported");
  }

  num? get a native;

  set a(num? value) native;

  num? get b native;

  set b(num? value) native;

  num? get c native;

  set c(num? value) native;

  num? get d native;

  set d(num? value) native;

  num? get e native;

  set e(num? value) native;

  num? get f native;

  set f(num? value) native;

  Matrix flipX() native;

  Matrix flipY() native;

  Matrix inverse() native;

  Matrix multiply(Matrix secondMatrix) native;

  Matrix rotate(num angle) native;

  Matrix rotateFromVector(num x, num y) native;

  Matrix scale(num scaleFactor) native;

  Matrix scaleNonUniform(num scaleFactorX, num scaleFactorY) native;

  Matrix skewX(num angle) native;

  Matrix skewY(num angle) native;

  Matrix translate(num x, num y) native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGMetadataElement")
class MetadataElement extends SvgElement {
  // To suppress missing implicit constructor warnings.
  factory MetadataElement._() {
    throw UnsupportedError("Not supported");
  }
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  MetadataElement.created() : super.created();
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGNumber")
class Number extends JavaScriptObject {
  // To suppress missing implicit constructor warnings.
  factory Number._() {
    throw UnsupportedError("Not supported");
  }

  num? get value native;

  set value(num? value) native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGNumberList")
class NumberList extends JavaScriptObject
    with ListMixin<Number>, ImmutableListMixin<Number>
    implements List<Number> {
  // To suppress missing implicit constructor warnings.
  factory NumberList._() {
    throw UnsupportedError("Not supported");
  }

  @override
  int get length => JS("int", "#.length", this);

  int? get numberOfItems native;

  @override
  Number operator [](int index) {
    if (JS("bool", "# >>> 0 !== # || # >= #", index, index, index, length)) {
      throw IndexError.withLength(index, length, indexable: this);
    }
    return getItem(index);
  }

  @override
  void operator []=(int index, Number value) {
    throw UnsupportedError("Cannot assign element of immutable List.");
  }
  // -- start List<Number> mixins.
  // Number is the element type.

  @override
  set length(int newLength) {
    throw UnsupportedError("Cannot resize immutable List.");
  }

  @override
  Number get first {
    if (length > 0) {
      return JS('Number', '#[0]', this);
    }
    throw StateError("No elements");
  }

  @override
  Number get last {
    int len = length;
    if (len > 0) {
      return JS('Number', '#[#]', this, len - 1);
    }
    throw StateError("No elements");
  }

  @override
  Number get single {
    int len = length;
    if (len == 1) {
      return JS('Number', '#[0]', this);
    }
    if (len == 0) throw StateError("No elements");
    throw StateError("More than one element");
  }

  @override
  Number elementAt(int index) => this[index];
  // -- end List<Number> mixins.

  void __setter__(int index, Number newItem) native;

  Number appendItem(Number newItem) native;

  @override
  void clear() native;

  Number getItem(int index) native;

  Number initialize(Number newItem) native;

  Number insertItemBefore(Number newItem, int index) native;

  Number removeItem(int index) native;

  Number replaceItem(Number newItem, int index) native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGPathElement")
class PathElement extends GeometryElement {
  // To suppress missing implicit constructor warnings.
  factory PathElement._() {
    throw UnsupportedError("Not supported");
  }

  factory PathElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("path") as PathElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  PathElement.created() : super.created();
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGPatternElement")
class PatternElement extends SvgElement
    implements FitToViewBox, UriReference, Tests {
  // To suppress missing implicit constructor warnings.
  factory PatternElement._() {
    throw UnsupportedError("Not supported");
  }

  factory PatternElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("pattern")
          as PatternElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  PatternElement.created() : super.created();

  AnimatedLength? get height native;

  AnimatedEnumeration? get patternContentUnits native;

  AnimatedTransformList? get patternTransform native;

  AnimatedEnumeration? get patternUnits native;

  AnimatedLength? get width native;

  AnimatedLength? get x native;

  AnimatedLength? get y native;

  // From SVGFitToViewBox

  @override
  AnimatedPreserveAspectRatio? get preserveAspectRatio native;

  @override
  AnimatedRect? get viewBox native;

  // From SVGTests

  @override
  StringList? get requiredExtensions native;

  @override
  StringList? get systemLanguage native;

  // From SVGURIReference

  @override
  AnimatedString? get href native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGPoint")
class Point extends JavaScriptObject {
  // To suppress missing implicit constructor warnings.
  factory Point._() {
    throw UnsupportedError("Not supported");
  }

  num? get x native;

  set x(num? value) native;

  num? get y native;

  set y(num? value) native;

  Point matrixTransform(Matrix matrix) native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGPointList")
class PointList extends JavaScriptObject {
  // To suppress missing implicit constructor warnings.
  factory PointList._() {
    throw UnsupportedError("Not supported");
  }

  int? get length native;

  int? get numberOfItems native;

  void __setter__(int index, Point newItem) native;

  Point appendItem(Point newItem) native;

  void clear() native;

  Point getItem(int index) native;

  Point initialize(Point newItem) native;

  Point insertItemBefore(Point newItem, int index) native;

  Point removeItem(int index) native;

  Point replaceItem(Point newItem, int index) native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGPolygonElement")
class PolygonElement extends GeometryElement {
  // To suppress missing implicit constructor warnings.
  factory PolygonElement._() {
    throw UnsupportedError("Not supported");
  }

  factory PolygonElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("polygon")
          as PolygonElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  PolygonElement.created() : super.created();

  PointList? get animatedPoints native;

  PointList get points native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGPolylineElement")
class PolylineElement extends GeometryElement {
  // To suppress missing implicit constructor warnings.
  factory PolylineElement._() {
    throw UnsupportedError("Not supported");
  }

  factory PolylineElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("polyline")
          as PolylineElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  PolylineElement.created() : super.created();

  PointList? get animatedPoints native;

  PointList get points native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGPreserveAspectRatio")
class PreserveAspectRatio extends JavaScriptObject {
  // To suppress missing implicit constructor warnings.
  factory PreserveAspectRatio._() {
    throw UnsupportedError("Not supported");
  }

  static const int SVG_MEETORSLICE_MEET = 1;

  static const int SVG_MEETORSLICE_SLICE = 2;

  static const int SVG_MEETORSLICE_UNKNOWN = 0;

  static const int SVG_PRESERVEASPECTRATIO_NONE = 1;

  static const int SVG_PRESERVEASPECTRATIO_UNKNOWN = 0;

  static const int SVG_PRESERVEASPECTRATIO_XMAXYMAX = 10;

  static const int SVG_PRESERVEASPECTRATIO_XMAXYMID = 7;

  static const int SVG_PRESERVEASPECTRATIO_XMAXYMIN = 4;

  static const int SVG_PRESERVEASPECTRATIO_XMIDYMAX = 9;

  static const int SVG_PRESERVEASPECTRATIO_XMIDYMID = 6;

  static const int SVG_PRESERVEASPECTRATIO_XMIDYMIN = 3;

  static const int SVG_PRESERVEASPECTRATIO_XMINYMAX = 8;

  static const int SVG_PRESERVEASPECTRATIO_XMINYMID = 5;

  static const int SVG_PRESERVEASPECTRATIO_XMINYMIN = 2;

  int? get align native;

  set align(int? value) native;

  int? get meetOrSlice native;

  set meetOrSlice(int? value) native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGRadialGradientElement")
class RadialGradientElement extends _GradientElement {
  // To suppress missing implicit constructor warnings.
  factory RadialGradientElement._() {
    throw UnsupportedError("Not supported");
  }

  factory RadialGradientElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("radialGradient")
          as RadialGradientElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  RadialGradientElement.created() : super.created();

  AnimatedLength? get cx native;

  AnimatedLength? get cy native;

  AnimatedLength? get fr native;

  AnimatedLength? get fx native;

  AnimatedLength? get fy native;

  AnimatedLength? get r native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGRect")
class Rect extends JavaScriptObject {
  // To suppress missing implicit constructor warnings.
  factory Rect._() {
    throw UnsupportedError("Not supported");
  }

  num? get height native;

  set height(num? value) native;

  num? get width native;

  set width(num? value) native;

  num? get x native;

  set x(num? value) native;

  num? get y native;

  set y(num? value) native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGRectElement")
class RectElement extends GeometryElement {
  // To suppress missing implicit constructor warnings.
  factory RectElement._() {
    throw UnsupportedError("Not supported");
  }

  factory RectElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("rect") as RectElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  RectElement.created() : super.created();

  AnimatedLength? get height native;

  AnimatedLength? get rx native;

  AnimatedLength? get ry native;

  AnimatedLength? get width native;

  AnimatedLength? get x native;

  AnimatedLength? get y native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGScriptElement")
class ScriptElement extends SvgElement implements UriReference {
  // To suppress missing implicit constructor warnings.
  factory ScriptElement._() {
    throw UnsupportedError("Not supported");
  }

  factory ScriptElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("script")
          as ScriptElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  ScriptElement.created() : super.created();

  String? get type native;

  set type(String? value) native;

  // From SVGURIReference

  @override
  AnimatedString? get href native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX)
@SupportedBrowser(SupportedBrowser.SAFARI)
@Unstable()
@Native("SVGSetElement")
class SetElement extends AnimationElement {
  // To suppress missing implicit constructor warnings.
  factory SetElement._() {
    throw UnsupportedError("Not supported");
  }

  factory SetElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("set") as SetElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  SetElement.created() : super.created();

  /// Checks if this type is supported on the current platform.
  static bool get supported =>
      SvgElement.isTagSupported('set') &&
      (SvgElement.tag('set') is SetElement);
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGStopElement")
class StopElement extends SvgElement {
  // To suppress missing implicit constructor warnings.
  factory StopElement._() {
    throw UnsupportedError("Not supported");
  }

  factory StopElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("stop") as StopElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  StopElement.created() : super.created();

  @JSName('offset')
  AnimatedNumber get gradientOffset native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGStringList")
class StringList extends JavaScriptObject
    with ListMixin<String>, ImmutableListMixin<String>
    implements List<String> {
  // To suppress missing implicit constructor warnings.
  factory StringList._() {
    throw UnsupportedError("Not supported");
  }

  @override
  int get length => JS("int", "#.length", this);

  int? get numberOfItems native;

  @override
  String operator [](int index) {
    if (JS("bool", "# >>> 0 !== # || # >= #", index, index, index, length)) {
      throw IndexError.withLength(index, length, indexable: this);
    }
    return getItem(index);
  }

  @override
  void operator []=(int index, String value) {
    throw UnsupportedError("Cannot assign element of immutable List.");
  }
  // -- start List<String> mixins.
  // String is the element type.

  @override
  set length(int newLength) {
    throw UnsupportedError("Cannot resize immutable List.");
  }

  @override
  String get first {
    if (length > 0) {
      return JS('String', '#[0]', this);
    }
    throw StateError("No elements");
  }

  @override
  String get last {
    int len = length;
    if (len > 0) {
      return JS('String', '#[#]', this, len - 1);
    }
    throw StateError("No elements");
  }

  @override
  String get single {
    int len = length;
    if (len == 1) {
      return JS('String', '#[0]', this);
    }
    if (len == 0) throw StateError("No elements");
    throw StateError("More than one element");
  }

  @override
  String elementAt(int index) => this[index];
  // -- end List<String> mixins.

  void __setter__(int index, String newItem) native;

  String appendItem(String newItem) native;

  @override
  void clear() native;

  String getItem(int index) native;

  String initialize(String newItem) native;

  String insertItemBefore(String item, int index) native;

  String removeItem(int index) native;

  String replaceItem(String newItem, int index) native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Native("SVGStyleElement")
class StyleElement extends SvgElement {
  // To suppress missing implicit constructor warnings.
  factory StyleElement._() {
    throw UnsupportedError("Not supported");
  }

  factory StyleElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("style") as StyleElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  StyleElement.created() : super.created();

  bool? get disabled native;

  set disabled(bool? value) native;

  String? get media native;

  set media(String? value) native;

  StyleSheet? get sheet native;

  // Use implementation from Element.
  // String? get title native;
  // void set title(String? value) native;

  String? get type native;

  set type(String? value) native;
}
// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class AttributeClassSet extends CssClassSetImpl {
  final Element _element;

  AttributeClassSet(this._element);

  @override
  Set<String> readClasses() {
    var classname = _element.attributes['class'];
    if (classname is AnimatedString) {
      classname = (classname as AnimatedString).baseVal;
    }

    Set<String> s = LinkedHashSet<String>();
    if (classname == null) {
      return s;
    }
    for (String name in classname.split(' ')) {
      String trimmed = name.trim();
      if (trimmed.isNotEmpty) {
        s.add(trimmed);
      }
    }
    return s;
  }

  @override
  void writeClasses(Set s) {
    _element.setAttribute('class', s.join(' '));
  }
}

@Unstable()
@Native("SVGElement")
class SvgElement extends Element implements GlobalEventHandlers, NoncedElement {
  static final _START_TAG_REGEXP = RegExp('<(\\w+)');

  factory SvgElement.tag(String tag) =>
      document.createElementNS("http://www.w3.org/2000/svg", tag) as SvgElement;
  factory SvgElement.svg(String svg,
      {NodeValidator? validator, NodeTreeSanitizer? treeSanitizer}) {
    if (validator == null && treeSanitizer == null) {
      validator = NodeValidatorBuilder.common()..allowSvg();
    }

    final match = _START_TAG_REGEXP.firstMatch(svg);
    Element parentElement;
    if (match != null && match.group(1)!.toLowerCase() == 'svg') {
      parentElement = document.body!;
    } else {
      parentElement = SvgSvgElement();
    }
    var fragment = parentElement.createFragment(svg,
        validator: validator, treeSanitizer: treeSanitizer);
    return fragment.nodes.whereType<SvgElement>().single as SvgElement;
  }

  @override
  CssClassSet get classes => AttributeClassSet(this);

  @override
  List<Element> get children => FilteredElementList(this);

  @override
  set children(List<Element> value) {
    final children = this.children;
    children.clear();
    children.addAll(value);
  }

  @override
  String? get outerHtml {
    final container = DivElement();
    final SvgElement cloned = clone(true) as SvgElement;
    container.children.add(cloned);
    return container.innerHtml;
  }

  @override
  String? get innerHtml {
    final container = DivElement();
    final SvgElement cloned = clone(true) as SvgElement;
    container.children.addAll(cloned.children);
    return container.innerHtml;
  }

  @override
  set innerHtml(String? value) {
    setInnerHtml(value);
  }

  @override
  DocumentFragment createFragment(String? svg,
      {NodeValidator? validator, NodeTreeSanitizer? treeSanitizer}) {
    if (treeSanitizer == null) {
      validator ??= new NodeValidatorBuilder.common()..allowSvg();
      treeSanitizer = NodeTreeSanitizer(validator);
    }

    // We create a fragment which will parse in the HTML parser
    var html = '<svg version="1.1">$svg</svg>';
    var fragment =
        document.body!.createFragment(html, treeSanitizer: treeSanitizer);

    var svgFragment = DocumentFragment();
    // The root is the <svg/> element, need to pull out the contents.
    var root = fragment.nodes.single;
    while (root.firstChild != null) {
      svgFragment.append(root.firstChild!);
    }
    return svgFragment;
  }

  // Unsupported methods inherited from Element.

  @override
  void insertAdjacentText(String where, String text) {
    throw UnsupportedError("Cannot invoke insertAdjacentText on SVG.");
  }

  @override
  void insertAdjacentHtml(String where, String text,
      {NodeValidator? validator, NodeTreeSanitizer? treeSanitizer}) {
    throw UnsupportedError("Cannot invoke insertAdjacentHtml on SVG.");
  }

  @override
  Element insertAdjacentElement(String where, Element element) {
    throw UnsupportedError("Cannot invoke insertAdjacentElement on SVG.");
  }

  HtmlCollection get _children {
    throw UnsupportedError("Cannot get _children on SVG.");
  }

  @override
  bool get isContentEditable => false;
  @override
  void click() {
    throw UnsupportedError("Cannot invoke click SVG.");
  }

  /// Checks to see if the SVG element type is supported by the current platform.
  ///
  /// The tag should be a valid SVG element tag name.
  static bool isTagSupported(String tag) {
    var e = SvgElement.tag(tag);
    return e is! UnknownElement;
  }

  // To suppress missing implicit constructor warnings.
  factory SvgElement._() {
    throw UnsupportedError("Not supported");
  }

  static const EventStreamProvider<Event> abortEvent =
      EventStreamProvider<Event>('abort');

  static const EventStreamProvider<Event> blurEvent =
      EventStreamProvider<Event>('blur');

  static const EventStreamProvider<Event> canPlayEvent =
      EventStreamProvider<Event>('canplay');

  static const EventStreamProvider<Event> canPlayThroughEvent =
      EventStreamProvider<Event>('canplaythrough');

  static const EventStreamProvider<Event> changeEvent =
      EventStreamProvider<Event>('change');

  static const EventStreamProvider<MouseEvent> clickEvent =
      EventStreamProvider<MouseEvent>('click');

  static const EventStreamProvider<MouseEvent> contextMenuEvent =
      EventStreamProvider<MouseEvent>('contextmenu');

  @DomName('SVGElement.dblclickEvent')
  static const EventStreamProvider<Event> doubleClickEvent =
      EventStreamProvider<Event>('dblclick');

  static const EventStreamProvider<MouseEvent> dragEvent =
      EventStreamProvider<MouseEvent>('drag');

  static const EventStreamProvider<MouseEvent> dragEndEvent =
      EventStreamProvider<MouseEvent>('dragend');

  static const EventStreamProvider<MouseEvent> dragEnterEvent =
      EventStreamProvider<MouseEvent>('dragenter');

  static const EventStreamProvider<MouseEvent> dragLeaveEvent =
      EventStreamProvider<MouseEvent>('dragleave');

  static const EventStreamProvider<MouseEvent> dragOverEvent =
      EventStreamProvider<MouseEvent>('dragover');

  static const EventStreamProvider<MouseEvent> dragStartEvent =
      EventStreamProvider<MouseEvent>('dragstart');

  static const EventStreamProvider<MouseEvent> dropEvent =
      EventStreamProvider<MouseEvent>('drop');

  static const EventStreamProvider<Event> durationChangeEvent =
      EventStreamProvider<Event>('durationchange');

  static const EventStreamProvider<Event> emptiedEvent =
      EventStreamProvider<Event>('emptied');

  static const EventStreamProvider<Event> endedEvent =
      EventStreamProvider<Event>('ended');

  static const EventStreamProvider<Event> errorEvent =
      EventStreamProvider<Event>('error');

  static const EventStreamProvider<Event> focusEvent =
      EventStreamProvider<Event>('focus');

  static const EventStreamProvider<Event> inputEvent =
      EventStreamProvider<Event>('input');

  static const EventStreamProvider<Event> invalidEvent =
      EventStreamProvider<Event>('invalid');

  static const EventStreamProvider<KeyboardEvent> keyDownEvent =
      EventStreamProvider<KeyboardEvent>('keydown');

  static const EventStreamProvider<KeyboardEvent> keyPressEvent =
      EventStreamProvider<KeyboardEvent>('keypress');

  static const EventStreamProvider<KeyboardEvent> keyUpEvent =
      EventStreamProvider<KeyboardEvent>('keyup');

  static const EventStreamProvider<Event> loadEvent =
      EventStreamProvider<Event>('load');

  static const EventStreamProvider<Event> loadedDataEvent =
      EventStreamProvider<Event>('loadeddata');

  static const EventStreamProvider<Event> loadedMetadataEvent =
      EventStreamProvider<Event>('loadedmetadata');

  static const EventStreamProvider<MouseEvent> mouseDownEvent =
      EventStreamProvider<MouseEvent>('mousedown');

  static const EventStreamProvider<MouseEvent> mouseEnterEvent =
      EventStreamProvider<MouseEvent>('mouseenter');

  static const EventStreamProvider<MouseEvent> mouseLeaveEvent =
      EventStreamProvider<MouseEvent>('mouseleave');

  static const EventStreamProvider<MouseEvent> mouseMoveEvent =
      EventStreamProvider<MouseEvent>('mousemove');

  static const EventStreamProvider<MouseEvent> mouseOutEvent =
      EventStreamProvider<MouseEvent>('mouseout');

  static const EventStreamProvider<MouseEvent> mouseOverEvent =
      EventStreamProvider<MouseEvent>('mouseover');

  static const EventStreamProvider<MouseEvent> mouseUpEvent =
      EventStreamProvider<MouseEvent>('mouseup');

  static const EventStreamProvider<WheelEvent> mouseWheelEvent =
      EventStreamProvider<WheelEvent>('mousewheel');

  static const EventStreamProvider<Event> pauseEvent =
      EventStreamProvider<Event>('pause');

  static const EventStreamProvider<Event> playEvent =
      EventStreamProvider<Event>('play');

  static const EventStreamProvider<Event> playingEvent =
      EventStreamProvider<Event>('playing');

  static const EventStreamProvider<Event> rateChangeEvent =
      EventStreamProvider<Event>('ratechange');

  static const EventStreamProvider<Event> resetEvent =
      EventStreamProvider<Event>('reset');

  static const EventStreamProvider<Event> resizeEvent =
      EventStreamProvider<Event>('resize');

  static const EventStreamProvider<Event> scrollEvent =
      EventStreamProvider<Event>('scroll');

  static const EventStreamProvider<Event> seekedEvent =
      EventStreamProvider<Event>('seeked');

  static const EventStreamProvider<Event> seekingEvent =
      EventStreamProvider<Event>('seeking');

  static const EventStreamProvider<Event> selectEvent =
      EventStreamProvider<Event>('select');

  static const EventStreamProvider<Event> stalledEvent =
      EventStreamProvider<Event>('stalled');

  static const EventStreamProvider<Event> submitEvent =
      EventStreamProvider<Event>('submit');

  static const EventStreamProvider<Event> suspendEvent =
      EventStreamProvider<Event>('suspend');

  static const EventStreamProvider<Event> timeUpdateEvent =
      EventStreamProvider<Event>('timeupdate');

  static const EventStreamProvider<TouchEvent> touchCancelEvent =
      EventStreamProvider<TouchEvent>('touchcancel');

  static const EventStreamProvider<TouchEvent> touchEndEvent =
      EventStreamProvider<TouchEvent>('touchend');

  static const EventStreamProvider<TouchEvent> touchMoveEvent =
      EventStreamProvider<TouchEvent>('touchmove');

  static const EventStreamProvider<TouchEvent> touchStartEvent =
      EventStreamProvider<TouchEvent>('touchstart');

  static const EventStreamProvider<Event> volumeChangeEvent =
      EventStreamProvider<Event>('volumechange');

  static const EventStreamProvider<Event> waitingEvent =
      EventStreamProvider<Event>('waiting');

  static const EventStreamProvider<WheelEvent> wheelEvent =
      EventStreamProvider<WheelEvent>('wheel');
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  SvgElement.created() : super.created();

  // Shadowing definition.
  @JSName('className')
  AnimatedString get _svgClassName native;

  @JSName('ownerSVGElement')
  SvgSvgElement? get ownerSvgElement native;

  // Use implementation from Element.
  // CssStyleDeclaration get style native;
  // void set style(CssStyleDeclaration value) native;

  // Use implementation from Element.
  // int? get tabIndex native;
  // void set tabIndex(int? value) native;

  SvgElement? get viewportElement native;

  @override
  void blur() native;

  @override
  void focus() native;

  // From NoncedElement

  @override
  String? get nonce native;

  @override
  set nonce(String? value) native;

  @override
  ElementStream<Event> get onAbort => abortEvent.forElement(this);

  @override
  ElementStream<Event> get onBlur => blurEvent.forElement(this);

  @override
  ElementStream<Event> get onCanPlay => canPlayEvent.forElement(this);

  @override
  ElementStream<Event> get onCanPlayThrough =>
      canPlayThroughEvent.forElement(this);

  @override
  ElementStream<Event> get onChange => changeEvent.forElement(this);

  @override
  ElementStream<MouseEvent> get onClick => clickEvent.forElement(this);

  @override
  ElementStream<MouseEvent> get onContextMenu =>
      contextMenuEvent.forElement(this);

  @override
  @DomName('SVGElement.ondblclick')
  ElementStream<Event> get onDoubleClick => doubleClickEvent.forElement(this);

  @override
  ElementStream<MouseEvent> get onDrag => dragEvent.forElement(this);

  @override
  ElementStream<MouseEvent> get onDragEnd => dragEndEvent.forElement(this);

  @override
  ElementStream<MouseEvent> get onDragEnter => dragEnterEvent.forElement(this);

  @override
  ElementStream<MouseEvent> get onDragLeave => dragLeaveEvent.forElement(this);

  @override
  ElementStream<MouseEvent> get onDragOver => dragOverEvent.forElement(this);

  @override
  ElementStream<MouseEvent> get onDragStart => dragStartEvent.forElement(this);

  @override
  ElementStream<MouseEvent> get onDrop => dropEvent.forElement(this);

  @override
  ElementStream<Event> get onDurationChange =>
      durationChangeEvent.forElement(this);

  @override
  ElementStream<Event> get onEmptied => emptiedEvent.forElement(this);

  @override
  ElementStream<Event> get onEnded => endedEvent.forElement(this);

  @override
  ElementStream<Event> get onError => errorEvent.forElement(this);

  @override
  ElementStream<Event> get onFocus => focusEvent.forElement(this);

  @override
  ElementStream<Event> get onInput => inputEvent.forElement(this);

  @override
  ElementStream<Event> get onInvalid => invalidEvent.forElement(this);

  @override
  ElementStream<KeyboardEvent> get onKeyDown => keyDownEvent.forElement(this);

  @override
  ElementStream<KeyboardEvent> get onKeyPress => keyPressEvent.forElement(this);

  @override
  ElementStream<KeyboardEvent> get onKeyUp => keyUpEvent.forElement(this);

  @override
  ElementStream<Event> get onLoad => loadEvent.forElement(this);

  @override
  ElementStream<Event> get onLoadedData => loadedDataEvent.forElement(this);

  @override
  ElementStream<Event> get onLoadedMetadata =>
      loadedMetadataEvent.forElement(this);

  @override
  ElementStream<MouseEvent> get onMouseDown => mouseDownEvent.forElement(this);

  @override
  ElementStream<MouseEvent> get onMouseEnter =>
      mouseEnterEvent.forElement(this);

  @override
  ElementStream<MouseEvent> get onMouseLeave =>
      mouseLeaveEvent.forElement(this);

  @override
  ElementStream<MouseEvent> get onMouseMove => mouseMoveEvent.forElement(this);

  @override
  ElementStream<MouseEvent> get onMouseOut => mouseOutEvent.forElement(this);

  @override
  ElementStream<MouseEvent> get onMouseOver => mouseOverEvent.forElement(this);

  @override
  ElementStream<MouseEvent> get onMouseUp => mouseUpEvent.forElement(this);

  @override
  ElementStream<WheelEvent> get onMouseWheel =>
      mouseWheelEvent.forElement(this);

  @override
  ElementStream<Event> get onPause => pauseEvent.forElement(this);

  @override
  ElementStream<Event> get onPlay => playEvent.forElement(this);

  @override
  ElementStream<Event> get onPlaying => playingEvent.forElement(this);

  @override
  ElementStream<Event> get onRateChange => rateChangeEvent.forElement(this);

  @override
  ElementStream<Event> get onReset => resetEvent.forElement(this);

  @override
  ElementStream<Event> get onResize => resizeEvent.forElement(this);

  @override
  ElementStream<Event> get onScroll => scrollEvent.forElement(this);

  @override
  ElementStream<Event> get onSeeked => seekedEvent.forElement(this);

  @override
  ElementStream<Event> get onSeeking => seekingEvent.forElement(this);

  @override
  ElementStream<Event> get onSelect => selectEvent.forElement(this);

  @override
  ElementStream<Event> get onStalled => stalledEvent.forElement(this);

  @override
  ElementStream<Event> get onSubmit => submitEvent.forElement(this);

  @override
  ElementStream<Event> get onSuspend => suspendEvent.forElement(this);

  @override
  ElementStream<Event> get onTimeUpdate => timeUpdateEvent.forElement(this);

  @override
  ElementStream<TouchEvent> get onTouchCancel =>
      touchCancelEvent.forElement(this);

  @override
  ElementStream<TouchEvent> get onTouchEnd => touchEndEvent.forElement(this);

  @override
  ElementStream<TouchEvent> get onTouchMove => touchMoveEvent.forElement(this);

  @override
  ElementStream<TouchEvent> get onTouchStart =>
      touchStartEvent.forElement(this);

  @override
  ElementStream<Event> get onVolumeChange => volumeChangeEvent.forElement(this);

  @override
  ElementStream<Event> get onWaiting => waitingEvent.forElement(this);

  @override
  ElementStream<WheelEvent> get onWheel => wheelEvent.forElement(this);
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGSVGElement")
class SvgSvgElement extends GraphicsElement
    implements FitToViewBox, ZoomAndPan {
  factory SvgSvgElement() {
    final el = SvgElement.tag("svg");
    // The SVG spec requires the version attribute to match the spec version
    el.attributes['version'] = "1.1";
    return el as SvgSvgElement;
  }

  // To suppress missing implicit constructor warnings.
  factory SvgSvgElement._() {
    throw UnsupportedError("Not supported");
  }
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  SvgSvgElement.created() : super.created();

  num? get currentScale native;

  set currentScale(num? value) native;

  Point? get currentTranslate native;

  AnimatedLength? get height native;

  AnimatedLength? get width native;

  AnimatedLength? get x native;

  AnimatedLength? get y native;

  bool animationsPaused() native;

  bool checkEnclosure(SvgElement element, Rect rect) native;

  bool checkIntersection(SvgElement element, Rect rect) native;

  @JSName('createSVGAngle')
  Angle createSvgAngle() native;

  @JSName('createSVGLength')
  Length createSvgLength() native;

  @JSName('createSVGMatrix')
  Matrix createSvgMatrix() native;

  @JSName('createSVGNumber')
  Number createSvgNumber() native;

  @JSName('createSVGPoint')
  Point createSvgPoint() native;

  @JSName('createSVGRect')
  Rect createSvgRect() native;

  @JSName('createSVGTransform')
  Transform createSvgTransform() native;

  @JSName('createSVGTransformFromMatrix')
  Transform createSvgTransformFromMatrix(Matrix matrix) native;

  void deselectAll() native;

  void forceRedraw() native;

  double getCurrentTime() native;

  Element getElementById(String elementId) native;

  @Returns('NodeList')
  @Creates('NodeList')
  List<Node> getEnclosureList(Rect rect, SvgElement? referenceElement) native;

  @Returns('NodeList')
  @Creates('NodeList')
  List<Node> getIntersectionList(Rect rect, SvgElement? referenceElement)
      native;

  void pauseAnimations() native;

  void setCurrentTime(num seconds) native;

  int suspendRedraw(int maxWaitMilliseconds) native;

  void unpauseAnimations() native;

  void unsuspendRedraw(int suspendHandleId) native;

  void unsuspendRedrawAll() native;

  // From SVGFitToViewBox

  @override
  AnimatedPreserveAspectRatio? get preserveAspectRatio native;

  @override
  AnimatedRect? get viewBox native;

  // From SVGZoomAndPan

  @override
  int? get zoomAndPan native;

  @override
  set zoomAndPan(int? value) native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGSwitchElement")
class SwitchElement extends GraphicsElement {
  // To suppress missing implicit constructor warnings.
  factory SwitchElement._() {
    throw UnsupportedError("Not supported");
  }

  factory SwitchElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("switch")
          as SwitchElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  SwitchElement.created() : super.created();
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGSymbolElement")
class SymbolElement extends SvgElement implements FitToViewBox {
  // To suppress missing implicit constructor warnings.
  factory SymbolElement._() {
    throw UnsupportedError("Not supported");
  }

  factory SymbolElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("symbol")
          as SymbolElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  SymbolElement.created() : super.created();

  // From SVGFitToViewBox

  @override
  AnimatedPreserveAspectRatio? get preserveAspectRatio native;

  @override
  AnimatedRect? get viewBox native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGTSpanElement")
class TSpanElement extends TextPositioningElement {
  // To suppress missing implicit constructor warnings.
  factory TSpanElement._() {
    throw UnsupportedError("Not supported");
  }

  factory TSpanElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("tspan") as TSpanElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  TSpanElement.created() : super.created();
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
abstract class Tests extends JavaScriptObject {
  // To suppress missing implicit constructor warnings.
  factory Tests._() {
    throw UnsupportedError("Not supported");
  }

  StringList? get requiredExtensions native;

  StringList? get systemLanguage native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGTextContentElement")
class TextContentElement extends GraphicsElement {
  // To suppress missing implicit constructor warnings.
  factory TextContentElement._() {
    throw UnsupportedError("Not supported");
  }
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  TextContentElement.created() : super.created();

  static const int LENGTHADJUST_SPACING = 1;

  static const int LENGTHADJUST_SPACINGANDGLYPHS = 2;

  static const int LENGTHADJUST_UNKNOWN = 0;

  AnimatedEnumeration? get lengthAdjust native;

  AnimatedLength? get textLength native;

  int getCharNumAtPosition(Point point) native;

  double getComputedTextLength() native;

  Point getEndPositionOfChar(int charnum) native;

  Rect getExtentOfChar(int charnum) native;

  int getNumberOfChars() native;

  double getRotationOfChar(int charnum) native;

  Point getStartPositionOfChar(int charnum) native;

  double getSubStringLength(int charnum, int nchars) native;

  void selectSubString(int charnum, int nchars) native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGTextElement")
class TextElement extends TextPositioningElement {
  // To suppress missing implicit constructor warnings.
  factory TextElement._() {
    throw UnsupportedError("Not supported");
  }

  factory TextElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("text") as TextElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  TextElement.created() : super.created();
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGTextPathElement")
class TextPathElement extends TextContentElement implements UriReference {
  // To suppress missing implicit constructor warnings.
  factory TextPathElement._() {
    throw UnsupportedError("Not supported");
  }
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  TextPathElement.created() : super.created();

  static const int TEXTPATH_METHODTYPE_ALIGN = 1;

  static const int TEXTPATH_METHODTYPE_STRETCH = 2;

  static const int TEXTPATH_METHODTYPE_UNKNOWN = 0;

  static const int TEXTPATH_SPACINGTYPE_AUTO = 1;

  static const int TEXTPATH_SPACINGTYPE_EXACT = 2;

  static const int TEXTPATH_SPACINGTYPE_UNKNOWN = 0;

  AnimatedEnumeration? get method native;

  AnimatedEnumeration? get spacing native;

  AnimatedLength? get startOffset native;

  // From SVGURIReference

  @override
  AnimatedString? get href native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGTextPositioningElement")
class TextPositioningElement extends TextContentElement {
  // To suppress missing implicit constructor warnings.
  factory TextPositioningElement._() {
    throw UnsupportedError("Not supported");
  }
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  TextPositioningElement.created() : super.created();

  AnimatedLengthList? get dx native;

  AnimatedLengthList? get dy native;

  AnimatedNumberList? get rotate native;

  AnimatedLengthList? get x native;

  AnimatedLengthList? get y native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGTitleElement")
class TitleElement extends SvgElement {
  // To suppress missing implicit constructor warnings.
  factory TitleElement._() {
    throw UnsupportedError("Not supported");
  }

  factory TitleElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("title") as TitleElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  TitleElement.created() : super.created();
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGTransform")
class Transform extends JavaScriptObject {
  // To suppress missing implicit constructor warnings.
  factory Transform._() {
    throw UnsupportedError("Not supported");
  }

  static const int SVG_TRANSFORM_MATRIX = 1;

  static const int SVG_TRANSFORM_ROTATE = 4;

  static const int SVG_TRANSFORM_SCALE = 3;

  static const int SVG_TRANSFORM_SKEWX = 5;

  static const int SVG_TRANSFORM_SKEWY = 6;

  static const int SVG_TRANSFORM_TRANSLATE = 2;

  static const int SVG_TRANSFORM_UNKNOWN = 0;

  num? get angle native;

  Matrix? get matrix native;

  int? get type native;

  void setMatrix(Matrix matrix) native;

  void setRotate(num angle, num cx, num cy) native;

  void setScale(num sx, num sy) native;

  void setSkewX(num angle) native;

  void setSkewY(num angle) native;

  void setTranslate(num tx, num ty) native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGTransformList")
class TransformList extends JavaScriptObject
    with ListMixin<Transform>, ImmutableListMixin<Transform>
    implements List<Transform> {
  // To suppress missing implicit constructor warnings.
  factory TransformList._() {
    throw UnsupportedError("Not supported");
  }

  @override
  int get length => JS("int", "#.length", this);

  int? get numberOfItems native;

  @override
  Transform operator [](int index) {
    if (JS("bool", "# >>> 0 !== # || # >= #", index, index, index, length)) {
      throw IndexError.withLength(index, length, indexable: this);
    }
    return getItem(index);
  }

  @override
  void operator []=(int index, Transform value) {
    throw UnsupportedError("Cannot assign element of immutable List.");
  }
  // -- start List<Transform> mixins.
  // Transform is the element type.

  @override
  set length(int newLength) {
    throw UnsupportedError("Cannot resize immutable List.");
  }

  @override
  Transform get first {
    if (length > 0) {
      return JS('Transform', '#[0]', this);
    }
    throw StateError("No elements");
  }

  @override
  Transform get last {
    int len = length;
    if (len > 0) {
      return JS('Transform', '#[#]', this, len - 1);
    }
    throw StateError("No elements");
  }

  @override
  Transform get single {
    int len = length;
    if (len == 1) {
      return JS('Transform', '#[0]', this);
    }
    if (len == 0) throw StateError("No elements");
    throw StateError("More than one element");
  }

  @override
  Transform elementAt(int index) => this[index];
  // -- end List<Transform> mixins.

  void __setter__(int index, Transform newItem) native;

  Transform appendItem(Transform newItem) native;

  @override
  void clear() native;

  Transform? consolidate() native;

  @JSName('createSVGTransformFromMatrix')
  Transform createSvgTransformFromMatrix(Matrix matrix) native;

  Transform getItem(int index) native;

  Transform initialize(Transform newItem) native;

  Transform insertItemBefore(Transform newItem, int index) native;

  Transform removeItem(int index) native;

  Transform replaceItem(Transform newItem, int index) native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGUnitTypes")
class UnitTypes extends JavaScriptObject {
  // To suppress missing implicit constructor warnings.
  factory UnitTypes._() {
    throw UnsupportedError("Not supported");
  }

  static const int SVG_UNIT_TYPE_OBJECTBOUNDINGBOX = 2;

  static const int SVG_UNIT_TYPE_UNKNOWN = 0;

  static const int SVG_UNIT_TYPE_USERSPACEONUSE = 1;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
abstract class UriReference extends JavaScriptObject {
  // To suppress missing implicit constructor warnings.
  factory UriReference._() {
    throw UnsupportedError("Not supported");
  }

  AnimatedString? get href native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGUseElement")
class UseElement extends GraphicsElement implements UriReference {
  // To suppress missing implicit constructor warnings.
  factory UseElement._() {
    throw UnsupportedError("Not supported");
  }

  factory UseElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("use") as UseElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  UseElement.created() : super.created();

  AnimatedLength? get height native;

  AnimatedLength? get width native;

  AnimatedLength? get x native;

  AnimatedLength? get y native;

  // From SVGURIReference

  @override
  AnimatedString? get href native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGViewElement")
class ViewElement extends SvgElement implements FitToViewBox, ZoomAndPan {
  // To suppress missing implicit constructor warnings.
  factory ViewElement._() {
    throw UnsupportedError("Not supported");
  }

  factory ViewElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("view") as ViewElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  ViewElement.created() : super.created();

  // From SVGFitToViewBox

  @override
  AnimatedPreserveAspectRatio? get preserveAspectRatio native;

  @override
  AnimatedRect? get viewBox native;

  // From SVGZoomAndPan

  @override
  int? get zoomAndPan native;

  @override
  set zoomAndPan(int? value) native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
abstract class ZoomAndPan extends JavaScriptObject {
  // To suppress missing implicit constructor warnings.
  factory ZoomAndPan._() {
    throw UnsupportedError("Not supported");
  }

  static const int SVG_ZOOMANDPAN_DISABLE = 1;

  static const int SVG_ZOOMANDPAN_MAGNIFY = 2;

  static const int SVG_ZOOMANDPAN_UNKNOWN = 0;

  int? get zoomAndPan native;

  set zoomAndPan(int? value) native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGGradientElement")
class _GradientElement extends SvgElement implements UriReference {
  // To suppress missing implicit constructor warnings.
  factory _GradientElement._() {
    throw UnsupportedError("Not supported");
  }
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  _GradientElement.created() : super.created();

  static const int SVG_SPREADMETHOD_PAD = 1;

  static const int SVG_SPREADMETHOD_REFLECT = 2;

  static const int SVG_SPREADMETHOD_REPEAT = 3;

  static const int SVG_SPREADMETHOD_UNKNOWN = 0;

  AnimatedTransformList? get gradientTransform native;

  AnimatedEnumeration? get gradientUnits native;

  AnimatedEnumeration? get spreadMethod native;

  // From SVGURIReference

  @override
  AnimatedString? get href native;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Unstable()
@Native("SVGComponentTransferFunctionElement")
abstract class _SVGComponentTransferFunctionElement extends SvgElement {
  // To suppress missing implicit constructor warnings.
  factory _SVGComponentTransferFunctionElement._() {
    throw UnsupportedError("Not supported");
  }
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  _SVGComponentTransferFunctionElement.created() : super.created();
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Native("SVGFEDropShadowElement")
abstract class _SVGFEDropShadowElement extends SvgElement
    implements FilterPrimitiveStandardAttributes {
  // To suppress missing implicit constructor warnings.
  factory _SVGFEDropShadowElement._() {
    throw UnsupportedError("Not supported");
  }
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  _SVGFEDropShadowElement.created() : super.created();

  // From SVGFilterPrimitiveStandardAttributes
}

// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Native("SVGMPathElement")
abstract class _SVGMPathElement extends SvgElement implements UriReference {
  // To suppress missing implicit constructor warnings.
  factory _SVGMPathElement._() {
    throw UnsupportedError("Not supported");
  }

  factory _SVGMPathElement() =>
      _SvgElementFactoryProvider.createSvgElement_tag("mpath")
          as _SVGMPathElement;
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  _SVGMPathElement.created() : super.created();

  // From SVGURIReference
}
