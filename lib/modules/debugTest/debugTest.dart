import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/modules/widgets/buttons/button.dart';
import 'package:flutter_template/provider/auth/auth_provider.dart';
import 'package:flutter_template/provider/auth/token_provider.dart';
import 'package:flutter_template/utils/consts.dart';
import 'package:flutter_template/utils/toast.dart';
import 'package:flutter_template/utils/extensions.dart';

class DebugTest extends ConsumerWidget {
  const DebugTest({super.key});
  static String get routeName => 'debugTest';
  static String get routeLocation => '/debugTest';
  static String get title => 'debugTest.title'.tr();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authPr = ref.read(authProvider.notifier);

    return authPr.user.maybeWhen(
      orElse: () => const SizedBox(),
      signedOut: () {
        return const SizedBox();
      },
      signedIn: (id, displayName, email, token) {
        return Padding(
          padding: EdgeInsets.all(MyFacts.size.sizeXS),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'ID',
                            style: context.textTheme.bodyLarge!.copyWith(
                              color: context.colorScheme.onBackground,
                            ),
                          ),
                          SizedBox(
                            width: MyFacts.size.sizeM,
                          ),
                          Text(
                            id,
                            style: context.textTheme.bodyLarge!.copyWith(
                              color: context.colorScheme.onBackground,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Name',
                            style: context.textTheme.bodyLarge!.copyWith(
                              color: context.colorScheme.onBackground,
                            ),
                          ),
                          SizedBox(
                            width: MyFacts.size.sizeM,
                          ),
                          Text(
                            displayName,
                            style: context.textTheme.bodyLarge!.copyWith(
                              color: context.colorScheme.onBackground,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'E-mail',
                            style: context.textTheme.bodyLarge!.copyWith(
                              color: context.colorScheme.onBackground,
                            ),
                          ),
                          SizedBox(
                            width: MyFacts.size.sizeM,
                          ),
                          Text(
                            email,
                            style: context.textTheme.bodyLarge!.copyWith(
                              color: context.colorScheme.onBackground,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Token',
                            style: context.textTheme.bodyLarge!.copyWith(
                              color: context.colorScheme.onBackground,
                            ),
                          ),
                          SizedBox(
                            width: MyFacts.size.sizeM,
                          ),
                          Expanded(
                            child: Text(
                              token,
                              style: context.textTheme.bodyLarge!.copyWith(
                                color: context.colorScheme.onBackground,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Button(
                  onPressed: () async {
                    authPr.signOut();
                  },
                  child: "Logout",
                ),
                Button(
                  onPressed: () async {
                    authPr.signIn(
                      email: "fake",
                      password: "totally-wrong",
                    );
                  },
                  child: "Do 401",
                ),
                Button(
                  onPressed: () async {
                    final token =
                        await ref.read(tokenProviderProvider).fetchToken();
                    ref.read(toastProvider).showToastMessage(message: token!);
                  },
                  child: "Show token in toast",
                ),
                SizedBox(
                  height: MyFacts.size.sizeL,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
