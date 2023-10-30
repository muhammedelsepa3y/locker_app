import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:locker_app/core/utils/typography.dart';
import 'package:locker_app/locker/data/datasource/base_locker_remote_datasource.dart';
import 'package:locker_app/locker/domain/usecases/get_lockers_list.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'firebase_options.dart';
import 'core/utils/color_schemes.g.dart';
import 'core/utils/custom_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'locker/data/repository/locker_repository.dart';
import 'locker/domain/usecases/add_locker.dart';
import 'locker/presentation/providers/locker_provider.dart';

// ...
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  final BaseLockerRemoteDataSource lockerRemoteDataSource =
      LockerRemoteDataSource();
  final baseLockerRepository =
      LockerRepository(lockerRemoteDataSource: LockerRemoteDataSource());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LockerProvider(
              getLockersListUseCase:
                  GetLockersListUseCase(baseLockerRepository),
              addLockerUseCase: AddLockerUseCase(baseLockerRepository)),
        ),
      ],
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: lightColorScheme,
            textTheme: textTheme,
            useMaterial3: true,
          ),
          title: 'Locker App',
          routerConfig: appRouter.router,
        );
      }),
    );
  }
}
