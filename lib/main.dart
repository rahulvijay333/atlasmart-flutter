import 'package:atlasmart/application/admin/add_category/add_category_bloc.dart';
import 'package:atlasmart/application/admin/admin_product_list/admin_product_list_bloc.dart';
import 'package:atlasmart/application/admin/add_admin/add_admins_bloc.dart';
import 'package:atlasmart/application/admin/category_list/category_list_bloc.dart';
import 'package:atlasmart/application/admin/inventory/inventory_bloc.dart';
import 'package:atlasmart/application/admin/users/all_users_bloc.dart';
import 'package:atlasmart/application/forgot_password/forgot_password_bloc.dart';
import 'package:atlasmart/application/login/login_bloc.dart';
import 'package:atlasmart/application/profile_admin_customer/admin/bloc/admin_profile_bloc.dart';
import 'package:atlasmart/application/profile_admin_customer/customer/customer_profile_bloc.dart';
import 'package:atlasmart/domain/core/constants/colors.dart';
import 'package:atlasmart/domain/endpoints/api_endpoints.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'application/admin/admin_add_or_update_product/admin_addor_update_product_bloc.dart';
import 'application/admin/admin_list/admin_list_bloc.dart';
import 'application/auth/auth_bloc.dart';
import 'application/registration/customer/custom_registr_bloc/customer_register_bloc.dart';
import 'domain/core/config/app_config.dart';
import 'domain/core/di/di.dart';
import 'domain/core/key/stripe_key.dart';
import 'presentation/splash/screen_splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // if (kReleaseMode && !kIsWeb) {
  //   await Firebase.initializeApp();
  //   FlutterError.onError = (errorDetails) {
  //     FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  //   };
  //   // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  //   PlatformDispatcher.instance.onError = (error, stack) {
  //     FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //     return true;
  //   };
  // }

  AppConfig.initialize(
    AppConfig(
      flavor: kReleaseMode ? Flavor.prod : Flavor.dev,
      baseUrl: kReleaseMode
          ? ApiEndpoints.baseUrlProduction
          : kIsWeb
          ? "http://localhost:3000"
          : ApiEndpoints.baseUrl,
    ),
  );
  setupDI();

  // if (!kIsWeb) {
  Stripe.publishableKey = strPubKey;
  // ✅ Only apply native settings on mobile
  if (!kIsWeb) {
    await Stripe.instance.applySettings();
  }
  // }

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<AuthBloc>()),

        BlocProvider(create: (context) => sl<LoginBloc>()),

        BlocProvider(create: (context) => sl<CustomerRegisterBloc>()),
        BlocProvider(create: (context) => sl<CustomerRegisterBloc>()),

        BlocProvider(create: (context) => sl<ForgotPasswordBloc>()),

        BlocProvider(create: (context) => sl<CustomerProfileBloc>()),

        BlocProvider(create: (context) => sl<AdminProfileBloc>()),
        BlocProvider(create: (context) => sl<AllUsersBloc>()),
        BlocProvider(create: (context) => sl<AddAdminBloc>()),
        BlocProvider(create: (context) => sl<AdminProductListBloc>()),
        BlocProvider(create: (context) => sl<AdminAddorUpdateProductBloc>()),
        BlocProvider(create: (context) => sl<AdminListBloc>()),
        BlocProvider(create: (context) => sl<AddCategoryBloc>()),
        BlocProvider(create: (context) => sl<CategoryListBloc>()),
        BlocProvider(create: (context) => sl<InventoryBloc>()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AtlasMart',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFFFA000), // Amber/Orange Brand Color
            primary: const Color(0xFFFFA000),
            secondary: const Color(0xFF2E7D32), // Green as secondary/success
          ),
          iconTheme: IconThemeData(color: AppColors.amberColor),
          scaffoldBackgroundColor: Colors.grey[50],
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.black87),
            titleTextStyle: TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFFFA000), width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            hintStyle: TextStyle(color: Colors.grey.shade500),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFA000),
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
        home: ScreenSplash(),
      ),
    );
  }
}
