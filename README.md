<p align="center">
  <img src="assets/logo.png" width="72" alt="TIDE logo">
</p>

<h1 align="center">TIDE</h1>

<p align="center">
  <b>Self-custodial Solana wallet with a social feed (Flutter).</b>
</p>

<p align="center">
  <a href="https://tide-demo.mikodes.com/"><b>▶ Live demo</b></a> ·
  <a href="https://tide.mikodes.com/docs/"><b>Docs</b></a> ·
  <a href="https://tide.mikodes.com/"><b>Website</b></a> ·
  <a href="https://store.mikodes.com/p/tide/"><b>Get the full source code</b></a>
</p>

<p align="center">
  <img alt="Flutter" src="https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white">
  <img alt="Swift" src="https://img.shields.io/badge/Swift-F05138?logo=swift&logoColor=white">
  <img alt="Version" src="https://img.shields.io/badge/version-1.0.0-111">
</p>

<p align="center">
  <img src="assets/hero.gif" width="100%" alt="TIDE">
</p>

> **This repository is a showcase.** It holds screenshots, documentation pointers and a real excerpt
> from the code. The full application is sold as source code at
> **[store.mikodes.com/p/tide](https://store.mikodes.com/p/tide/)**: one payment, instant ZIP download, free setup help.

---

## What it is

A Solana wallet for iOS, Android and web with a built-in social feed, swaps, and a web build protected by a vault passphrase that is asked again before revealing keys or signing.

## Screens

<p align="center"><img src="assets/fee.png" width="49%" alt="Fee"> <img src="assets/stats.png" width="49%" alt="Stats"></p>
<p align="center"><img src="assets/flow.png" width="49%" alt="Flow"> <img src="assets/feed.png" width="49%" alt="Feed"></p>
<p align="center"><img src="assets/swap.png" width="49%" alt="Swap"> <img src="assets/operator.png" width="49%" alt="Operator"></p>

## Features

- **Self-custodial Solana wallet**
- **Web build protected by a vault passphrase**
- **Token swaps**
- **Operator swap fee capped at 200 bps in code**
- **Copy execution as a separable module, off by default**
- **Copy execution gated on a self-declared region**
- **Feed reports observed on-chain activity, never advice**
- **No seeded data anywhere**
- **Ships keyless**
- **True light theme plus dark, warm coral accent**
- **Operator panel only in operator builds**
- **Optional realised tab, off by default and never ranked**

## A look at the code

**Fail-closed region gate**: [`snippets/jurisdiction_gate.dart`](snippets/jurisdiction_gate.dart). Copy execution is only enabled for a region the user has declared, and an unknown region is treated as restricted. The operator can add countries but can never remove the built-in baseline, so a bad configuration cannot switch the module on in a regulated market.

## Requirements (full version)

- Flutter SDK 3.41 or newer
- Xcode 15+ with CocoaPods, on a Mac
- Android Studio, current stable
- Google Chrome, current
- A Solana RPC endpoint of your own
- Apple Developer Program, enrolled as an organisation

Not included: Hosting and domain; Third-party API subscriptions; Developer accounts; Blockchain network fees; A backend — TIDE has none by design.

## Get the full source code

<p align="center">
  <a href="https://store.mikodes.com/p/tide/"><img src="https://img.shields.io/badge/Get%20the%20full%20source%20code-store.mikodes.com-4F2BFF?style=for-the-badge" alt="Get the full source code"></a>
</p>

One payment, full licence, instant ZIP download and free setup help.
Questions: [mikodes.com/support](https://mikodes.com/support).

---

<p align="center">
  Made by <a href="https://mikodes.com"><b>MIKODES</b></a> · <a href="https://github.com/Mikodesteam">more projects</a>
</p>
