// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

import 'dart:convert';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
  Model({
    this.from,
    this.to,
    this.count,
    this.links,
    this.hits,
  });

  final int? from;
  final int? to;
  final int? count;
  final ModelLinks? links;
  final List<Hit>? hits;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    from: json["from"],
    to: json["to"],
    count: json["count"],
    links: json["_links"] == null ? null : ModelLinks.fromJson(json["_links"]),
    hits: json["hits"] == null ? null : List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "from": from,
    "to": to,
    "count": count,
    "_links": links ,
    "hits": hits ,
  };
}

class Hit {
  Hit({
    this.recipe,
    this.links,
  });

  final Recipe? recipe;
  final HitLinks? links;

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
    recipe: json["recipe"] == null ? null : Recipe.fromJson(json["recipe"]),
    links: json["_links"] == null ? null : HitLinks.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "recipe": recipe,
    "_links": links ,
  };
}

class HitLinks {
  HitLinks({
    this.self,
  });

  final Next? self;

  factory HitLinks.fromJson(Map<String, dynamic> json) => HitLinks(
    self: json["self"] == null ? null : Next.fromJson(json["self"]),
  );

  Map<String, dynamic> toJson() => {
    "self": self ,
  };
}

class Next {
  Next({
    this.href,
    this.title,
  });

  final String? href;
  final Title? title;

  factory Next.fromJson(Map<String, dynamic> json) => Next(
    href: json["href"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
    "title": title,
  };
}

enum Title { NEXT_PAGE, SELF }

final titleValues = EnumValues({
  "Next page": Title.NEXT_PAGE,
  "Self": Title.SELF
});

class Recipe {
  Recipe({
    this.uri,
    this.label,
    this.image,
    this.images,
    this.source,
    this.url,
    this.shareAs,
    this.recipeYield,
    this.dietLabels,
    this.healthLabels,
    this.cautions,
    this.ingredientLines,
    this.ingredients,
    this.calories,
    this.totalWeight,
    this.totalTime,
    this.cuisineType,
    this.mealType,
    this.dishType,
    this.totalNutrients,
    this.totalDaily,
    this.digest,
  });

  final String? uri;
  final String? label;
  final String? image;
  final Images? images;
  final String? source;
  final String? url;
  final String? shareAs;
  final int? recipeYield;
  final List<String>? dietLabels;
  final List<String>? healthLabels;
  final List<Caution>? cautions;
  final List<String>? ingredientLines;
  final List<Ingredient>? ingredients;
  final double? calories;
  final double? totalWeight;
  final int? totalTime;
  final List<String>? cuisineType;
  final List<MealType>? mealType;
  final List<String>? dishType;
  final Map<String, Total>? totalNutrients;
  final Map<String, Total>? totalDaily;
  final List<Digest>? digest;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    uri: json["uri"],
    label: json["label"],
    image: json["image"],
    images: json["images"] == null ? null : Images.fromJson(json["images"]),
    source: json["source"],
    url: json["url"],
    shareAs: json["shareAs"],
    recipeYield: json["yield"],
    dietLabels: json["dietLabels"] == null ? null : List<String>.from(json["dietLabels"].map((x) => x)),
    healthLabels: json["healthLabels"] == null ? null : List<String>.from(json["healthLabels"].map((x) => x)),
    cautions: json["cautions"] == null ? null : List<Caution>.from(json["cautions"].map((x) => cautionValues.map![x])),
    ingredientLines: json["ingredientLines"] == null ? null : List<String>.from(json["ingredientLines"].map((x) => x)),
    ingredients: json["ingredients"] == null ? null : List<Ingredient>.from(json["ingredients"].map((x) => Ingredient.fromJson(x))),
    calories: json["calories"] ,
    totalWeight: json["totalWeight"] ,
    totalTime: json["totalTime"],
    cuisineType: json["cuisineType"] == null ? null : List<String>.from(json["cuisineType"].map((x) => x)),
    mealType: json["mealType"] == null ? null : List<MealType>.from(json["mealType"].map((x) => mealTypeValues.map![x])),
    dishType: json["dishType"] == null ? null : List<String>.from(json["dishType"].map((x) => x)),
    totalNutrients: json["totalNutrients"] == null ? null : Map.from(json["totalNutrients"]).map((k, v) => MapEntry<String, Total>(k, Total.fromJson(v))),
    totalDaily: json["totalDaily"] == null ? null : Map.from(json["totalDaily"]).map((k, v) => MapEntry<String, Total>(k, Total.fromJson(v))),
    digest: json["digest"] == null ? null : List<Digest>.from(json["digest"].map((x) => Digest.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "label": label,
    "image": image,
    "images": images ,
    "source": source,
    "url": url ,
    "shareAs": shareAs ,
    "yield": recipeYield ,
    "dietLabels": dietLabels ,
    "healthLabels": healthLabels ,
    "cautions": cautions ,
    "ingredientLines": ingredientLines ,
    "ingredients": ingredients ,
    "calories": calories ,
    "totalWeight": totalWeight ,
    "totalTime": totalTime ,
    "cuisineType": cuisineType ,
    "mealType": mealType ,
    "dishType": dishType ,
    "totalNutrients": totalNutrients ,
    "totalDaily": totalDaily ,
    "digest": digest ,
  };
}

enum Caution { SULFITES, SOY, EGGS, MILK, FODMAP }

final cautionValues = EnumValues({
  "Eggs": Caution.EGGS,
  "FODMAP": Caution.FODMAP,
  "Milk": Caution.MILK,
  "Soy": Caution.SOY,
  "Sulfites": Caution.SULFITES
});

class Digest {
  Digest({
    this.label,
    this.tag,
    this.schemaOrgTag,
    this.total,
    this.hasRdi,
    this.daily,
    this.unit,
    this.sub,
  });

  final String? label;
  final String? tag;
  final SchemaOrgTag? schemaOrgTag;
  final double? total;
  final bool? hasRdi;
  final double? daily;
  final Unit? unit;
  final List<Digest>? sub;

  factory Digest.fromJson(Map<String, dynamic> json) => Digest(
    label: json["label"] ,
    tag: json["tag"] ,
    schemaOrgTag: json["schemaOrgTag"] ,
    total: json["total"] ,
    hasRdi: json["hasRDI"] ,
    daily: json["daily"] ,
    unit: json["unit"] ,
    sub: json["sub"] ,
  );

  Map<String, dynamic> toJson() => {
    "label": label ,
    "tag": tag ,
    "schemaOrgTag": schemaOrgTag,
    "total": total ,
    "hasRDI": hasRdi,
    "daily": daily,
    "unit": unit ,
    "sub": sub ,
  };
}

enum SchemaOrgTag { FAT_CONTENT, CARBOHYDRATE_CONTENT, PROTEIN_CONTENT, CHOLESTEROL_CONTENT, SODIUM_CONTENT, SATURATED_FAT_CONTENT, TRANS_FAT_CONTENT, FIBER_CONTENT, SUGAR_CONTENT }

final schemaOrgTagValues = EnumValues({
  "carbohydrateContent": SchemaOrgTag.CARBOHYDRATE_CONTENT,
  "cholesterolContent": SchemaOrgTag.CHOLESTEROL_CONTENT,
  "fatContent": SchemaOrgTag.FAT_CONTENT,
  "fiberContent": SchemaOrgTag.FIBER_CONTENT,
  "proteinContent": SchemaOrgTag.PROTEIN_CONTENT,
  "saturatedFatContent": SchemaOrgTag.SATURATED_FAT_CONTENT,
  "sodiumContent": SchemaOrgTag.SODIUM_CONTENT,
  "sugarContent": SchemaOrgTag.SUGAR_CONTENT,
  "transFatContent": SchemaOrgTag.TRANS_FAT_CONTENT
});

enum Unit { G, MG, UNIT_G, EMPTY, KCAL }

final unitValues = EnumValues({
  "%": Unit.EMPTY,
  "g": Unit.G,
  "kcal": Unit.KCAL,
  "mg": Unit.MG,
  "µg": Unit.UNIT_G
});

class Images {
  Images({
    this.thumbnail,
    this.small,
    this.regular,
    this.large,
  });

  final Large? thumbnail;
  final Large? small;
  final Large? regular;
  final Large? large;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    thumbnail: json["THUMBNAIL"] == null ? null : Large.fromJson(json["THUMBNAIL"]),
    small: json["SMALL"] == null ? null : Large.fromJson(json["SMALL"]),
    regular: json["REGULAR"] == null ? null : Large.fromJson(json["REGULAR"]),
    large: json["LARGE"] == null ? null : Large.fromJson(json["LARGE"]),
  );

  Map<String, dynamic> toJson() => {
    "THUMBNAIL": thumbnail,
    "SMALL": small ,
    "REGULAR": regular ,
    "LARGE": large ,
  };
}

class Large {
  Large({
    this.url,
    this.width,
    this.height,
  });

  final String? url;
  final int? width;
  final int? height;

  factory Large.fromJson(Map<String, dynamic> json) => Large(
    url: json["url"],
    width: json["width"] ,
    height: json["height"] ,
  );

  Map<String, dynamic> toJson() => {
    "url": url ,
    "width": width ,
    "height": height,
  };
}

class Ingredient {
  Ingredient({
    this.text,
    this.quantity,
    this.measure,
    this.food,
    this.weight,
    this.foodCategory,
    this.foodId,
    this.image,
  });

  final String? text;
  final double? quantity;
  final String? measure;
  final String? food;
  final double? weight;
  final String? foodCategory;
  final String? foodId;
  final String? image;

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
    text: json["text"] ,
    quantity: json["quantity"] ,
    measure: json["measure"] ,
    food: json["food"] ,
    weight: json["weight"] ,
    foodCategory: json["foodCategory"] ,
    foodId: json["foodId"],
    image: json["image"] ,
  );

  Map<String, dynamic> toJson() => {
    "text": text ,
    "quantity": quantity ,
    "measure": measure ,
    "food": food ,
    "weight": weight ,
    "foodCategory": foodCategory ,
    "foodId": foodId ,
    "image": image,
  };
}

enum MealType { BREAKFAST, LUNCH_DINNER }

final mealTypeValues = EnumValues({
  "breakfast": MealType.BREAKFAST,
  "lunch/dinner": MealType.LUNCH_DINNER
});

class Total {
  Total({
    this.label,
    this.quantity,
    this.unit,
  });

  final String? label;
  final double? quantity;
  final Unit? unit;

  factory Total.fromJson(Map<String, dynamic> json) => Total(
    label: json["label"] ,
    quantity: json["quantity"] ,
    unit: json["unit"],
  );

  Map<String, dynamic> toJson() => {
    "label": label ,
    "quantity": quantity ,
    "unit": unit,
  };
}

class ModelLinks {
  ModelLinks({
    this.next,
  });

  final Next? next;

  factory ModelLinks.fromJson(Map<String, dynamic> json) => ModelLinks(
    next: json["next"] == null ? null : Next.fromJson(json["next"]),
  );

  Map<String, dynamic> toJson() => {
    "next": next ,
  };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map?.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
