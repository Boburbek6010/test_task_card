import 'package:camera/camera.dart';
import 'package:get_it/get_it.dart';

import 'core/manager/storage_manager.dart';
import 'data/datasources/card_camera_datasource.dart';
import 'data/datasources/card_nfc_datasource.dart';
import 'data/repositories/card_repository.dart';
import 'data/repositories/card_repository_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {

  // Repository
  sl.registerLazySingleton<CardRepository>(
    () => CardRepositoryImpl(
      cameraDataSource: sl(),
      nfcDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<CardCameraDataSource>(
    () => CardCameraDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<CardNfcDataSource>(
    () => CardNfcDataSourceImpl(),
  );


  // Storage
  sl.registerLazySingleton<StorageManager>(
        () => StorageManager(),
  );

  // External
  // final cameras = await availableCameras();
  // if (cameras.isEmpty) throw Exception('No cameras available');
  //
  // final cameraController = CameraController(
  //   cameras[0],
  //   ResolutionPreset.ultraHigh,
  //   enableAudio: false,
  // );
  // await cameraController.initialize();
  //
  // sl.registerLazySingleton(() => cameraController);
}
