import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news_wave/core/utils/app_colors.dart';
import 'package:news_wave/features/home/data/models/new_model.dart';
import 'package:news_wave/features/home/presentation/controller/book_mark_cubit/book_mark_cubit.dart';
import 'package:news_wave/features/home/presentation/controller/book_mark_cubit/book_mark_states.dart';

class NewWidget extends StatefulWidget {
  const NewWidget({super.key, required this.newModel});

  final NewModel newModel;

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookMarkCubit, BookMarkStates>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.03,
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.03),
                child: CachedNetworkImage(
                  imageUrl: widget.newModel.urlToImage ?? "",
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                widget.newModel.title ?? "",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                children: [
                  Text(
                    widget.newModel.sourceModel.name ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  const Icon(Icons.date_range),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Text(
                    convertDate(widget.newModel.publishedAt),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<BookMarkCubit>(context).changeBookMark(
                        widget.newModel,
                      );
                    },
                    icon: widget.newModel.bookMark == false
                        ? const Icon(
                            Icons.bookmark_outline_rounded,
                            color: AppColors.grey,
                          )
                        : const Icon(
                            Icons.bookmark_outlined,
                            color: AppColors.mainColor,
                          ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

String convertDate(dateString) {
  DateTime dateTime = DateTime.parse(dateString);
  String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);
  return formattedDate;
}
