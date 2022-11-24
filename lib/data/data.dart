import 'models/responses/trip_start_response/trip_start_response.dart';

List<DangerWithCategoryAPIModels> dangerControlsWithCategoryModels = [
  const DangerWithCategoryAPIModels(
      dangerCategory: 'الموقع',
      dangerCategoryId: 1,
      dangerModels: [
        DangerModel( dangerId: 1, dangerName: 'الاماكن الضيقة',measureControlAPIs: []),
        DangerModel(dangerId: 2, dangerName: 'استخدام الالات الحادة',measureControlAPIs: []),
      ]),
  const DangerWithCategoryAPIModels(
      dangerCategory: 'الصحة',
      dangerCategoryId: 2,
      dangerModels: [
        DangerModel(dangerId: 3, dangerName: 'تناول احمال لاسفل', measureControlAPIs: [
          MeasureControlApi(measureControlId: 5, measureControlName: 'استخدام مهمات الوقاية الشخصية'),
          MeasureControlApi(measureControlId: 6, measureControlName: 'التعامل مع الخطر'),
        ]),
      ]),
  const DangerWithCategoryAPIModels(
      dangerCategory: 'اصطدام وانحشار',
      dangerCategoryId: 3,
      dangerModels: [
        DangerModel(dangerId: 4, dangerName: 'حمل معلق', measureControlAPIs: [
          MeasureControlApi(measureControlId: 7, measureControlName: 'التواصل مع المشرف'),
          MeasureControlApi(measureControlId: 8, measureControlName: 'عزل الخطر'),
          MeasureControlApi(measureControlId: 9, measureControlName: 'التواصل مع صاحب الموقع'),
          MeasureControlApi(measureControlId: 10, measureControlName: 'تجنب الخطر'),
        ]),
        DangerModel(dangerId: 5, dangerName: 'حائط منخفض', measureControlAPIs: []),
        DangerModel(dangerId: 6, dangerName: 'اصطدام', measureControlAPIs: []),
      ]),
];
