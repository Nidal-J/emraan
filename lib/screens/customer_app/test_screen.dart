import 'package:emraan/core/constants/constants_manager.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.all(20),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: ConstantsManager.customBoxShadow10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.purple,
              padding: const EdgeInsets.fromLTRB(50, 10, 20, 10),
              child: Row(
                children: const [
                  Expanded(
                    child: Text(
                      'رقم المساق',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        'اسم المساق',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'الدرجة',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    height: 0,
                    thickness: 1,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    childrenPadding: EdgeInsets.zero,
                    title: Row(
                      children: const [
                        Expanded(
                          child: Text(
                            '123123123',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'أمن المعلومات والأنظمة',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Expanded(
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            child: Text(
                              '99',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                    children: [
                      DataTable(
                        columnSpacing: 10,
                        dataTextStyle:
                            const TextStyle(fontSize: 14, color: Colors.black),
                        columns: const [
                          DataColumn(label: Text('النصفي')),
                          DataColumn(label: Text('الأعمال')),
                          DataColumn(label: Text('النهائي')),
                          DataColumn(label: Text('النهائي')),
                          DataColumn(label: Text('النهائي')),
                        ],
                        rows: const [
                          DataRow(
                            cells: [
                              DataCell(Text('20')),
                              DataCell(Text('20')),
                              DataCell(Text('20')),
                              DataCell(Text('20')),
                              DataCell(Text('20')),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
