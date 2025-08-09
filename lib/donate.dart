import 'package:flutter/material.dart';

class DonateScreen extends StatefulWidget {
  const DonateScreen({super.key});

  @override
  State<DonateScreen> createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  int selectedAmount = 25;
  final TextEditingController customAmountController = TextEditingController();
  String selectedFrequency = 'One-time';
  String selectedPaymentMethod = 'Credit Card';

  final List<int> quickAmounts = [10, 25, 50, 100, 250, 500];
  final List<String> frequencies = ['One-time', 'Monthly', 'Quarterly', 'Yearly'];
  final List<String> paymentMethods = ['Credit Card', 'PayPal', 'Bank Transfer', 'Apple Pay'];

  final List<Campaign> campaigns = [
    Campaign(
      title: 'Healthcare Reform Initiative',
      description: 'Supporting universal healthcare access for all citizens',
      raised: 45000,
      goal: 75000,
      color: Colors.blue,
      icon: Icons.local_hospital,
    ),
    Campaign(
      title: 'Education Infrastructure',
      description: 'Modernizing schools and educational facilities',
      raised: 28000,
      goal: 50000,
      color: Colors.green,
      icon: Icons.school,
    ),
    Campaign(
      title: 'Climate Action Plan',
      description: 'Environmental protection and green energy initiatives',
      raised: 62000,
      goal: 80000,
      color: Colors.teal,
      icon: Icons.eco,
    ),
    Campaign(
      title: 'Community Development',
      description: 'Local infrastructure and community center improvements',
      raised: 18000,
      goal: 35000,
      color: Colors.orange,
      icon: Icons.home_work,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Make a Donation',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Support our cause and help build a better future',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Total Funds Raised Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green[400]!, Colors.green[600]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.monetization_on,
                      color: Colors.white,
                      size: 40,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Total Funds Raised',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '\$84,250',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '1,247 generous donors',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Active Campaigns
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Active Campaigns',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 15),
                  ...campaigns.map((campaign) => _buildCampaignCard(campaign)),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Quick Donation Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Quick Donation',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Amount Selection
                    const Text(
                      'Select Amount',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: quickAmounts.map((amount) => _buildAmountChip(amount)).toList(),
                    ),

                    const SizedBox(height: 20),

                    // Custom Amount
                    const Text(
                      'Or Enter Custom Amount',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: customAmountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixText: '\$ ',
                        hintText: 'Enter amount',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedAmount = int.tryParse(value) ?? selectedAmount;
                        });
                      },
                    ),

                    const SizedBox(height: 20),

                    // Frequency Selection
                    const Text(
                      'Donation Frequency',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      children: frequencies.map((frequency) => _buildFrequencyChip(frequency)).toList(),
                    ),

                    const SizedBox(height: 20),

                    // Payment Method
                    const Text(
                      'Payment Method',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...paymentMethods.map((method) => _buildPaymentMethodTile(method)),

                    const SizedBox(height: 25),

                    // Donate Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _processDonation,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 3,
                        ),
                        child: Text(
                          'Donate \$${customAmountController.text.isNotEmpty ? customAmountController.text : selectedAmount} $selectedFrequency',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Security Notice
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.security, size: 16, color: Colors.grey[600]),
                        const SizedBox(width: 5),
                        Text(
                          'Secure payment protected by 256-bit SSL',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Tax Deductible Notice
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.amber[50],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.amber[200]!),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info, color: Colors.amber[700], size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Your donation is tax-deductible. You will receive a receipt via email.',
                        style: TextStyle(
                          color: Colors.amber[800],
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildCampaignCard(Campaign campaign) {
    double progress = campaign.raised / campaign.goal;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: campaign.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  campaign.icon,
                  color: campaign.color,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      campaign.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      campaign.description,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          
          // Progress Bar
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${campaign.raised.toStringAsFixed(0)}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: campaign.color,
                    ),
                  ),
                  Text(
                    'Goal: \$${campaign.goal.toStringAsFixed(0)}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(campaign.color),
                minHeight: 6,
              ),
              const SizedBox(height: 5),
              Text(
                '${(progress * 100).toInt()}% funded',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAmountChip(int amount) {
    bool isSelected = selectedAmount == amount && customAmountController.text.isEmpty;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAmount = amount;
          customAmountController.clear();
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[100],
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey[300]!,
          ),
        ),
        child: Text(
          '\$$amount',
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildFrequencyChip(String frequency) {
    bool isSelected = selectedFrequency == frequency;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFrequency = frequency;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey[300]!,
          ),
        ),
        child: Text(
          frequency,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethodTile(String method) {
    bool isSelected = selectedPaymentMethod == method;
    IconData icon;
    switch (method) {
      case 'Credit Card':
        icon = Icons.credit_card;
        break;
      case 'PayPal':
        icon = Icons.account_balance_wallet;
        break;
      case 'Bank Transfer':
        icon = Icons.account_balance;
        break;
      case 'Apple Pay':
        icon = Icons.phone_iphone;
        break;
      default:
        icon = Icons.payment;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        leading: Icon(icon, color: isSelected ? Colors.blue : Colors.grey[600]),
        title: Text(
          method,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            color: isSelected ? Colors.blue : Colors.black87,
          ),
        ),
        trailing: Radio<String>(
          value: method,
          groupValue: selectedPaymentMethod,
          onChanged: (value) {
            setState(() {
              selectedPaymentMethod = value!;
            });
          },
          activeColor: Colors.blue,
        ),
        onTap: () {
          setState(() {
            selectedPaymentMethod = method;
          });
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        tileColor: isSelected ? Colors.blue.withOpacity(0.05) : null,
      ),
    );
  }

  void _processDonation() {
    final amount = customAmountController.text.isNotEmpty 
        ? customAmountController.text 
        : selectedAmount.toString();
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Row(
            children: [
              Icon(Icons.favorite, color: Colors.red, size: 28),
              SizedBox(width: 10),
              Text('Thank You!'),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Your \$$amount $selectedFrequency donation will make a real difference.'),
              const SizedBox(height: 10),
              Text('Payment Method: $selectedPaymentMethod'),
              const SizedBox(height: 15),
              const Text(
                'You will receive a confirmation email shortly with your receipt.',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Reset form
                setState(() {
                  selectedAmount = 25;
                  customAmountController.clear();
                  selectedFrequency = 'One-time';
                  selectedPaymentMethod = 'Credit Card';
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: const Text('Make Another Donation'),
            ),
          ],
        );
      },
    );
  }
}

class Campaign {
  final String title;
  final String description;
  final double raised;
  final double goal;
  final Color color;
  final IconData icon;

  Campaign({
    required this.title,
    required this.description,
    required this.raised,
    required this.goal,
    required this.color,
    required this.icon,
  });
}