extension StringTruncate on String {
  String truncateTo(
      int maxChars, {
        String ellipsis = ' ...',
        bool showEllipsis = true,
        bool preserveWholeWords = true,
      }) {
    if (length <= maxChars) return this;

    final effectiveEllipsis = showEllipsis ? ellipsis : '';
    final targetLength = maxChars - effectiveEllipsis.length.clamp(0, maxChars);

    if (targetLength <= 0) return effectiveEllipsis;

    int endIndex = targetLength;

    if (preserveWholeWords) {
      while (endIndex > 0 && this[endIndex - 1] != ' ') {
        endIndex--;
      }
      if (endIndex == 0) endIndex = targetLength;
    }

    return substring(0, endIndex).trimRight() + effectiveEllipsis;
  }
}

/*
ListTile(
  leading: Image.network(product.imageUrl),
  title: Text(
    // ৫০ ক্যারেক্টারের বেশি হলে কেটে শেষে '...' বসাবে
    product.title.truncateTo(50),
    style: TextStyle(fontWeight: FontWeight.bold),
  ),
  subtitle: Text(
    // ১০০ ক্যারেক্টারে কাটবে, কিন্তু শব্দ ভাঙবে না
    product.description.truncateTo(100),
  ),
);
*/