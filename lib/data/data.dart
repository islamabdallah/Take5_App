import 'models/responses/trip_start_response/trip_start_response.dart';

List<DangerControlsWithCategoryModel> dangerControlsWithCategoryModels = [
  const DangerControlsWithCategoryModel(
      dangerCategory: 'الموقع',
      dangerCategoryId: 1,
      dangerModels: [
        DangerModel( dangerId: 1, dangerName: 'الاماكن الضيقة',controls: []),
        DangerModel(dangerId: 2, dangerName: 'استخدام الالات الحادة',controls: []),
      ]),
  const DangerControlsWithCategoryModel(
      dangerCategory: 'الصحة',
      dangerCategoryId: 2,
      dangerModels: [
        DangerModel(dangerId: 3, dangerName: 'تناول احمال لاسفل', controls: [
          MeasureControlApi(MeasureControlId: 5, MeasureControlName: 'استخدام مهمات الوقاية الشخصية'),
          MeasureControlApi(MeasureControlId: 6, MeasureControlName: 'التعامل مع الخطر'),
        ]),
      ]),
  const DangerControlsWithCategoryModel(
      dangerCategory: 'اصطدام وانحشار',
      dangerCategoryId: 3,
      dangerModels: [
        DangerModel(dangerId: 4, dangerName: 'حمل معلق', controls: [
          MeasureControlApi(MeasureControlId: 7, MeasureControlName: 'التواصل مع المشرف'),
          MeasureControlApi(MeasureControlId: 8, MeasureControlName: 'عزل الخطر'),
          MeasureControlApi(MeasureControlId: 9, MeasureControlName: 'التواصل مع صاحب الموقع'),
          MeasureControlApi(MeasureControlId: 10, MeasureControlName: 'تجنب الخطر'),
        ]),
        DangerModel(dangerId: 5, dangerName: 'حائط منخفض', controls: []),
        DangerModel(dangerId: 6, dangerName: 'اصطدام', controls: []),
      ]),
];
