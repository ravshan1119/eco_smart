// import 'dart:convert';
//
// import 'package:hive/hive.dart';
//
// part 'hive_db.g.dart';
//
// part 'package:pharmacy/data/model/product_basket_local_model.dart';
// part 'package:pharmacy/data/model/home_model.dart';
// part 'package:pharmacy/data/model/order_model.dart';
// part 'package:pharmacy/data/model/cards_list_model.dart';
// part 'package:pharmacy/data/model/chat_model.dart';
// part 'package:pharmacy/data/model/addresses_model.dart';
// part 'package:pharmacy/data/model/category_model.dart';
// part 'package:pharmacy/data/model/home_details_model.dart';
// part 'package:pharmacy/data/model/filter_model.dart';
//
// @HiveType(typeId: 0)
// class HiveDB {
//
//   @HiveField(0)
//   DateTime? date;
//
//   @HiveField(1)
//   List<int>? favourites;
//
//   /// typeId 1
//   @HiveField(2)
//   List<Product>? productsBasket;
//
//   /// typeId 2-4  14-15
//   @HiveField(3)
//   HomeData? homeOrders;
//
//   /// typeId 5
//   @HiveField(4)
//   List<OrderData>? orders;
//
//   /// typeId 6-7
//   @HiveField(5)
//   List<CategoryData>? categoryOrders;
//
//   /// typeId 13 - 19 - 20
//   @HiveField(6)
//   Map<int, Product>? detailOrders;
//
//   /// typeId 8-9
//   @HiveField(7)
//   List<ChatModelData>? chatOrders;
//
//   /// typeId 10
//   @HiveField(8)
//   List<AddressDataModel>? addressOrders;
//
//   /// typeId 11-12
//   @HiveField(9)
//   List<CardsListModelData>? cardOrders;
//
//   /// typeId 16-18
//   @HiveField(10)
//   FilterData? filter;
//
//   HiveDB({
//     this.date,
//     this.favourites,
//     this.productsBasket,
//     this.homeOrders,
//     this.orders,
//     this.categoryOrders,
//     this.detailOrders,
//     this.chatOrders,
//     this.addressOrders,
//     this.cardOrders,
//     this.filter,
//   });
//
//   HiveDB copyWith({
//     DateTime? date,
//     List<int>? favourites,
//     List<Product>? productsBasket,
//     HomeData? homeOrders,
//     List<OrderData>? orders,
//     List<CategoryData>? categoryOrders,
//     Map<int, Product>? detailOrders,
//     List<ChatModelData>? chatOrders,
//     List<AddressDataModel>? addressOrders,
//     List<CardsListModelData>? cardOrders,
//     FilterData? filter,
//   }) {
//     return HiveDB(
//       date: date ?? this.date,
//       favourites: favourites ?? this.favourites,
//       productsBasket: productsBasket ?? this.productsBasket,
//       homeOrders: homeOrders ?? this.homeOrders,
//       orders: orders ?? this.orders,
//       categoryOrders: categoryOrders ?? this.categoryOrders,
//       detailOrders: detailOrders ?? this.detailOrders,
//       chatOrders: chatOrders ?? this.chatOrders,
//       addressOrders: addressOrders ?? this.addressOrders,
//       cardOrders: cardOrders ?? this.cardOrders,
//       filter: filter ?? this.filter,
//     );
//   }
// }
