import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';

// ✅ Conditional import (IMPORTANT)
import 'web_download_helper_stub.dart'
    if (dart.library.html) 'web_download_helper.dart';

class InvoiceService {
  final Dio dio;

  InvoiceService(this.dio);

  Future<void> downloadInvoice({
    required String url,
    required String fileName,
  }) async {
    try {
      if (kIsWeb) {
        // 🌐 WEB → download using bytes
        final response = await dio.get(
          url,
          options: Options(responseType: ResponseType.bytes),
        );

        downloadFileWeb(response.data, fileName);
      } else {
        // 📱 MOBILE → download + open
        final dir = await getApplicationDocumentsDirectory();
        final filePath = "${dir.path}/$fileName.pdf";

        await dio.download(
          url,
          filePath,
          options: Options(responseType: ResponseType.bytes),
        );

        await OpenFilex.open(filePath);
      }
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['message'] ?? "Failed to download invoice",
      );
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }
}