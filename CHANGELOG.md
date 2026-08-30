## 2.1.0

- Added support for multi-line unbuffered assignments such as
  `-\n  var slides = [ ... ]` in `nodeMigration` compatibility mode.
- Added support for list `.map((item) => expression)` arrow functions in
  `nodeMigration` compatibility mode.
- Added support for reassigning existing locals through unbuffered code, e.g.
  `- alt = alt || name`.
- Added support for hyphenated mixin names and mixin-call attributes, IDs, and
  classes.
- Added support for including non-Pug files as raw text.

## 2.0.1

- Added `PugCompatibility.nodeMigration` for common safe Pug.js migration
  patterns without enabling arbitrary JavaScript execution.
- Added opt-in restricted unbuffered assignments for
  `- var/let/const name = expression` through `allowLocalAssignments` or the
  node migration preset.
- Added opt-in simple template literal interpolation through
  `simpleTemplateLiterals` or the node migration preset.
- Added node migration helpers and methods for `JSON.stringify`, `Number`,
  `String`, `Math.round/floor/ceil/min/max`, numeric `.toFixed(n)`, `.length`,
  simple `.join(...)`, and `.includes(...)`.
- Improved migration diagnostics for unsupported template literals,
  unbuffered assignments, and disabled `JSON`/`Math` expressions.

## 2.0.0

- Rebuilt `pug_dart` as a native Dart Pug renderer.
- Removed the Node.js runtime dependency from normal rendering.
- Added Pug-like `render`, `renderFile`, `compile`, and `compileFile` APIs.
- Added parser, AST, safe evaluator, renderer, loaders, diagnostics, helpers,
  filters, mixins, includes, inheritance, and a golden parity harness.
- Added committed golden fixtures generated from pinned upstream `pug@3.0.4`.
- Added source-spanned parse/render diagnostics and wrapped file-loading
  diagnostics.
- Added `pretty` output support for supported HTML trees.

### Breaking changes

- Arbitrary JavaScript evaluation is no longer supported.
- JavaScript statements, mutation, implicit globals such as `JSON`, `Math`,
  `Date`, and `moment`, and JSTransformer filters are intentionally out of
  scope.
- Templates that depended on JavaScript-heavy expressions should precompute
  values in Dart or expose explicit Dart helpers and filters.
- The implementation is now a native Dart renderer rather than a wrapper around
  the original JavaScript Pug runtime.

If you need the original Node-backed behavior, pin `pug_dart` to the latest
compatible `1.x` release.
