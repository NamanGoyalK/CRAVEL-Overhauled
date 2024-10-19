// import 'package:flutter/material.dart';
// import 'package:in_app_purchase/in_app_purchase.dart';

// class RemoveAdsPage extends StatefulWidget {
//   const RemoveAdsPage({super.key});

//   @override
//   _RemoveAdsPageState createState() => _RemoveAdsPageState();
// }

// class _RemoveAdsPageState extends State<RemoveAdsPage> {
//   final InAppPurchase _iap = InAppPurchase.instance;
//   bool _isAvailable = false;
//   final bool _purchasePending = false;

//   @override
//   void initState() {
//     _initializeInAppPurchase();
//     super.initState();
//   }

//   void _initializeInAppPurchase() async {
//     final isAvailable = await _iap.isAvailable();
//     setState(() {
//       _isAvailable = isAvailable;
//     });
//   }

//   // void _buyRemoveAds() {
//   //   const String productId = 'remove_ads_129';
//   //   final PurchaseParam purchaseParam =
//   //       // PurchaseParam(productDetails: _getProductDetails(productId));
//   //       // _iap.buyNonConsumable(purchaseParam: purchaseParam);
//   // }

//   // ProductDetails _getProductDetails(String productId) {
//   //   // Implement function to fetch product details (you would query the product first)
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Remove Ads')),
//       body: Center(
//         child: _isAvailable
//             ? ElevatedButton(
//                 onPressed: _purchasePending ? null : _buyRemoveAds,
//                 child: Text(
//                     _purchasePending ? 'Processing...' : 'Remove Ads for ₹129'),
//               )
//             : const Text('In-app purchases not available'),
//       ),
//     );
//   }
// }

// void _handlePurchaseUpdate(List<PurchaseDetails> purchaseDetailsList) {
//   for (var purchaseDetails in purchaseDetailsList) {
//     if (purchaseDetails.status == PurchaseStatus.purchased) {
//       // Handle successful purchase, e.g., remove ads
//       _removeAds();
//     }
//   }
// }

// void _removeAds() {
//   // Logic to disable ads across your app
// }
