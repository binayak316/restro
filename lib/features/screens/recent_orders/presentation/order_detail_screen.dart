import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/order_detail_controller.dart';

class MyOrderDetailScreen extends StatelessWidget {
  static const String routeName = "/order-detail-screen";
  final c = Get.find<OrderDetailController>();

  MyOrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Order Detail"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text("Total Price: ${c.myOrderDetail.value?.totalPrice ?? ""}"),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if (c.myOrderDetail.value?.items != null) {
                      var item = c.myOrderDetail.value?.items![index];
                      return Text(item?.product?.name ?? "");
                    } else {
                      return SizedBox();
                    }
                  },
                  itemCount: c.myOrderDetail.value?.items?.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
