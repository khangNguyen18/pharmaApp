class VoucherModel {
  final String id;
  final String name;
  final String code;
  final int discountPercentage;
  final int discountAmount;
  final String startDate;
  final String endDate;
  final int minOrderAmount;
  final int maxUsage;
  final int usageCount;
  VoucherModel(
      {required this.id,
      required this.name,
      required this.code,
      required this.discountPercentage,
      required this.discountAmount,
      required this.startDate,
      required this.endDate,
      required this.minOrderAmount,
      required this.maxUsage,
      required this.usageCount});
}
