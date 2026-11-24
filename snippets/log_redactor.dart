// Excerpt from TIDE (lib/core/util/log_redactor.dart). Shown for illustration only.
// The full source code is available at https://store.mikodes.com/p/tide/
//
// Redacts at the boundary: recovery phrases, hex keys and base58 addresses or signatures
// are masked before a string can reach a log, a crash report or an operator console.

/// Strips anything that identifies a person or unlocks an account before a
/// string can reach a log sink, a crash report or an operator console.
///
/// TIDE redacts at the boundary instead of trusting every call site, so an
/// operator console or crash report never links a person to a wallet.
class LogRedactor {
  const LogRedactor._();

  static final List<RegExp> _patterns = <RegExp>[
    // 12/24-word BIP-39 phrases — always redacted whole.
    RegExp(r'\b(?:[a-z]{3,8}\s+){11,23}[a-z]{3,8}\b'),
    // 0x-prefixed 20-byte and 32-byte hex (addresses, keys, hashes).
    RegExp(r'\b0x[0-9a-fA-F]{40}\b'),
    RegExp(r'\b0x[0-9a-fA-F]{64}\b'),
    // Base58 Solana addresses / signatures.
    RegExp(r'\b[1-9A-HJ-NP-Za-km-z]{32,88}\b'),
  ];

  static const String mask = '[redacted]';

  static String redact(String input) {
    var output = input;
    for (final pattern in _patterns) {
      output = output.replaceAll(pattern, mask);
    }
    return output;
  }
  // …
}
