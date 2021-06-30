class ThemeModel {
  String styleID;
  TkArcHr tkHr;
  String tkSecs;
  TKText tkText;

  ThemeModel({this.styleID, this.tkHr, this.tkText});
  factory ThemeModel.fromJson(Map<String, dynamic> tkStyle) {
    return ThemeModel(
        styleID: tkStyle['id'],
        tkHr: tkStyle['tkHr'],
        tkText: tkStyle['tkTxt']);
  }
}

class TkArcHr {
  BgCircle bgCircle;
  TkArc tkArc;

  TkArcHr({this.bgCircle, this.tkArc});
  factory TkArcHr.fromJson(Map<String, dynamic> tkHr) {
    return TkArcHr(bgCircle: tkHr['bgCircle'], tkArc: tkHr['tkArc']);
  }
}

class BgCircle {
  String outerRadius;
  String innerRadius;
  Fill fill;

  BgCircle({this.outerRadius, this.innerRadius, this.fill});
  factory BgCircle.fromJson(Map<String, dynamic> arcStyle) {
    return BgCircle(
        outerRadius: arcStyle['outerRadius'],
        innerRadius: arcStyle['innerRadius'],
        fill: arcStyle['fill']);
  }
}

class TkArc {
  String outerRadius;
  String innerRadius;
  Fill fill;

  TkArc({this.outerRadius, this.innerRadius, this.fill});
  factory TkArc.fromJson(Map<String, dynamic> arcStyle) {
    return TkArc(
        outerRadius: arcStyle['outerRadius'],
        innerRadius: arcStyle['innerRadius'],
        fill: arcStyle['fill']);
  }
}

class Fill {
  Gradient gradient;
  Fill({this.gradient});
  factory Fill.fromJson(Map<String, dynamic> fillStyle) {
    return Fill(gradient: fillStyle['gradient']);
  }
}

class Gradient {
  String type;
  String color1;
  String color2;
  String color3;

  Gradient({this.type, this.color1, this.color2, this.color3});

  factory Gradient.fromJson(Map<String, dynamic> gradientStyle) {
    return Gradient(
        type: gradientStyle['type'],
        color1: gradientStyle['color1'],
        color2: gradientStyle['color2'],
        color3: gradientStyle['color3']);
  }
}

class TKText {
  String font;
  String size;
  String color;

  TKText({this.font, this.size, this.color});
  factory TKText.fromJson(Map<String, dynamic> textStyle) {
    return TKText(
        font: textStyle['font'],
        size: textStyle['size'],
        color: textStyle['color']);
  }
}
