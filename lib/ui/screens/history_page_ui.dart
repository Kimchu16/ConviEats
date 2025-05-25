import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:convi_eats/core/models/scanned_product.dart';
import 'package:convi_eats/core/services/scan_history_repository.dart';
import 'package:convi_eats/ui/widgets/product_info_card.dart'; // Make sure the import path is correct

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late Future<List<ScannedProduct>> _scanHistory;

  @override
  void initState() {
    super.initState();
    _loadScanHistory();
  }

  void _loadScanHistory() {
    setState(() {
      _scanHistory = ScanHistoryRepository.getAll();
    });
  }

  String formatDate(DateTime date) {
    return DateFormat('yy.MM.dd').format(date);
  }

  Future<void> _confirmClearHistory() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear History'),
        content: const Text('Are you sure you want to clear your scan history?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Clear'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await ScanHistoryRepository.clear();
      _loadScanHistory();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'History',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.lightGreen,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red.shade300,
        onPressed: _confirmClearHistory,
        tooltip: 'Clear History',
        child: const Icon(
          Icons.delete,
          color: Colors.white70,
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<List<ScannedProduct>>(
          future: _scanHistory,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No scan history found.'));
            }

            final history = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: history.length,
                itemBuilder: (context, index) {
                  final scanned = history[index];
                  final product = scanned.product;
                  return GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => Padding(
                          padding: const EdgeInsets.only(top: 32),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
                            child: Container(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              padding: const EdgeInsets.all(20),
                              child: ProductInfoCard(product: product),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(6),
                              image: product.imageAssetPath.isNotEmpty
                                  ? DecorationImage(
                                image: AssetImage(product.imageAssetPath),
                                fit: BoxFit.cover,
                              )
                                  : null,
                            ),
                            child: product.imageAssetPath.isEmpty
                                ? const Center(
                              child: Text(
                                'Picture',
                                style: TextStyle(fontSize: 10),
                              ),
                            )
                                : null,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.lightGreen[200],
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    'Date scanned at: ${DateFormat('dd.MM.yy').format(scanned.scannedAt)}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
