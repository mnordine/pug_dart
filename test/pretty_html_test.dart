import 'package:pug_dart/src/renderer.dart' show prettyHtml;
import 'package:test/test.dart';

void main() {
  test('pretty HTML preserves whitespace-sensitive element content', () {
    const html = '<body><pre style="font-size: 15px">By mail:\n'
        'Company Inc.\n'
        '  12 blah Street</pre>'
        '<textarea>First line\n  Indented line</textarea></body>';

    expect(
      prettyHtml(html),
      '<body>\n'
      '  <pre style="font-size: 15px">By mail:\n'
      'Company Inc.\n'
      '  12 somewhere Street</pre>\n'
      '  <textarea>First line\n'
      '  Indented line</textarea>\n'
      '</body>',
    );
  });
}
