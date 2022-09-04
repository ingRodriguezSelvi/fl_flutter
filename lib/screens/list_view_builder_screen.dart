import 'package:fl_app/themes/app_theme.dart';
import 'package:flutter/material.dart';

class ListViewBuilderScreen extends StatefulWidget {

  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  final List<int> imageIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      print('${_scrollController.position.pixels} ${_scrollController.position.maxScrollExtent}');
      if (_scrollController.position.pixels + 500 >= _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  Future fetchData() async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 3));
    addTenImages();
    setState(() {
      _isLoading = false;
    });
  }

  void addTenImages() {
    final lastId = imageIds.last;
    imageIds.addAll([lastId + 1, lastId + 2, lastId + 3, lastId + 4, lastId + 5, lastId + 6, lastId + 7, lastId + 8, lastId + 9, lastId + 10]);
    setState(() {});
    if (_scrollController.position.pixels + 100 >= _scrollController.position.maxScrollExtent) {
      _scrollController.animateTo(
          _scrollController.position.pixels + 120,
          duration: const Duration(milliseconds: 250),
          curve: Curves.fastOutSlowIn);
    }
  }
  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 3));
    final lastId = imageIds.last;
    imageIds.clear();
    imageIds.add(lastId + 1);
    addTenImages();

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(
          children: [
            RefreshIndicator(
              color: AppTheme.primaryColor,
              onRefresh: onRefresh,
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: imageIds.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FadeInImage(
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                      placeholder: const AssetImage('assets/img/loading_pets.gif'),
                      image: NetworkImage('https://picsum.photos/500/300?random=${imageIds[index] + 1}')
                    );
                  }
              ),
            ),
            if (_isLoading)
              Positioned(
                 bottom: 10.0,
                 left: size.width / 2 - 30.0,
                 child:const _LoadingIcon(),)
          ],
        ),
      )
    );
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      alignment: AlignmentDirectional.center,
      height: 60.0,
      width: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: const CircularProgressIndicator( color: AppTheme.primaryColor,),
    );
  }
}
