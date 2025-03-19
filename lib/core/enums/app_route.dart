enum AppRoutes {
  welcome,
  main,
  auth,
  device,
  profile,
  notification,
  parking,
  lamp,
  trash,
}

extension AppRoutesExtension on AppRoutes {
  String get path {
    switch (this) {
      case AppRoutes.trash:
        return '/trash';
      case AppRoutes.lamp:
        return '/lamp';
      case AppRoutes.parking:
        return '/parking';
      case AppRoutes.welcome:
        return '/welcome';
      case AppRoutes.main:
        return '/main';
      case AppRoutes.auth:
        return '/auth';
      case AppRoutes.device:
        return '/device';
      case AppRoutes.profile:
        return '/profile';
      case AppRoutes.notification:
        return '/notification';
      // case AppRoutes.recoveryCode:
      //   return '/recovery_code';
      // case AppRoutes.recoveryMail:
      //   return '/recovery_mail';
      // case AppRoutes.changePassword:
      //   return '/change_password';
      // case AppRoutes.splash:
      //   return '/splash';
      // case AppRoutes.auth:
      //   return '/auth';
      // case AppRoutes.fieldTest:
      //   return '/field_test';
      // case AppRoutes.culture:
      //   return '/culture';
      // case AppRoutes.tableByCulture:
      //   return 'table_by_culture:id';
      // case AppRoutes.seeds:
      //   return '/seeds';
      // case AppRoutes.settings:
      //   return '/settings';
      // case AppRoutes.varieties:
      //   return '/varieties_screen';
      // default:
      //   return '/auth';
    }
  }

  String fullPath([String? id]) {
    switch (this) {
      case AppRoutes.trash:
        return '${AppRoutes.trash.path}/$id';
      case AppRoutes.lamp:
        return '${AppRoutes.lamp.path}/$id';
      case AppRoutes.parking:
        return '${AppRoutes.parking.path}/$id';
      case AppRoutes.welcome:
        return AppRoutes.welcome.path;
      case AppRoutes.main:
        return AppRoutes.main.path;
      case AppRoutes.auth:
        return AppRoutes.auth.path;
      case AppRoutes.device:
        return AppRoutes.device.path;
      case AppRoutes.profile:
        return AppRoutes.profile.path;
      case AppRoutes.notification:
        return AppRoutes.notification.path;
      // case AppRoutes.recoveryCode:
      // case AppRoutes.splash:
      // case AppRoutes.auth:
      // case AppRoutes.culture:
      //   if (id == null || id.isEmpty) {
      //     return AppRoutes.culture.path;
      //   }
      //   return '/culture/$id';
      // case AppRoutes.settings:
      //   return AppRoutes.settings.path;
      // case AppRoutes.fieldTest:
      //   if (id == null || id.isEmpty) {
      //     return AppRoutes.fieldTest.path;
      //   }
      //   return '/field_test/$id';
      // case AppRoutes.varieties:
      //   if (id == null || id.isEmpty) {
      //     return AppRoutes.varieties.path;
      //   }
      //   return '/varieties_screen/$id';
      // case AppRoutes.seeds:
      //   if (id == null || id.isEmpty) {
      //     return AppRoutes.seeds.path;
      //   }
      //   return '/seeds/$id';
      // case AppRoutes.tableByCulture:
      //   if (id == null || id.isEmpty) {
      //     return AppRoutes.culture.path;
      //   }
      //   return '/culture/table/$id';
      // default:
      //   return path;
    }
  }

  String getRouteNameFromPath() {
    switch (this) {
      case AppRoutes.trash:
        return 'trash';
      case AppRoutes.lamp:
        return 'lamp';
      case AppRoutes.parking:
        return 'parking';
      case AppRoutes.welcome:
        return 'welcome';
      case AppRoutes.main:
        return 'main';
      case AppRoutes.auth:
        return 'auth';
      case AppRoutes.device:
        return 'device';
      case AppRoutes.profile:
        return 'profile';
      case AppRoutes.notification:
        return 'notification';
      // case AppRoutes.recoveryCode:
      // case AppRoutes.culture:
      //   return 'culture';
      // case AppRoutes.varieties:
      //   return 'varieties';
      // case AppRoutes.fieldTest:
      //   return 'field-test';
      // case AppRoutes.seeds:
      //   return 'seeds';
      // case AppRoutes.settings:
      //   return 'settings';
      // case AppRoutes.tableByCulture:
      //   return 'table';
      // case AppRoutes.splash:
      //   return 'splash';
      // case AppRoutes.auth:
      //   return 'auth';
      // default:
      //   return '';
    }
  }

  // Новый метод для получения человекочитаемого названия
  // String getReadableName() {
  //   switch (this) {
  //     // case AppRoutes.culture:
  //     //   return 'Культуры';
  //     // case AppRoutes.varieties:
  //     //   return 'Сорта';
  //     // case AppRoutes.fieldTest:
  //     //   return 'Полевые исследования';
  //     // case AppRoutes.seeds:
  //     //   return 'Семена';
  //     // case AppRoutes.settings:
  //     //   return 'Настройки';
  //     // case AppRoutes.tableByCulture:
  //     //   return 'Таблица';
  //     // case AppRoutes.splash:
  //     //   return 'Загрузка';
  //     // case AppRoutes.auth:
  //     //   return 'Авторизация';
  //     // default:
  //     //   return '';
  //   }
  // }

  // Метод для получения иконки (если потребуется)
  // String getIconPath() {
  //   switch (this) {
  //     // case AppRoutes.culture:
  //     //   return carbonSproutIcon;
  //     // case AppRoutes.varieties:
  //     //   return fluentPlantIcon;
  //     // case AppRoutes.fieldTest:
  //     //   return atomicIcon;
  //     // case AppRoutes.seeds:
  //     //   return holdSeedsIcon;
  //     // case AppRoutes.settings:
  //     //   return settingsIcon; // Предполагаю, что у вас есть такая константа
  //     // default:
  //     //   return ''; // Путь к дефолтной иконке
  //   }
  // }

  // Метод для определения индекса в навигации
  // int getNavigationIndex() {
  //   switch (this) {
  //     // case AppRoutes.culture:
  //     //   return 0;
  //     // case AppRoutes.varieties:
  //     //   return 1;
  //     // case AppRoutes.fieldTest:
  //     //   return 2;
  //     // case AppRoutes.seeds:
  //     //   return 3;
  //     // case AppRoutes.settings:
  //     //   return 4;
  //     // default:
  //     //   return 0;
  //   }
  // }
}
