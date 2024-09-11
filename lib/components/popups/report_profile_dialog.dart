import 'package:flutter/material.dart';

class ReportDialog extends StatefulWidget {
  final Function(String) reportProfile; // Function to report a profile

  const ReportDialog({Key? key, required this.reportProfile}) : super(key: key);

  @override
  State<ReportDialog> createState() => _ReportDialogState();
}

class _ReportDialogState extends State<ReportDialog> {
  // List of report reasons
  final List<String> _reportOptions = [
    'Spam',
    'Inappropriate content',
    'Harassment',
    'Fake profile',
    'Other'
  ];

  String? _selectedOption; // Track selected option
  bool _isSubmitting = false; // For loading state

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Please select a reason for reporting this profile:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              // List of radio buttons for report options
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _reportOptions.length,
                  itemBuilder: (context, index) {
                    return RadioListTile<String>(
                      title: Text(_reportOptions[index]),
                      value: _reportOptions[index],
                      groupValue: _selectedOption,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedOption = value;
                        });
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _selectedOption == null
                    ? null
                    : widget.reportProfile(_selectedOption!),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      );
    });
  }
}
