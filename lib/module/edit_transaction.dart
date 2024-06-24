import 'package:flutter/material.dart';
import 'package:zoja_test/extension/extension.dart';
import 'package:zoja_test/model/model.dart';
import 'package:zoja_test/model/transaction.dart';
import 'package:zoja_test/route/route.dart';
import 'package:zoja_test/service/service.dart';

class EditTransaction extends StatefulWidget {
  const EditTransaction({super.key, required this.transaction});

  final Transaction transaction;

  @override
  State<EditTransaction> createState() => _EditTransactionState();
}

class _EditTransactionState extends State<EditTransaction> {
  final descriptionController = TextEditingController();
  final amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    descriptionController.text = widget.transaction.description!;
    amountController.text = widget.transaction.amount!.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkResponse(
          onTap: () {
            Navigator.of(context).popAndPushNamed(
                AppRoute.transactionDetailPage,
                arguments: widget.transaction.id!);
          },
          child: const Icon(Icons.arrow_back_rounded),
        ),
        title: const Text("Edit Transaction"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            20.verticalSpace,
            textField(
              context,
              controller: descriptionController,
              onChanged: (text) {},
            ),
            20.verticalSpace,
            textField(
              context,
              controller: amountController,
              keyboardType: TextInputType.number,
              onChanged: (text) {},
            ),
            30.verticalSpace,
            OutlinedButton(
              onPressed: () async {
                await update();
                Navigator.of(context).popAndPushNamed(
                    AppRoute.transactionDetailPage,
                    arguments: widget.transaction.id!);
              },
              child: const Text("Update"),
            )
          ],
        ),
      ),
    );
  }

  Future update() async {
    final t = widget.transaction;
    t.description = descriptionController.text.trim();
    t.amount = amountController.text.getAmountFromController() ?? t.amount;
    await ITransactionService.instance.updateTransaction(transaction: t);
  }

  Widget textField(
    BuildContext context, {
    TextEditingController? controller,
    Function(String)? onChanged,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
      scrollPadding: EdgeInsets.zero,
      keyboardType: keyboardType,
      style: Theme.of(context).textTheme.bodySmall,
      onChanged: onChanged,
      onTapOutside: (_) => FocusScope.of(context).requestFocus(FocusNode()),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        enabledBorder: border(),
        focusedBorder: border(borderColor: Colors.blue),
      ),
    );
  }

  OutlineInputBorder border({
    Color? borderColor,
  }) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor ?? Colors.black,
      ),
    );
  }
}
