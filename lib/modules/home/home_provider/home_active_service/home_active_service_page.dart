import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/modules/home/home_provider/home_active_service/widgets/card_active_service.dart';

class HomeActiveServicePage extends StatelessWidget {
  const HomeActiveServicePage({Key? key, required this.userId})
      : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('active_services')
            .orderBy('createAt')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Erro ao buscar dados!'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CupertinoActivityIndicator(
                animating: true,
              ),
            );
          }

          if (snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('Nenhum serviço ativo!'));
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return CardActiveService(
                contractorId: data['contractorId'],
                documentId: document.id,
                data: data,
                avatar: data['image_avatar'],
                name: data['name'],
                titleDescription: data['description'],
                address: data['address'],
                number: data['number'].toString(),
                city: data['city'],
                createAt: data['createAt'].toString(),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
