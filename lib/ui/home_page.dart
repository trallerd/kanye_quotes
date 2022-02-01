// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kenye_app/blocs/quote_cubit.dart';
import 'package:kenye_app/blocs/quote_cubit_state.dart';
import 'package:kenye_app/data/repositories/quote_repository_interface.dart';
import 'package:kenye_app/shared/uris.dart';

import '../locator.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const name = 'home-page';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QuoteCubit(getIt.get<QuoteRepositoryInterface>()),
      child: HomePageView(),
    );
  }
}

class HomePageView extends StatelessWidget {
  String uri = _buildUri();
  HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 0,
        title: const Center(
          child: Text(
            "Kanye once said...",
          ),
        ),
      ),
      body: BlocListener<QuoteCubit, QuoteState>(
        listener: (context, state) {
          if (state is LoadingState) {
            const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Something went wrong, Kenye is speechless!')));
          }
        },
        child: BlocBuilder<QuoteCubit, QuoteState>(builder: (context, state) {
          if (state is SuccessState) {
            final quote = state.quot.quote;
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.shade300,
                      ),
                      child: Text(
                        quote,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(uri),
                    )
                  ],
                ),
              ),
            );
          }
          return Container();
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          uri = _buildUri();
          context.read<QuoteCubit>().getQuote();
        },
        backgroundColor: Colors.deepOrangeAccent,
        child: const Icon(
          Icons.autorenew,
          size: 30,
        ),
      ),
    );
  }
}

String _buildUri() {
  Random rg = Random();
  return Uris.lista[rg.nextInt(Uris.lista.length)];
}
