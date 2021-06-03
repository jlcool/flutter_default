import 'dart:io';

import 'package:fish_redux/fish_redux.dart' hide performanceMiddleware;
import 'package:flutter/material.dart' hide Action, Page;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

import 'global_store/state.dart';
import 'global_store/store.dart';
import 'middleware/performance.dart';
import 'util/chinese_cupertino_localizations.dart';
import 'util/config_util.dart';
import 'util/dialog_util.dart';

/// 创建应用的根 Widget
/// 1. 创建一个简单的路由，并注册页面
/// 2. 对所需的页面进行和 AppStore 的连接
/// 3. 对所需的页面进行 AOP 的增强
Widget createApp({homepage}) {
  JPush _jpush = new JPush();

  _jpush.setup(
    appKey: ConfigUtil.JPUSH_APPKEY,
    production: true,
    channel: Platform.isAndroid ? "" : "AppStore",
    debug: isDebug(), // 设置是否打印 debug 日志
  );

  List<Locale> an = [
    const Locale('zh', 'CH'),
  ];
  return MaterialApp(
    title: '标题',
    debugShowCheckedModeBanner: false,
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      ChineseCupertinoLocalizations.delegate,
    ],
    supportedLocales: an,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: RouteConfig.routes.buildPage(homepage ?? RouteConfig.login, null),
    onGenerateRoute: (RouteSettings settings) {
      //可以在这里添加页面跳转动画
      // if(settings.name=="notify_add")
      // {
      //   return PageRouteBuilder<Object>(pageBuilder: (BuildContext context, _, __) {
      //       return RouteConfig.routes.buildPage(settings.name, settings.arguments);
      //     }, transitionsBuilder:
      //         (___, Animation<double> animation, ____, Widget child) {
      //       return FadeFromRightTransition(routeAnimation: animation,child: child,);
      //     });
      // }
      // if (settings.name == RouteConfig.notifyAdd) {
      //   return MaterialPageRoute<NotifyListComponentState>(
      //       builder: (BuildContext context) {
      //     return RouteConfig.routes
      //         .buildPage(settings.name, settings.arguments);
      //   });
      // }
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return RouteConfig.routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}

/// 简单的 Effect AOP
/// 只针对页面的生命周期进行打印
EffectMiddleware<T> _pageAnalyticsMiddleware<T>({String tag = 'redux'}) {
  return (AbstractLogic<dynamic> logic, Store<T> store) {
    return (Effect<dynamic> effect) {
      return (Action action, Context<dynamic> ctx) {
        if (logic is Page<dynamic, dynamic> && action.type is Lifecycle) {
          print('${logic.runtimeType} ${action.type.toString()} ');
        }
        if (logic is Page<dynamic, dynamic> &&
            action.type.toString() == "Lifecycle.build") {
          ScreenUtil.init(ctx.context);
          DialogUtil.init(ctx.context);
        }
        return effect.call(action, ctx);
      };
    };
  };
}

///路由管理
class RouteConfig {
  ///定义你的路由名称比如   static final String routeHome = 'page/home';
  ///导航页面
  static const String login = 'login';

  static final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      ///将你的路由名称和页面映射在一起，比如：RouteConfig.homePage : HomePage(),
    },
    visitor: StoreConfig.visitor,
  );
}

///全局模式
class StoreConfig {
  ///全局状态管理
  static _updateState() {
    return (dynamic pageState, GlobalState appState) {
      final GlobalBaseState p = pageState;

      if (pageState is Cloneable) {
        final dynamic copy = pageState.clone();
        final GlobalBaseState newState = copy;

        if (p.store == null) {
          ///这地方的判断是必须的，判断第一次store对象是否为空
          newState.store = appState.store;
        } else {
          /// 这地方增加字段判断，是否需要更新
          if ((p.store.themeColor != appState.store.themeColor)) {
            newState.store.themeColor = appState.store.themeColor;
          }

          /// 如果增加字段，同理上面的判断然后赋值...

        }

        /// 返回新的 state 并将数据设置到 ui
        return newState;
      }
      return pageState;
    };
  }

  static visitor(String path, Page<Object, dynamic> page) {
    if (page.isTypeof<GlobalBaseState>()) {
      ///建立AppStore驱动PageStore的单向数据连接
      ///参数1 AppStore  参数2 当AppStore.state变化时,PageStore.state该如何变化
      page.connectExtraStore<GlobalState>(GlobalStore.store, _updateState());
    }

    /// AOP
    /// 页面可以有一些私有的 AOP 的增强， 但往往会有一些 AOP 是整个应用下，所有页面都会有的。
    /// 这些公共的通用 AOP ，通过遍历路由页面的形式统一加入。
    page.enhancer.append(
      /// View AOP
      viewMiddleware: <ViewMiddleware<dynamic>>[
        safetyView<dynamic>(),
      ],

      /// Adapter AOP
      adapterMiddleware: <AdapterMiddleware<dynamic>>[safetyAdapter<dynamic>()],

      /// Effect AOP
      effectMiddleware: <EffectMiddleware<dynamic>>[
        _pageAnalyticsMiddleware<dynamic>(),
      ],

      /// Store AOP
      middleware: <Middleware<dynamic>>[
        logMiddleware<dynamic>(tag: page.runtimeType.toString()),
        performanceMiddleware<dynamic>(tag: page.runtimeType.toString()),
      ],
    );
  }
}
