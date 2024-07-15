import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../models/projectModel.dart';
import '../../../controllers/projectController.dart';

import '../../../widgets/application_app_bar.dart';
import 'package:get/get.dart';
import '../../../widgets/paginated_table_cell.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';


class ProjectTableScreen extends StatefulWidget {
  const ProjectTableScreen({super.key});

  @override
  State<ProjectTableScreen> createState() => _ProjectTableScreenState();
}

class _ProjectTableScreenState extends State<ProjectTableScreen> {
final projectController = Get.find<ProjectController>();

  static const _pageSize = 10;

  final PagingController<int, ProjectModel> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int offset) async {
    try {
      final newItems =
          await projectController.fetchList(offset: offset, limit: _pageSize);
      final isLastPage = newItems.rows.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems.rows);
      } else {
        final nextOffset = offset + newItems.rows.length;
        _pagingController.appendPage(newItems.rows, nextOffset);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationAppBar(context: context,
      appBarTitle: 'Project',
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          tooltip: 'Add',
          onPressed: () async {
            await Get.toNamed('/projectForm');
            _pagingController.refresh();
          },
        )
      ],),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/background.png'),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      PaginatedTableCell(
                        text: "Action",
                        width: 100,
                        fontSize: 20,
                        textColor: Colors.black,
                        bgColor: Colors.white,
                      ),
              PaginatedTableCell(
                        text: "Project",
                        width: 250,
                        fontSize: 20,
                        textColor: Colors.black,
                        bgColor: Colors.white,
                      ),
                      
                    ],
                  ),
                  Container(
                    height: 0.8.sh,
                    width:  100+(250*2),
                    child: PagedListView<int, ProjectModel>(
                      shrinkWrap: false,
                      scrollDirection: Axis.vertical,
                      // physics: NeverScrollableScrollPhysics(),
                      pagingController: _pagingController,
                      builderDelegate: PagedChildBuilderDelegate<ProjectModel>(
                          noItemsFoundIndicatorBuilder: (context) => Container(
                                height: 0.8.sh,
                                width: 1.sw,
                                alignment: Alignment.center,
                                child: Text(
                                  'No data',
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ),
                          itemBuilder: (context, item, index) => Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                 GestureDetector(
                                  onTap: () async {
                                    await Get.toNamed('/projectForm', arguments: {"id": item.id ?? ""});
                                    _pagingController.refresh();
                                  },
                                  child:PaginatedTableCell(
                                    text: "Edit",
                                    width: 100,
                                    fontSize: 16,
                                    textColor: Colors.white,
                                    bgColor: Colors.transparent,
                                  ),
                                ),
         
         
            PaginatedTableCell(
                                    text: "${item.project }",
                                    width: 250,
                                    fontSize: 18,
                                    textColor: Colors.white,
                                    bgColor: Colors.transparent,
                                  ),
                                  
                                 
                                ],
                              )),
                      //  ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

      
      
      
