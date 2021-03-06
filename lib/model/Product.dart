import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/model/ProductImage.dart';
import 'package:openfoodfacts/utils/JsonHelper.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import '../interface/JsonObject.dart';
import 'Additives.dart';
import 'Allergens.dart';
import 'EnvironmentImpactLevels.dart';
import 'Ingredient.dart';
import 'IngredientsAnalysisTags.dart';
import 'NutrientLevels.dart';
import 'Nutriments.dart';

part 'Product.g.dart';

@JsonSerializable()
class Product extends JsonObject {
  @JsonKey(name: 'code', nullable: false)
  String barcode;
  @JsonKey(name: 'product_name', nullable: false)
  String productName;
  @JsonKey(name: 'product_name_de', includeIfNull: false)
  String productNameDE;
  @JsonKey(name: 'product_name_en', includeIfNull: false)
  String productNameEN;
  @JsonKey(name: 'product_name_fr', includeIfNull: false)
  String productNameFR;
  String brands;
  @JsonKey(name: 'brands_tags')
  List<String> brandsTags;
  @JsonKey(
      name: 'lang',
      toJson: LanguageHelper.toJson,
      fromJson: LanguageHelper.fromJson,
      includeIfNull: false)
  OpenFoodFactsLanguage lang;
  String quantity;
  @JsonKey(name: 'image_small_url')
  String imgSmallUrl;
  @JsonKey(name: 'serving_size')
  String servingSize;
  @JsonKey(
      name: 'serving_quantity', fromJson: JsonHelper.servingQuantityFromJson)
  double servingQuantity;
  @JsonKey(name: 'product_quantity')
  dynamic packagingQuantity;

  /// cause nesting is sooo cool ;)
  @JsonKey(
      name: 'selected_images',
      includeIfNull: false,
      fromJson: JsonHelper.selectedImagesFromJson,
      toJson: JsonHelper.selectedImagesToJson)
  List<ProductImage> selectedImages;

  @JsonKey(
      name: 'images',
      includeIfNull: false,
      fromJson: JsonHelper.imagesFromJson,
      toJson: JsonHelper.imagesToJson)
  List<ProductImage> images;

  @JsonKey(includeIfNull: false, toJson: JsonHelper.ingredientsToJson)
  List<Ingredient> ingredients;

  @JsonKey(includeIfNull: false, toJson: Nutriments.toJsonHelper)
  Nutriments nutriments;

  @JsonKey(
      name: 'additives_tags',
      includeIfNull: true,
      fromJson: Additives.additivesFromJson,
      toJson: Additives.additivesToJson)
  Additives additives;

  @JsonKey(
      name: 'environment_impact_level_tags',
      includeIfNull: false,
      fromJson: EnvironmentImpactLevels.fromJson,
      toJson: EnvironmentImpactLevels.toJson)
  EnvironmentImpactLevels environmentImpactLevels;

  @JsonKey(
      name: 'allergens_tags',
      includeIfNull: true,
      fromJson: Allergens.allergensFromJson,
      toJson: Allergens.allergensToJson)
  Allergens allergens;

  @JsonKey(
      name: 'nutrient_levels',
      includeIfNull: false,
      fromJson: NutrientLevels.fromJson,
      toJson: NutrientLevels.toJson)
  NutrientLevels nutrientLevels;

  @JsonKey(name: 'ingredients_text', includeIfNull: false)
  String ingredientsText;
  @JsonKey(name: 'ingredients_text_de', includeIfNull: false)
  String ingredientsTextDE;
  @JsonKey(name: 'ingredients_text_en', includeIfNull: false)
  String ingredientsTextEN;
  @JsonKey(name: 'ingredients_text_fr', includeIfNull: false)
  String ingredientsTextFR;

  @JsonKey(
      name: 'ingredients_analysis_tags',
      includeIfNull: false,
      fromJson: IngredientsAnalysisTags.fromJson,
      toJson: IngredientsAnalysisTags.toJson)
  IngredientsAnalysisTags ingredientsAnalysisTags;

  @JsonKey(name: 'nutriment_energy_unit', includeIfNull: false)
  String nutrimentEnergyUnit;
  @JsonKey(name: 'nutrition_data_per', includeIfNull: false)
  String nutrimentDataPer;
  @JsonKey(name: 'nutrition_grade_fr', includeIfNull: false)
  String nutriscore;

  @JsonKey(includeIfNull: false)
  String categories;

  @JsonKey(name: 'categories_tags', includeIfNull: false)
  List<String> categoriesTags;
  @JsonKey(name: 'categories_tags_translated', includeIfNull: false)
  List<String> categoriesTagsTranslated;
  @JsonKey(name: 'labels_tags', includeIfNull: false)
  List<String> labelsTags;
  @JsonKey(name: 'labels_tags_translated', includeIfNull: false)
  List<String> labelsTagsTranslated;
  @JsonKey(name: 'misc', includeIfNull: false)
  List<String> miscTags;
  @JsonKey(name: 'states_tags', includeIfNull: false)
  List<String> statesTags;
  @JsonKey(name: 'traces_tags', includeIfNull: false)
  List<String> tracesTags;
  @JsonKey(name: 'stores_tags', includeIfNull: false)
  List<String> storesTags;

  Product(
      {this.barcode,
      this.productName,
      this.productNameDE,
      this.productNameEN,
      this.brands,
      this.lang,
      this.quantity,
      this.imgSmallUrl,
      this.ingredientsText,
      this.ingredientsTextDE,
      this.ingredientsTextEN,
      this.categories,
      this.nutrimentEnergyUnit,
      this.nutrimentDataPer,
      this.nutriscore,
      this.nutriments,
      this.additives,
      this.nutrientLevels,
      this.servingSize,
      this.servingQuantity});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
