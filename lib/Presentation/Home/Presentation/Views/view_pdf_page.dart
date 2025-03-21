import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

import '../../../../core/Colors/app_colors.dart';
import '../../../../glopal.dart';

class ViewPdfPage extends StatelessWidget {
  const ViewPdfPage({super.key});

  @override
  Widget build(BuildContext context) {
    int current = 0;
    final StreamController<String> _pageCountController =
        StreamController<String>();
    final Completer<PDFViewController> _pdfViewController =
        Completer<PDFViewController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('THE PDF NAME'),
      ),
      body: PDF(
        enableSwipe: true,
        swipeHorizontal: false,
        defaultPage: current,
        autoSpacing: true,
        pageFling: false,
        fitEachPage: true,
        fitPolicy: FitPolicy.BOTH,
        preventLinkNavigation: true,
        nightMode: Global.storageService.getBoolain(),
        onError: (error) {
          log(error.toString());
        },
        onPageError: (page, error) {
          log('$page: ${error.toString()}');
        },
        onViewCreated: (PDFViewController pdfViewController) async {
          _pdfViewController.complete(pdfViewController);
          final int currentPage = await pdfViewController.getCurrentPage() ?? 0;
          final int? pageCount = await pdfViewController.getPageCount();
          _pageCountController.add('${currentPage + 1} - $pageCount');
        },
        onPageChanged: (page, total) {
          _pageCountController.add('${current + 1} - $total');
          log('page change: $page/$total');
        },
      ).fromAsset('assets/Pdf/AlgorithmsNotesForProfessionals.pdf'),
      floatingActionButton: FutureBuilder<PDFViewController>(
        future: _pdfViewController.future,
        builder: (_, AsyncSnapshot<PDFViewController> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  backgroundColor: AppColors.subBackground.withOpacity(0.4),
                  heroTag: UniqueKey(),
                  child: Icon(Icons.search),
                  onPressed: () async {
                    if (snapshot.hasData && snapshot.data != null) {
                      final PDFViewController pdfViewController =
                          snapshot.data!;
                      final pageCount = await pdfViewController.getPageCount();
                      final currentPage =
                          await pdfViewController.getCurrentPage();
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Page'),
                                    Text('${pageCount! - 1}'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('CurrentPage'),
                                    Text('$currentPage'),
                                  ],
                                ),
                              ],
                            ),
                            actions: [
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.grey,
                                ),
                                child: TextField(
                                  onSubmitted: (value) {
                                    int pageNumber = int.tryParse(value) ?? 1;

                                    if (pageNumber > 0) {
                                      _pdfViewController.future.then(
                                          (PDFViewController pdfController) {
                                        pdfController
                                            .getPageCount()
                                            .then((totalPages) {
                                          pageNumber =
                                              pageNumber.clamp(1, totalPages!);

                                          pdfController.setPage(pageNumber);
                                        });
                                      });
                                      Navigator.pop(context);
                                    } else {
                                      print("Invalid page number");
                                    }
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.numbers),
                                    hintText: 'page number',
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  backgroundColor: AppColors.subBackground.withOpacity(0.4),
                  heroTag: UniqueKey(),
                  child: const Text(
                    '-',
                    style: TextStyle(fontSize: 35),
                  ),
                  onPressed: () async {
                    final PDFViewController pdfController = snapshot.data!;
                    final int currentPage =
                        (await pdfController.getCurrentPage())! - 1;
                    if (currentPage >= 0) {
                      await pdfController.setPage(currentPage);
                    }
                  },
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  backgroundColor: AppColors.subBackground.withOpacity(0.4),
                  heroTag: UniqueKey(),
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 35),
                  ),
                  onPressed: () async {
                    final PDFViewController pdfController = snapshot.data!;
                    final int currentPage =
                        (await pdfController.getCurrentPage())! + 1;
                    final int numberOfPages =
                        await pdfController.getPageCount() ?? 0;
                    if (numberOfPages > currentPage) {
                      await pdfController.setPage(currentPage);
                    }
                  },
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
