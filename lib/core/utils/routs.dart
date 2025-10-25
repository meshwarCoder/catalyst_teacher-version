import 'package:catalyst/core/utils/service_locator.dart';
import 'package:catalyst/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:catalyst/features/auth/presentation/cubit/login%20cubit/login_cubit.dart';
import 'package:catalyst/features/auth/presentation/cubit/register%20cubit/register_cubit.dart';
import 'package:catalyst/features/auth/presentation/views/forget%20password/forget_password.dart';
import 'package:catalyst/features/auth/presentation/views/forget%20password/reset_password.dart';
import 'package:catalyst/features/auth/presentation/views/forget%20password/verification_code.dart';
import 'package:catalyst/features/auth/presentation/views/login_view.dart';
import 'package:catalyst/features/auth/presentation/views/register_view.dart';
import 'package:catalyst/features/auto%20grade/presentation/views/auto_grade_view.dart';
import 'package:catalyst/features/home/presentation/views/home_view.dart';
import 'package:catalyst/features/my%20classes/presentation/views/students_in_class.dart';
import 'package:catalyst/features/roots.dart';
import 'package:catalyst/features/schedule/presentation/views/schedule_view.dart';
import 'package:catalyst/features/splash/splash_view.dart';
import 'package:catalyst/features/student%20requests/presentation/views/student_profile.dart';
import 'package:catalyst/features/student%20requests/presentation/views/student_requests.dart';
import 'package:catalyst/features/students/presentation/students/create_exam_Page.dart';
import 'package:catalyst/features/my classes/presentation/views/my_classes_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Routs {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgetPassword = '/forgetPassword';
  static const String verificationCode = '/verificationCode';
  static const String resetPassword = '/resetPassword';
  static const String root = '/root';
  static const String home = '/home';
  static const String schedule = '/schedule';
  static const String students = '/students';
  static const String autoGrade = '/autoGrade';
  static const String studentRequests = '/studentRequests';
  static const String studentProfile = '/studentProfile';
  static const String myClasses = '/myClasses';
  static const String studentsInClass = '/studentsInClass';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              LoginCubitCubit(getIt.get<AuthRepoImplementation>()),
          child: LoginView(),
        ),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              RegisterCubit(getIt.get<AuthRepoImplementation>()),
          child: RegisterView(),
        ),
      ),
      GoRoute(
        path: verificationCode,
        builder: (context, state) => VerificationCode(),
      ),
      GoRoute(
        path: forgetPassword,
        builder: (context, state) => ForgetPassword(),
      ),
      GoRoute(
        path: resetPassword,
        builder: (context, state) => ResetPassword(),
      ),
      GoRoute(path: root, builder: (context, state) => const Root()),
      GoRoute(path: home, builder: (context, state) => const HomeView()),
      GoRoute(path: schedule, builder: (context, state) => const ScheduleView()),
      GoRoute(path: students, builder: (context, state) => const CreateExamPage()),
      GoRoute(
        path: autoGrade,
        builder: (context, state) => const AutoGradeView(),
      ),
      GoRoute(
        path: studentRequests,
        builder: (context, state) => const StudentRequestsView(),
      ),
      GoRoute(
        path: studentProfile,
        builder: (context, state) => StudentProfile(from: state.extra as String),
      ),
      GoRoute(
        path: myClasses,
        builder: (context, state) => const MyClassesView(),
      ),
      GoRoute(
        path: studentsInClass,
        builder: (context, state) => const ClassStudentsView(),
      ),
    ],
  );
}
