import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pharma_app/components/text_component.dart';
import 'package:pharma_app/models/voucher_model.dart';
import 'package:ticket_clippers/ticket_clippers.dart';

class DiscountCard extends StatefulWidget {
  final VoucherModel voucher;
  final bool apply;
  const DiscountCard({super.key, required this.voucher, required this.apply});

  @override
  State<DiscountCard> createState() => _DiscountCardState();
}

class _DiscountCardState extends State<DiscountCard> {
  bool _isRadioSelected = true;
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.89,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: ClipPath(
          clipper: RoundedEdgeClipper(
            edge: Edge.left,
            points: 10,
          ),
          child: Container(
            height: 150,
            width: 450,
            color: Color.fromARGB(255, 236, 236, 236),
            child: Opacity(
              opacity: widget.apply ? 0.5 : 1.0,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: primaryColor,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            offset: Offset(0.0, 1.0),
                          ),
                        ],
                      ),
                      child: Image(
                        image: AssetImage(
                          'assets/images/clipperticket.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 236, 236, 236),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextComponent(
                                      text:
                                          '"${widget.voucher.code}" Giảm ${widget.voucher.discountPercentage > 0 ? '${widget.voucher.discountPercentage}%' : '${widget.voucher.discountAmount}k'} cho đơn hàng Online ${widget.voucher.minOrderAmount > 0 ? 'từ ${widget.voucher.minOrderAmount < 1000000 ? '${(widget.voucher.minOrderAmount / 1000).toInt().toStringAsFixed(0)}k' : '${(widget.voucher.minOrderAmount / 1000000).toInt().toStringAsFixed(0)} triệu'}' : ''}',
                                      size: 25,
                                      weight: FontWeight.bold,
                                    ),
                                    TextComponent(
                                      text:
                                          'Trị giá ${widget.voucher.discountPercentage > 0 ? '${widget.voucher.discountPercentage}%' : '${widget.voucher.discountAmount}k'} cho đơn hàng',
                                      size: 18,
                                      weight: FontWeight.bold,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextComponent(
                                            text:
                                                'HSD ${DateFormat('HH:mm:ss dd/MM/yyyy').format(DateTime.parse(widget.voucher.endDate))}'),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
