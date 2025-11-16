import 'package:assetwize/core/constants/app_colors.dart';
import 'package:assetwize/data/models/insurance_model.dart';
import 'package:assetwize/services/firestore_services.dart';
import 'package:flutter/material.dart';

class AddInsurancePage extends StatefulWidget {
  const AddInsurancePage({super.key});

  @override
  State<AddInsurancePage> createState() => _AddInsurancePageState();
}

class _AddInsurancePageState extends State<AddInsurancePage> {
  final nameCtrl = TextEditingController();
  final descCtrl = TextEditingController();
  final companyCtrl = TextEditingController();
  final imgCtrl = TextEditingController();
  final policyCtrl = TextEditingController();

  final service = FirestoreServices();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text(
          "Add Insurance",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: bordercolor, height: 1),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: width > 600 ? width * 0.2 : 16,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _label("Insurance Name"),
            _inputField(controller: nameCtrl, hint: "Enter insurance title"),

            _label("Company"),
            _inputField(controller: companyCtrl, hint: "Enter company name"),

            _label("Policy ID"),
            _inputField(controller: policyCtrl, hint: "Enter policy id"),

            _label("Description"),
            _inputField(
              controller: descCtrl,
              hint: "Enter description",
              maxLines: 3,
            ),

            _label("Image URL"),
            _inputField(controller: imgCtrl, hint: "Paste image URL here"),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (nameCtrl.text.isEmpty ||
                      companyCtrl.text.isEmpty ||
                      policyCtrl.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please fill all fields")),
                    );
                    return;
                  }

                  final model = InsuranceModel(
                    id: policyCtrl.text,
                    title: nameCtrl.text,
                    company: companyCtrl.text,
                    detail: descCtrl.text,
                    imageUrl: imgCtrl.text,
                  );

                  await service.addInsurance(model);

                  Navigator.pop(context, true);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Save Insurance",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) => Padding(
    padding: const EdgeInsets.only(top: 12, bottom: 6),
    child: Text(
      text,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
    ),
  );

  Widget _inputField({
    required TextEditingController controller,
    required String hint,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
