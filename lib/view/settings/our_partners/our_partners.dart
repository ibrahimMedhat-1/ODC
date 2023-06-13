import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_project/view_model/bloc/settings/partners/partners_cubit.dart';

class OurPartners extends StatelessWidget {
  const OurPartners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PartnersCubit(),
      child: BlocBuilder<PartnersCubit, PartnersState>(
        builder: (context, state) {
          return BlocConsumer<PartnersCubit, PartnersState>(
            listener: (context, state) {

            },
            builder: (context, state) {
              PartnersCubit.get(context);
              return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.deepOrange,
                    ),
                  ),
                  title: const Text(
                    'Our Partners',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                body: Padding(
                  padding: EdgeInsets.all(20),
                  child: Card(
                    child: Image.asset('assets/partners.jpg'),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
