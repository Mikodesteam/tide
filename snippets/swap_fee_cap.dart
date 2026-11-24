// Excerpt from TIDE (lib/core/monetization/swap_fee_config.dart). Shown for illustration only.
// The full source code is available at https://store.mikodes.com/p/tide/
//
// The operator swap fee ships empty and is capped in code. Whatever a remote or local
// configuration says, the rate is clamped to 2.00%, and the fee only counts as active
// when it is switched on, non-zero and paired with a well-formed, non-placeholder wallet.

@immutable
class SwapFeeConfig {
  /// Hard ceiling. No configuration, remote or local, can exceed it.
  static const int maxFeeBps = 200;

  final bool enabled;
  final int feeBps;
  final String solanaFeeWallet;

  const SwapFeeConfig({
    this.enabled = false,
    this.feeBps = 0,
    this.solanaFeeWallet = '',
  });

  /// The shipped default: no fee, no wallet, nothing enabled.
  static const SwapFeeConfig empty = SwapFeeConfig();

  factory SwapFeeConfig.fromJson(Map<String, dynamic> json) {
    final rawBps = ((json['fee_bps'] ?? json['feeBps']) as num?)?.toInt() ?? 0;
    return SwapFeeConfig(
      enabled: (json['fee_enabled'] as bool?) ?? rawBps > 0,
      feeBps: rawBps.clamp(0, maxFeeBps),
      solanaFeeWallet:
          (json['solana_fee_wallet'] as String?)?.trim() ?? '',
    );
  }

  double get feeFraction => feeBps / 10000.0;

  /// True only when the fee can actually be charged.
  bool get isActive {
    if (!enabled || feeBps <= 0) return false;
    return isUsableFeeWallet(wallet);
  }

  /// The fee a trade of [tradeValueUsd] will actually be charged.
  double feeUsdFor(double tradeValueUsd) {
    if (!isActive || tradeValueUsd <= 0) return 0;
    return tradeValueUsd * feeFraction;
  }

  static bool isPlaceholder(String value) {
    final v = value.trim().toLowerCase();
    return v.isEmpty ||
        v.contains('placeholder') ||
        v.contains('replace_with') ||
        v.contains('your_wallet') ||
        v.startsWith('__');
  }

  /// True when [value] is a well-formed Solana address and not a placeholder.
  static bool isUsableFeeWallet(String value) {
    final v = value.trim();
    if (isPlaceholder(v)) return false;
    return RegExp(r'^[1-9A-HJ-NP-Za-km-z]{32,44}$').hasMatch(v);
  }
  // …
}
