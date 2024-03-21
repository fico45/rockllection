import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'api.g.dart';

@Riverpod(keepAlive: true)
Api api(ApiRef ref) => Api(ref: ref);

class Api {
  Api({required this.ref});
  final Ref ref;
  SupabaseClient get instance => Supabase.instance.client;
}
