import 'package:flutter/material.dart';

import '../../../../config/theme/theme.dart';
import '../../data/models/shipments_model.dart';
import '../../data/repository/shipments_repository.dart';
import '../widgets/shipments_card_widget.dart';

class ShipmentsSearchPage extends StatefulWidget {
  const ShipmentsSearchPage({super.key});

  @override
  State<ShipmentsSearchPage> createState() => _ShipmentsSearchPageState();
}

class _ShipmentsSearchPageState extends State<ShipmentsSearchPage> {
  List<Shipment> filteredShipments = [];

  @override
  void initState() {
    super.initState();
    filteredShipments = List.from(shipments);
  }

  void _filterShipments(String query) {
    setState(() {
      filteredShipments = shipments.where((shipment) {
        return shipment.itemShipped
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            shipment.shipmentNumber
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            shipment.origin.toLowerCase().contains(query.toLowerCase()) ||
            shipment.destination.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff493391),
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            color: const Color(0xff493391),
            padding: const EdgeInsets.only(bottom: 20),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Hero(
              tag: 'search-bar-widget',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.search,
                            color: Colors.grey, // Icon color
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: Material(
                              child: TextField(
                                autofocus: true,
                                onChanged: _filterShipments,
                                decoration: const InputDecoration(
                                    hintText: 'Enter the recipient number ...',
                                    border: InputBorder.none,
                                    labelStyle: AppTextStyles.metaTextStyle),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                                color: Color(0xFFF37A1F),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: const Icon(
                              Icons.adf_scanner_rounded,
                              color: Colors.white, // Icon color
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: _shipmentsListView(),
            ),
          ),
        ],
      ),
    );
  }

  _shipmentsListView() {
    return ListView.builder(
      itemCount: filteredShipments.length,
      itemBuilder: (context, index) {
        final shipment = filteredShipments[index];
        return ShipmentsCardWidget(shipment: shipment);
      },
    );
  }
}
