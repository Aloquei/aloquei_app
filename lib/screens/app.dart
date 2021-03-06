import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../blocs/auth/auth_bloc.dart';
import 'core/snack_bar.dart';
import 'detail_offers/detail_offer.dart';
import 'explore/explore.dart';
import 'help/help_page.dart';
import 'home/home.dart';
import 'hosting/host_select_menu_type.dart';
import 'inbox/inbox.dart';
import 'interest-detail/interest_detail.dart';
import 'interest/interest_page_data.dart';
import 'interest/interest_page_pet.dart';
import 'login/login_page.dart';
import 'personal_info/personal_info.dart';
import 'profile/profile.dart';
import 'search/search.dart';
import 'signup/signup.dart';
import 'splash/splash.dart';
import 'terms/terms_page.dart';
import 'wishlists/wishlists.dart';

class Run extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(AppStartedEvent()),
      child: AppPage(),
    );
  }
}

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  AuthBloc authBloc;

  @override
  void dispose() {
    authBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    authBloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(425, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
        background: Container(color: Color(0xFFF5F5F5)),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Aloquei',
      theme: ThemeData(
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (contextListener, state) {
            if (state is AuthenticatedState) {
              if (state.user != null) {
                buildSuccesSnackBar(
                    contextListener, "Login realizado com sucesso");
              }
            } else if (state is ExceptionState) {
              buildWarningSnackBar(contextListener, state.message);
            }
          },
          buildWhen: (previous, current) {
            if (current is ExceptionState) {
              return false;
            }
            return true;
          },
          builder: (context, state) {
            if (state is AuthenticatedState) {
              return Home(user: state.userModel);
            } else if (state is SignupPressedState) {
              return Signup();
            } else if (state is UnauthenticatedState) {
              return LoginPage();
            } else {
              return Splash();
            }
          },
        ),
      ),
      routes: {
        '/explore': (context) => ExplorePage(),
        '/wishlists': (context) => WishlistPage(),
        '/inbox': (context) => InboxPage(),
        '/profile': (context) => ProfilePage(),
        '/search': (context) => Search(),
        '/help': (context) => HelpPage(),
        '/interestPage': (context) =>
            InterestPageAddress(userModel: authBloc.getUserModel),
        '/interestPet': (context) => InterestPagePet(),
        '/hostPage': (context) =>
            HostPageType(userModel: authBloc.getUserModel),
        '/personalData': (context) => PersonalInfo(
              user: authBloc.getUser,
              userModel: authBloc.getUserModel,
            ),
        '/termsData': (context) => TermsofServicePage(),
        '/helpPage': (context) => HelpPage(),
        '/offerDetail': (context) =>
            OfferDetail(userModel: authBloc.getUserModel),
        '/interestDetail': (context) =>
            InterestDetail(user: authBloc.getUserModel),
      },
      initialRoute: '/',
    );
  }
}
