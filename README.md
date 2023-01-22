# studtime

/// генерация роутов
/// генерация ресурсов
fvm flutter packages pub run build_runner build --delete-conflicting-outputs

/// генерация ключей локализации
fvm flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart --source-dir ./assets/translations

/// генерация иконок 
fvm flutter pub run flutter_launcher_icons:main

/// генерация сплеша
fvm flutter pub run flutter_native_splash:create