import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_project/view_model/bloc/text/text_cubit.dart';

class text extends StatelessWidget {
  text({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TextCubit(),
      child: BlocProvider(
        create: (context) => TextCubit(),
        child: BlocConsumer<TextCubit, TextState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            TextCubit c = TextCubit.get(context);
            return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Column(
                  children: [
                    Text(c.text.toString()),
                    TextFormField(
                      controller: c.txtcont,
                    ),
                    MaterialButton(
                      onPressed: () {
                        c.printName(c.txtcont.text);
                      },
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
