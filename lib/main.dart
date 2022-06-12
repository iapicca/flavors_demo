import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      home: Scaffold(
        body: FutureBuilder<PackageInfo>(
          future: PackageInfo.fromPlatform(),
          builder: (context, info) => !info.hasData || info.hasError
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(child: Text(info.data!.appName)),
                    Center(child: Text(info.data!.packageName)),
                    Center(child: Text(info.data!.version)),
                    Center(child: Text(info.data!.buildNumber)),
                  ],
                ),
        ),
      ),
    ),
  );
}
