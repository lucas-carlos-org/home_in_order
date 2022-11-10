// ignore_for_file: unrelated_type_equality_checks, unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:home_in_order/modules/profile/profile_historic/widgets/historic_service_card.dart';
import './historic_controller.dart';

class HistoricPage extends GetView<HistoricController> {
  const HistoricPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Serviços'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(controller.userId.value)
                  .collection('historic_services')
                  .orderBy('createAt')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text('Erro ao buscar dados!'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('Histórico vazio!'));
                }

                return Obx(
                  () {
                    return controller.userType.value == null ||
                            controller.userType.value.isEmpty
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              int itemCount = snapshot.data!.docs.length;
                              int reversedIndex = itemCount - 1 - index;
                              final document =
                                  snapshot.data!.docs[reversedIndex];

                              var data =
                                  document.data()! as Map<String, dynamic>;

                              DateTime dt =
                                  (data['createAt'] as Timestamp).toDate();

                              return controller.userType == 'provider'
                                  ? HistoricServiceCard(
                                      date: dt,
                                      avatar: data['image_avatar'],
                                      name: data['name'],
                                      titleDescription: data['description'],
                                      status: data['status'] ?? '',
                                      data: data,
                                      documentId: document.id,
                                      userType: controller.userType.value,
                                    )
                                  : HistoricServiceCard(
                                      date: dt,
                                      avatar: data['providerImage'],
                                      name: data['providerName'],
                                      titleDescription: data['description'],
                                      status: data['status'] ?? '',
                                      data: data,
                                      documentId: document.id,
                                      userType: controller.userType.value,
                                    );
                            },
                          );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
