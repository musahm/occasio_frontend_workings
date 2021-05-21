import 'package:flutter/material.dart';
import 'package:occasio_frontend_workings/features/dashboard/domain/entities/userEntity.dart';
import 'package:occasio_frontend_workings/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:occasio_frontend_workings/dependency_injection.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<DashboardBloc>(),
        child: MatchedUsers(),
      ),
    );
  }
}

class MatchedUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              print(state);
              if (state is DashboardLoading) {
                return Text("Loading");
              }
              if (state is DashboardLoaded) {
                List<UserEntity> userEntities = state.userEntities;
                return ListView.builder(
                    itemCount: userEntities.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        color: Colors.amber,
                        margin: EdgeInsets.all(5),
                        child: Wrap(
                          spacing: 10,
                          children: [
                            Text("id: ${userEntities[index].id}"),
                            Text("mobile: ${userEntities[index].mobile}"),
                            Text(
                                "first Name: ${userEntities[index].firstname}"),
                            Text("username: ${userEntities[index].username}"),
                            Text("email: ${userEntities[index].email}"),
                          ],
                        ),
                      );
                    });
              }

              return Text("initial state");
            },
          ),
          MaterialButton(
            onPressed: () {
              print("clicked");
              BlocProvider.of<DashboardBloc>(context)
                  .add(GetMatchesEvent(matchLevel: 50));
            },
            child: Text("Get Data"),
          ),
        ],
      ),
    );
  }
}
