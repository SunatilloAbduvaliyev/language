import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWordTable extends StatelessWidget {
  const LoadingWordTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Table(
        border: TableBorder.all(),
        children: [
          TableRow(children: _buildShimmerHeaderRow()),
          ...List.generate(
            10, // 5 qatorni shimerlash uchun, siz bu sonni o'zgartirishingiz mumkin
                (int index) => TableRow(
              children: _buildShimmerRow(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildShimmerHeaderRow() {
    return [
      _buildShimmerCell(),
      _buildShimmerCell(),
      _buildShimmerCell(),
    ];
  }

  List<Widget> _buildShimmerRow() {
    return [
      _buildShimmerCell(),
      _buildShimmerCell(),
      _buildShimmerCell(),
    ];
  }

  Widget _buildShimmerCell() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 30.0,
        color: Colors.white,
      ),
    );
  }
}
