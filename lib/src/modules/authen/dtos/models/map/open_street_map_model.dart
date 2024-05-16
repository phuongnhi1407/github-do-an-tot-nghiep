class StreetMap {
  final String type;
  final List<double> bbox;
  final List<Feature> features;
  final Metadata metadata;

  StreetMap({
    required this.type,
    required this.bbox,
    required this.features,
    required this.metadata,
  });

  factory StreetMap.fromJson(Map<String, dynamic> json) {
    return StreetMap(
      type: json['type'],
      bbox: List<double>.from(json['bbox']),
      features: List<Feature>.from(
          json['features'].map((feature) => Feature.fromJson(feature))),
      metadata: Metadata.fromJson(json['metadata']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'bbox': bbox,
      'features': features.map((feature) => feature.toJson()).toList(),
      'metadata': metadata.toJson(),
    };
  }
}

class Feature {
  final String type;
  final List<double> bbox;
  final Properties properties;
  final Geometry geometry;

  Feature({
    required this.type,
    required this.bbox,
    required this.properties,
    required this.geometry,
  });

  factory Feature.fromJson(Map<String, dynamic> json) {
    return Feature(
      type: json['type'],
      bbox: List<double>.from(json['bbox']),
      properties: Properties.fromJson(json['properties']),
      geometry: Geometry.fromJson(json['geometry']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'bbox': bbox,
      'properties': properties.toJson(),
      'geometry': geometry.toJson(),
    };
  }
}

class Properties {
  final List<Segment> segments;
  final Summary summary;
  final List<int> wayPoints;

  Properties({
    required this.segments,
    required this.summary,
    required this.wayPoints,
  });

  factory Properties.fromJson(Map<String, dynamic> json) {
    return Properties(
      segments: List<Segment>.from(
          json['segments'].map((segment) => Segment.fromJson(segment))),
      summary: Summary.fromJson(json['summary']),
      wayPoints: List<int>.from(json['way_points']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'segments': segments.map((segment) => segment.toJson()).toList(),
      'summary': summary.toJson(),
      'way_points': wayPoints,
    };
  }
}

class Segment {
  final double distance;
  final double duration;
  final List<Step> steps;

  Segment({
    required this.distance,
    required this.duration,
    required this.steps,
  });

  factory Segment.fromJson(Map<String, dynamic> json) {
    return Segment(
      distance: json['distance'].toDouble(),
      duration: json['duration'].toDouble(),
      steps: List<Step>.from(json['steps'].map((step) => Step.fromJson(step))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'distance': distance,
      'duration': duration,
      'steps': steps.map((step) => step.toJson()).toList(),
    };
  }
}

class Step {
  final double distance;
  final double duration;
  final int type;
  final String instruction;
  final String name;
  final List<int> wayPoints;

  Step({
    required this.distance,
    required this.duration,
    required this.type,
    required this.instruction,
    required this.name,
    required this.wayPoints,
  });

  factory Step.fromJson(Map<String, dynamic> json) {
    return Step(
      distance: json['distance'].toDouble(),
      duration: json['duration'].toDouble(),
      type: json['type'],
      instruction: json['instruction'],
      name: json['name'],
      wayPoints: List<int>.from(json['way_points']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'distance': distance,
      'duration': duration,
      'type': type,
      'instruction': instruction,
      'name': name,
      'way_points': wayPoints,
    };
  }
}

class Summary {
  final double distance;
  final double duration;

  Summary({
    required this.distance,
    required this.duration,
  });

  factory Summary.fromJson(Map<String, dynamic> json) {
    return Summary(
      distance: json['distance'].toDouble(),
      duration: json['duration'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'distance': distance,
      'duration': duration,
    };
  }
}

class Geometry {
  final String type;
  final List<List<double>> coordinates;

  Geometry({
    required this.type,
    required this.coordinates,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) {
    return Geometry(
      type: json['type'],
      coordinates: List<List<double>>.from(
          json['coordinates'].map((coord) => List<double>.from(coord))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'coordinates': coordinates,
    };
  }
}

class Metadata {
  final String attribution;
  final String service;
  final int timestamp;
  final Query query;
  final Engine engine;

  Metadata({
    required this.attribution,
    required this.service,
    required this.timestamp,
    required this.query,
    required this.engine,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      attribution: json['attribution'],
      service: json['service'],
      timestamp: json['timestamp'],
      query: Query.fromJson(json['query']),
      engine: Engine.fromJson(json['engine']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'attribution': attribution,
      'service': service,
      'timestamp': timestamp,
      'query': query.toJson(),
      'engine': engine.toJson(),
    };
  }
}

class Query {
  final List<List<double>> coordinates;
  final String profile;
  final String format;

  Query({
    required this.coordinates,
    required this.profile,
    required this.format,
  });

  factory Query.fromJson(Map<String, dynamic> json) {
    return Query(
      coordinates: List<List<double>>.from(
          json['coordinates'].map((coord) => List<double>.from(coord))),
      profile: json['profile'],
      format: json['format'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'coordinates': coordinates,
      'profile': profile,
      'format': format,
    };
  }
}

class Engine {
  final String version;
  final String buildDate;
  final String graphDate;

  Engine({
    required this.version,
    required this.buildDate,
    required this.graphDate,
  });

  factory Engine.fromJson(Map<String, dynamic> json) {
    return Engine(
      version: json['version'],
      buildDate: json['build_date'],
      graphDate: json['graph_date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'version': version,
      'build_date': buildDate,
      'graph_date': graphDate,
    };
  }
}
