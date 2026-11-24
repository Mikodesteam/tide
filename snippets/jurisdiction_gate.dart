// Excerpt from TIDE (lib/core/compliance/jurisdiction_gate.dart). Shown for illustration only.
// The full source code is available at https://store.mikodes.com/p/tide/
//
// A fail-closed region gate for the optional copy-execution module.
// An unknown or malformed region counts as restricted, and the operator can add
// restricted countries but can never remove the built-in baseline.

import 'package:flutter/foundation.dart';
// …
/// Where copy execution may not run.
///
/// Alerting a user that a watched wallet did something is defensible.
/// Executing a trade on their behalf, on rules they set once, is closer to
/// discretionary portfolio management — which is a licensed activity in most
/// of these markets.
///
/// The baseline is a conservative list of six markets — the United States,
/// Canada, the United Kingdom, Singapore, Hong Kong and Malaysia — where
/// copy trading is commonly restricted to licensed firms.
///
/// **The region is self-declared.** The user types a two-letter country code
/// in Settings. TIDE does not detect, geolocate or verify it, so this gate is
/// a declared-region check, not a geofence.
///
/// The operator can **add** jurisdictions. They cannot remove a baseline one:
/// [restrictedFor] always unions the baseline in. Licensing remains the
/// operator's responsibility and is stated as such in the listing and in
/// docs/COMPLIANCE.md.
@immutable
class JurisdictionGate {
  /// ISO 3166-1 alpha-2. Never shorten this list.
  static const Set<String> baselineRestricted = <String>{
    'US', // United States
    'CA', // Canada
    'GB', // United Kingdom
    'SG', // Singapore
    'HK', // Hong Kong
    'MY', // Malaysia
  };

  /// Extra codes the operator adds for their own licensing position.
  final Set<String> operatorRestricted;

  /// The region the user declared in Settings, ISO 3166-1 alpha-2. Null means
  /// not declared — and that is treated as restricted.
  final String? region;

  const JurisdictionGate({
    this.region,
    this.operatorRestricted = const <String>{},
  });

  Set<String> get restrictedCodes => <String>{
        ...baselineRestricted,
        ...operatorRestricted.map((c) => c.trim().toUpperCase()),
      };

  /// True when copy execution must stay switched off for this user.
  ///
  /// An unknown region is restricted. Failing open here would mean shipping
  /// execution into exactly the markets that regulate it.
  bool get isRestricted {
    final code = region?.trim().toUpperCase();
    if (code == null || code.isEmpty || code.length != 2) return true;
    return restrictedCodes.contains(code);
  }

  bool get isPermitted => !isRestricted;
// …
  JurisdictionGate withOperatorRestrictions(Iterable<String> codes) =>
      JurisdictionGate(
        region: region,
        operatorRestricted: codes
            .map((c) => c.trim().toUpperCase())
            .where((c) => c.length == 2)
            .toSet(),
      );
}
