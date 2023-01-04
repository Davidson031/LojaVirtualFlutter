import 'package:quitanda_virtual/src/models/item_model.dart';
import 'package:quitanda_virtual/src/models/order_model.dart';
import 'package:quitanda_virtual/src/models/user_model.dart';

import '../models/cart_item_model.dart';

ItemModel apple = ItemModel(
  description:
      'A melhor maçã da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  imgUrl: 'assets/fruits/apple.png',
  itemName: 'Maçã',
  price: 5.5,
  unit: 'kg',
);

ItemModel grape = ItemModel(
  imgUrl: 'assets/fruits/grape.png',
  itemName: 'Uva',
  price: 7.4,
  unit: 'kg',
  description:
      'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel guava = ItemModel(
  imgUrl: 'assets/fruits/guava.png',
  itemName: 'Goiaba',
  price: 11.5,
  unit: 'kg',
  description:
      'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel kiwi = ItemModel(
  imgUrl: 'assets/fruits/kiwi.png',
  itemName: 'Kiwi',
  price: 2.5,
  unit: 'un',
  description:
      'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel mango = ItemModel(
  imgUrl: 'assets/fruits/mango.png',
  itemName: 'Manga',
  price: 2.5,
  unit: 'un',
  description:
      'A melhor manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel papaya = ItemModel(
  imgUrl: 'assets/fruits/papaya.png',
  itemName: 'Mamão papaya',
  price: 8,
  unit: 'kg',
  description:
      'O melhor mamão da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

List<ItemModel> items = [apple, grape, guava, kiwi, mango, papaya];

List<String> categories = [
  "Frutas",
  "Legumes",
  "Verduras",
  "Temperos",
  "Cereais"
];

List<CartItemModel> cartItems = [
  CartItemModel(item: grape, quantity: 2),
  CartItemModel(item: apple, quantity: 1),
  CartItemModel(item: mango, quantity: 3),
  CartItemModel(item: papaya, quantity: 4),
];

UserModel user = UserModel(
  name: "Pedro",
  email: "joao@gmail.com",
  phone: '99 99999 9999',
  cpf: "999.999.999-99",
  password: "",
);

List<OrderModel> orders = [
  OrderModel(
    id: "5ds4d5dd54fd2s",
    createdDateTime: DateTime.parse("2021-06-08 10:00:10.458"),
    overdueDateTime: DateTime.parse("2026-06-08 11:00:10.458"),
    items: [
      CartItemModel(item: apple, quantity: 2),
      CartItemModel(item: mango, quantity: 1),
      CartItemModel(item: grape, quantity: 3),
    ],
    status: 'pending_payment',
    copyAndPaste: "e4e1fs2e4fs",
    total: 11.0,
  ),
  OrderModel(
    id: "5ds4d5dd54fd2s",
    createdDateTime: DateTime.parse("2021-06-08 10:00:10.458"),
    overdueDateTime: DateTime.parse("2026-06-08 11:00:10.458"),
    items: [
      CartItemModel(item: apple, quantity: 2),
      CartItemModel(item: mango, quantity: 1),
      CartItemModel(item: grape, quantity: 3),
    ],
    status: 'paid',
    copyAndPaste: "e4e1fs2e4fs",
    total: 11.0,
  )
];
