import 'package:flutter/material.dart';

class DPaginatedDataTable extends StatelessWidget {
  final List<String> headers;
  final int itemCount;
  final List<Widget> Function(int index) valueBuilder;
  final void Function(int index) onRowSelect;
  final void Function(int index) onEditTapped;
  final void Function(int index) onDeleteTapped;
  const DPaginatedDataTable({Key? key, required this.headers, required this.itemCount, required this.valueBuilder, required this.onRowSelect, required this.onEditTapped, required this.onDeleteTapped,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: PaginatedDataTable(
        columns: headers.map<DataColumn>((header) => DataColumn(label: Text(header))).toList()..add(const DataColumn(label: Text('Actions'))),
        source: _MyTableDataSource(
          itemCount: itemCount,
          dataRowBuilder: (index) {
            return DataRow(
              onSelectChanged: (value){
                onRowSelect(index);
              },
              cells: headers.map<DataCell>((e) {
                final int _headerIndex = headers.indexOf(e);
                return DataCell(valueBuilder(index)[_headerIndex]);
                }
              ).toList()..add(DataCell(_buildActionButtons(index))),
            );
          },
        ),
        rowsPerPage: 10,
        initialFirstRowIndex: 0,
        onPageChanged: (page){
          if(page >= itemCount){
            return;
          }
        },
        showCheckboxColumn: false,
      ),
    );
  }

  Widget _buildActionButtons(int index){
    return Row(
      children: [
        IconButton(onPressed: (){
          onEditTapped(index);
        }, icon: const Icon(Icons.edit)),
        IconButton(onPressed: (){
          onDeleteTapped(index);
        }, icon: const Icon(Icons.delete)),
      ],
    );
  }
}


class _MyTableDataSource extends DataTableSource{
  final int itemCount;
  final DataRow Function(int index) dataRowBuilder;
  _MyTableDataSource({required this.itemCount, required this.dataRowBuilder});

  @override
  DataRow? getRow(int index) {
    return dataRowBuilder(index);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => itemCount;

  @override
  int get selectedRowCount => 0;
}