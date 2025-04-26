String transformErrors(
  Map<String, dynamic> jsonResponse,
) {
  if (jsonResponse.containsKey('errors')) {
    final errors = jsonResponse['errors'] as Map<String, dynamic>;
    return errors.entries.map((entry) {
      final messages = entry.value;
      if (messages is List) {
        return messages.map((msg) => '- $msg').join('\n');
      } else if (messages is String) {
        return '- $messages';
      }
      return '';
    }).join('\n');
  }
  if (jsonResponse.containsKey('message')) {
    return jsonResponse['message'];
  }
  return 'حدث خطأ غير معروف';
}
