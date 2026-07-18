# Aura Ecosystem

A multi-language monorepo for the Aura ecosystem that bundles a Flutter/Dart front-end, documentation and website sources, and a set of supporting tools (including a prebuilt MCP server binary and configuration).

## Quickstart

Requirements:
- Flutter SDK (see https://flutter.dev)
- Dart SDK (bundled with Flutter)
- Python 3.8+ (for docs/tools)

Install dependencies and run the Flutter app:

```bash
# fetch Dart/Flutter packages
flutter pub get

# run the app (choose device or web target)
flutter run -t lib/main.dart
```

Run tests:

```bash
flutter test
```

Install Python dependencies (used by docs/tools):

```bash
pip install -r requirements.txt
```

Run the included MCP server (Windows binary included). On Windows:

```powershell
.\github-mcp-server.exe --config mcp_config.default.json
```

On Linux/macOS you can try using wine if available:

```bash
wine ./github-mcp-server.exe --config mcp_config.default.json
```

Docs

- Primary docs source: Docs/index.md and src/index.rst. To build the Sphinx docs (requires Sphinx):

```bash
make -C docs html
```

Repository layout

See the repository overview in the project root for details on top-level directories and where to find Flutter code, docs, and tools.

License

This project is available under the MIT License — see LICENSE for details.
