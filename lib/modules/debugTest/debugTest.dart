import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:rockllection/modules/widgets/buttons/button.dart';
import 'package:rockllection/modules/widgets/scroll_wrappers/scroll_wrapper.dart';
import 'package:rockllection/provider/auth/auth_provider.dart';
import 'package:rockllection/provider/auth/token_provider.dart';
import 'package:rockllection/utils/consts.dart';
import 'package:rockllection/utils/toast.dart';
import 'package:rockllection/utils/extensions.dart';

class DebugTest extends ConsumerWidget {
  const DebugTest({super.key});
  static String get routeName => 'debugTest';
  static String get routeLocation => '/debugTest';
  static String get title => 'debugTest.title'.tr();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authPr = ref.read(authProvider.notifier);

    return authPr.user.maybeWhen(
      orElse: () => const Center(
        child: Text('Error'),
      ),
      signedOut: () {
        return const Center(
          child: Text('Signed out'),
        );
      },
      signedIn: (id, displayName, email, token, picture, emailVerified) {
        return ScrollWrapper(
          child: Padding(
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
                          children: [
                            SizedBox(
                              width: MyFacts.size.sizeXXL,
                              child: Text(
                                'ID',
                                style: context.textTheme.bodyLarge!.copyWith(
                                  color: context.colorScheme.onBackground,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MyFacts.size.sizeM,
                            ),
                            Expanded(
                              child: Text(
                                id,
                                style: context.textTheme.bodyLarge!.copyWith(
                                  color: context.colorScheme.onBackground,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: MyFacts.size.sizeXXL,
                              child: Text(
                                'Name',
                                style: context.textTheme.bodyLarge!.copyWith(
                                  color: context.colorScheme.onBackground,
                                ),
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
                          children: [
                            SizedBox(
                              width: MyFacts.size.sizeXXL,
                              child: Text(
                                'E-mail',
                                style: context.textTheme.bodyLarge!.copyWith(
                                  color: context.colorScheme.onBackground,
                                ),
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
                          children: [
                            SizedBox(
                              width: MyFacts.size.sizeXXL,
                              child: Text(
                                'Token',
                                style: context.textTheme.bodyLarge!.copyWith(
                                  color: context.colorScheme.onBackground,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MyFacts.size.sizeM,
                            ),
                            Expanded(
                              child: Text(
                                JwtDecoder.decode(token).toString(),
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
                      final token = await ref.read(tokenProvider).fetchToken();
                      ref.read(toastProvider).showToastMessage(
                          message: token?.idToken ?? 'No token');
                    },
                    child: "Show token in toast",
                  ),
                  SizedBox(
                    height: MyFacts.size.sizeL,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
