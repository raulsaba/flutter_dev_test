import 'package:flutter/material.dart';

class CodeComponent extends StatefulWidget {
  const CodeComponent({
    super.key,
  });

  @override
  State<CodeComponent> createState() => _CodeComponentState();
}

class _CodeComponentState extends State<CodeComponent> {
  final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(6, (index) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: TextFormField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              onChanged: (value) {
                if (value.length == 1 && index < 5) {
                  _focusNodes[index + 1].requestFocus();
                } else if (value.isEmpty && index > 0) {
                  _focusNodes[index - 1].requestFocus();
                }
              },
              style: Theme.of(context).textTheme.titleSmall,
              decoration: InputDecoration(
                counterText: "",
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: Color(0xffE7E7EF),
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: Color(0xFFD36161),
                    width: 2,
                  ),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: Color(0xFFD36161),
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
