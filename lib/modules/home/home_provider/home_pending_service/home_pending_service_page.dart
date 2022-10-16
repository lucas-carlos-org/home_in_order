import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';

class HomePendingServicePage extends StatelessWidget {
  const HomePendingServicePage({Key? key, required this.userId})
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
            .collection('pending_services')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Erro ao buscar dados!'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('Nenhum serviço pendente!'));
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              final data =
                  document.data()! as Map<String, dynamic>;
              return const Text('SERVIÇO');
            }).toList(),
          );
        },
      ),
    );
  }
}
