import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:giphy_get/giphy_get.dart';
import 'package:giphy_store/presentation/constants/theme/app_colors.dart';
import 'package:giphy_store/presentation/constants/theme/app_text_styles.dart';
import 'package:giphy_store/presentation/constants/theme/theme_cubit/theme_cubit.dart';
import 'package:giphy_store/presentation/screen/home/bloc/home_bloc.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool themeIsDark = true;
  final bloc = HomeBloc();
  final TextEditingController controller = TextEditingController();
  @override
  void initState() {
    bloc.add(FetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return BlocProvider(
      create: (context) => bloc,
      child: Scaffold(
        backgroundColor: colorScheme.background,
        appBar: AppBar(
          title: Text("Giphy Store", style: textTheme.displayLarge),
          actions: [
            Switch(
              value: themeIsDark,
              onChanged: (value) {
                themeIsDark = value;
                BlocProvider.of<ThemeCubit>(context).toggleTheme(isDark: value);
              },
            )
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter The "
                                "Search"),
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            if (value.length < 3) {
                              return "Enter more than 3 words";
                            }
                          }
                        },
                        controller: controller,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          if (controller.text.length > 2) {
                            bloc.add(SearchGifEvent(query: controller.text));
                          }
                        },
                        child: Text(
                          "Search",
                          style: textTheme.bodyLarge,
                        ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                BlocConsumer<HomeBloc, HomeState>(
                  listener: (context, state) {
                    if (state is HomeTrendingLoaded) {
                      if (state.error != null) {
                        showError(context, state.error!);
                      }
                    }
                    if (state is HomeSearchLoaded) {
                      if (state.error != null) {
                        showError(context, state.error!);
                      }
                    }
                  },
                  builder: (context, state) {
                    if (state is HomeTrendingLoaded) {
                      return Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 3 / 4,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5),
                          itemBuilder: (context, index) {
                            return state.list[index].images?.original?.url !=
                                    null
                                ? Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: colorScheme.primary,
                                            width: 2)),
                                    child: Image.network(state.list[index]
                                            .images?.original?.url ??
                                        ""),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: colorScheme.primary,
                                            width: 2)),
                                    child: Text(
                                      "No Preview",
                                      style: textTheme.bodyLarge,
                                    ),
                                  );
                          },
                        ),
                      );
                    }
                    if (state is HomeSearchLoaded) {
                      return Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 3 / 4,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5),
                          itemBuilder: (context, index) {
                            return state.list[index].images?.original?.url !=
                                    null
                                ? Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: colorScheme.primary,
                                            width: 2)),
                                    child: Image.network(state.list[index]
                                            .images?.original?.url ??
                                        ""),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: colorScheme.primary,
                                            width: 2)),
                                    child: Text(
                                      "No Preview",
                                      style: textTheme.bodyLarge,
                                    ),
                                  );
                          },
                        ),
                      );
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Loading",
                            style: textTheme.displayLarge,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showError(BuildContext context, String label) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          label,
          style: TextStyle(color: Colors.white),
        )));
  }
}
