import '../constants/assets_path.dart';

class ModelGeneral {
  String title;
  String? name;
  String imageUrl;
  double percent;

  ModelGeneral({required this.imageUrl, required this.title, this.name,this.percent = 53});
}

final List<ModelGeneral> activityComplete = [
  ModelGeneral(
    imageUrl: AssetPath.imgContent2,
    title: 'Jessica Apnovka ',
    name: 'Teaches Bussines',
    percent: 100,
  ),
  ModelGeneral(
    imageUrl: AssetPath.imgContent4,
    title: 'Bianca Lisa',
    name: 'Teaches Music',
    percent: 100,
  ),
    ModelGeneral(
    imageUrl: AssetPath.imgContent3,
    title: 'Nadine Anabelle',
    name: 'Teaches Sing',
    percent: 100,
  ),
];

final List<ModelGeneral> activityIncomplete = [
  ModelGeneral(
    imageUrl: AssetPath.imgContent,
    title: 'Aquila Hernandez',
    name: 'Teaches Piano',
    percent: 53,
  ),
  ModelGeneral(
    imageUrl: AssetPath.imgContent,
    title: 'James Haritz',
    name: 'Teaches Guitar',
    percent: 53,
  ),
];

final List<ModelGeneral> preview = [
  ModelGeneral(
    imageUrl: AssetPath.imgPreview,
    title: 'Entertainment',
  ),
  ModelGeneral(
    imageUrl: AssetPath.imgPreview2,
    title: 'Healthy Food',
  ),
  ModelGeneral(
    imageUrl: AssetPath.imgPreview,
    title: 'Entertainment',
  ),
  ModelGeneral(
    imageUrl: AssetPath.imgPreview2,
    title: 'Healthy Food',
  ),
];

final List<ModelGeneral> mentor = [
  ModelGeneral(
    imageUrl: AssetPath.imgMentor,
    title: 'Teaching Fashion',
    name: 'Bianca Lovata',
  ),
  ModelGeneral(
    imageUrl: AssetPath.imgMentor2,
    title: 'Teach Photograph',
    name: 'Beatrix Anna',
  ),
  ModelGeneral(
    imageUrl: AssetPath.imgMentor,
    title: 'Teaching Fashion',
    name: 'Bianca Lovata',
  ),
  ModelGeneral(
    imageUrl: AssetPath.imgMentor2,
    title: 'Teach Photograph',
    name: 'Beatrix Anna',
  ),
];
