import 'package:movie_app_practice/pages/description_page/description_cubit/description_cubit.dart';
import 'package:movie_app_practice/pages/description_page/description_cubit/description_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonWidget extends StatelessWidget {
  const PersonWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DescriptionCubit, DescriptionState>(
      builder: (context, state) {
        if (state is DescriptionInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ModelDescriptionState) {
          final persons = state.persons;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: persons.length,
            itemBuilder: (context, index) {
              final person = persons[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: person.profilePath ==
                          null
                          ? const AssetImage('assets/noPhoto.jpg')
                      as ImageProvider
                          : NetworkImage(person.profilePath.toString()),
                    ),
                    Text(
                      person.name,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
