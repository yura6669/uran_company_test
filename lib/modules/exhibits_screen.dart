import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uran_company_test/core/blocs/exhibit_bloc.dart';
import 'package:uran_company_test/core/locator.dart';
import 'package:uran_company_test/modules/widgets/exhibit_item.dart';

class ExhibitsScreen extends StatefulWidget {
  const ExhibitsScreen({super.key});

  @override
  State<ExhibitsScreen> createState() => _ExhibitsScreenState();
}

class _ExhibitsScreenState extends State<ExhibitsScreen> {
  late ExhibitBloc _exhibitBloc;

  @override
  void initState() {
    super.initState();
    _exhibitBloc = locator.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ExhibitBloc, ExhibitState>(
        bloc: _exhibitBloc,
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
          if (state.isError) {
            return const Center(
              child: Text('Something went wrong...'),
            );
          }
          final exhibits = state.asReady.exhibits;
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                physics: const ScrollPhysics(),
                itemCount: exhibits.length,
                itemBuilder: (context, index) {
                  final exhibit = exhibits[index];
                  return ExhibitItem(
                    exhibit: exhibit,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
