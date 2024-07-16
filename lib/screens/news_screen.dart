import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_summer_7_newsapp/data/cubits/get_news_cubit/get_news_cubit.dart';
import 'package:iti_summer_7_newsapp/data/cubits/get_news_cubit/get_news_state.dart';
import 'package:iti_summer_7_newsapp/data/models/get_news_model.dart';
import 'package:iti_summer_7_newsapp/data/repositories/get_news_repo.dart';
import 'package:iti_summer_7_newsapp/widgets/news_card.dart';
import 'package:iti_summer_7_newsapp/widgets/search_noti_widget.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  GetNewsModel? reponse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 60, left: 18, right: 18),
        child: Column(
          children: [
            // first component (search & notification)
            SearchAndNotiWidget(),
            // second component (see more)
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  Text('Latest News'),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          'See More',
                          style: TextStyle(color: Color(0xff0080FF)),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Color(0xff0080FF),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )

            // third component (news list)
            ,
            BlocBuilder<GetNewsCubit, GetNewsState>(
              builder: (context, state) {
                if (state is GetNewsInitial) {
                  return Center(
                    child: Text('please click the button to get news'),
                  );
                } else if (state is GetNewsLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GetNewsSuccess) {
                  return SizedBox(
                    height: 240,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.responseModel.articles.length,
                      itemBuilder: (context, index) => NewsCard(
                        article: state.responseModel.articles[index],
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: Text('Something went wrong'),
                  );
                }
              },
            ),
            SizedBox(
              height: 100,
            ),

            // Text(
            //     'Total result is :  ${reponse?.totalResults == null ? '...' : reponse!.totalResults}'),

            ElevatedButton(
                onPressed: () async {
                  context.read<GetNewsCubit>().getNews();
                },
                child: Text('Get New'))

            // third component (news list) using stack

            // SizedBox(
            //   height: 20,
            // ),
            // Container(
            //     height: 240,
            //     width: 321,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(16),
            //         color: Colors.black),
            //     child: Stack(
            //       children: [
            //         Positioned.fill(
            //           child: ClipRRect(
            //             borderRadius: BorderRadius.circular(16),
            //             child: Image.asset(
            //               'assets/images/new_background.png',
            //               fit: BoxFit.cover,
            //             ),
            //           ),
            //         ),
            //         Positioned.fill(
            //             child: Container(
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(16),
            //             gradient: LinearGradient(
            //               begin: Alignment.topCenter,
            //               end: Alignment.bottomCenter,
            //               colors: [
            //                 Color(0xff62626259).withOpacity(0.05),
            //                 Colors.black
            //               ],
            //             ),
            //           ),
            //         )),
            //         Padding(
            //           padding: const EdgeInsets.symmetric(
            //               horizontal: 16, vertical: 8),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             // mainAxisAlignment: MainAxisAlignment.end,
            //             children: [
            //               SizedBox(
            //                 height: 80,
            //               ),
            //               Text(
            //                 'by Ryan Browne',
            //                 style: TextStyle(
            //                     color: Colors.white,
            //                     fontWeight: FontWeight.bold,
            //                     fontSize: 10),
            //               ),
            //               Text(
            //                 'Crypto investors should be prepared to lose all their mnvestors should be prepared to lose all their mnvestors should be prepared to lose all their mnvestors should be prepared to lose all their mnvestors should be prepared to lose all their mnvestors should be prepared to lose all their mnvestors should be prepared to lose all their money, BOE governor says',
            //                 style: TextStyle(
            //                     color: Colors.white,
            //                     fontSize: 16,
            //                     fontWeight: FontWeight.bold),
            //                 overflow: TextOverflow.ellipsis,
            //                 maxLines: 3,
            //               ),
            //               SizedBox(
            //                 height: 23,
            //               ),
            //               Text(
            //                 '“I’m going to say this very bluntly again,” he added. “Buy them only if you’re prepared to lose all your money.”',
            //                 style: TextStyle(color: Colors.white, fontSize: 10),
            //                 overflow: TextOverflow.ellipsis,
            //                 maxLines: 2,
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ))
          ],
        ),
      ),
    );
  }
}
