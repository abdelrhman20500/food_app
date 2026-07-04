

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService{
  static Future<void> init()async{
    Supabase.initialize(
        url: "https://gbxnadybmaqwapbsxdwq.supabase.co",
        publishableKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdieG5hZHlibWFxd2FwYnN4ZHdxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODMxNTU1MjAsImV4cCI6MjA5ODczMTUyMH0.Qrzzagg8IxO46rqe0X_Ka8YBUTeMJRnnSvjeGlM1gkE"
    );
  }
}