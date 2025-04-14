import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@module
abstract class DIModule {
  @lazySingleton
  SupabaseClient get supabaseClient => Supabase.instance.client;
}
