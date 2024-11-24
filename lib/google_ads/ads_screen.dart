// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   MobileAds.instance.initialize(); // Initialize Mobile Ads SDK
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: AdsExample(),
//     );
//   }
// }
//
// class AdsExample extends StatefulWidget {
//   @override
//   _AdsExampleState createState() => _AdsExampleState();
// }
//
// class _AdsExampleState extends State<AdsExample> {
//   late BannerAd _bannerAd;
//   bool _isBannerAdReady = false;
//   RewardedAd? _rewardedAd;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadBannerAd();
//     _loadRewardedAd();
//   }
//
//   // Load Banner Ad
//   void _loadBannerAd() {
//     _bannerAd = BannerAd(
//       adUnitId: 'ca-app-pub-3940256099942544/6300978111', // Test Banner Ad Unit ID
//       request: AdRequest(),
//       size: AdSize.banner,
//       listener: BannerAdListener(
//         onAdLoaded: (_) {
//           setState(() {
//             _isBannerAdReady = true;
//           });
//           print("Banner Ad loaded.");
//         },
//         onAdFailedToLoad: (ad, error) {
//           print('Banner ad failed to load: $error');
//           ad.dispose();
//         },
//       ),
//     );
//     _bannerAd.load();
//   }
//
//   // Load Rewarded Ad
//   void _loadRewardedAd() {
//     RewardedAd.load(
//       adUnitId: 'ca-app-pub-3940256099942544/5224354917', // Test Rewarded Ad Unit ID
//       request: AdRequest(),
//       rewardedAdLoadCallback: RewardedAdLoadCallback(
//         onAdLoaded: (RewardedAd ad) {
//           _rewardedAd = ad;
//           print("Rewarded Ad loaded.");
//         },
//         onAdFailedToLoad: (LoadAdError error) {
//           print('Rewarded ad failed to load: $error');
//         },
//       ),
//     );
//   }
//
//   // Show Rewarded Ad
//   void _showRewardedAd() {
//     if (_rewardedAd != null) {
//       _rewardedAd!.show(
//         onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
//           print('User earned reward of ${reward.amount} ${reward.type}');
//         },
//       );
//       _rewardedAd = null; // Make sure to load a new one after showing
//       _loadRewardedAd(); // Load another rewarded ad
//     } else {
//       print('Rewarded ad is not ready yet.');
//     }
//   }
//
//   @override
//   void dispose() {
//     _bannerAd.dispose();
//     _rewardedAd?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Google Ads Integration')),
//       body: Column(
//         children: [
//           Expanded(
//             child: Center(child: Text('Main Content')),
//           ),
//           if (_isBannerAdReady)
//             Container(
//               height: _bannerAd.size.height.toDouble(),
//               width: _bannerAd.size.width.toDouble(),
//               child: AdWidget(ad: _bannerAd),
//             ),
//           SizedBox(height: 10),
//           ElevatedButton(
//             onPressed: _showRewardedAd,
//             child: Text('Show Rewarded Ad'),
//           ),
//         ],
//       ),
//     );
//   }
// }
