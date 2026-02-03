part of "../../screens/products_screen.dart";

class ProductDialog extends StatelessWidget {
  final ProductEntity product;
  final BuildContext cubitContext;
  const ProductDialog({
    super.key,
    required this.constraints,
    required this.product,
    required this.cubitContext,
  });

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 219,
        height: 174,
        decoration: ShapeDecoration(
          color: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                cubitContext.read<ProductsListCubit>().deleteProduct(
                  product.id,
                );
              },
              child: Text(
                "حذف المنتج",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: (constraints.maxWidth / 390) * 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(width: 180, height: 1, color: AppColors.cardBorder),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "جعل المنتج غير متوفر",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: (constraints.maxWidth / 390) * 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(width: 180, height: 1, color: AppColors.cardBorder),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: cubitContext.read<ProductsListCubit>(),
                      child: AddProductScreen(product: product),
                    ),
                  ),
                );
              },
              child: Text(
                "تعديل معلومات المنتج",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: (constraints.maxWidth / 390) * 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
