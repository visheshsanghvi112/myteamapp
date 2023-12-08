import 'package:flutter/material.dart';

class EventSignUpPage extends StatefulWidget {
  final String eventName; // Pass the event name to display on the signup page

  EventSignUpPage({required this.eventName});

  @override
  _EventSignUpPageState createState() => _EventSignUpPageState();
}

class _EventSignUpPageState extends State<EventSignUpPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _classController = TextEditingController();
  TextEditingController _rollNumberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  String _selectedSport = 'Cricket'; // Default sport selection

  List<String> sports = ['Cricket', 'Football', 'Basketball', 'Tennis', 'Kabaddi', 'Chess', 'Carrom'];

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Sign-Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign up for ${widget.eventName}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: _selectedSport,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedSport = newValue!;
                      });
                    },
                    items: sports
                        .map<DropdownMenuItem<String>>(
                          (String sport) => DropdownMenuItem<String>(
                        value: sport,
                        child: Row(
                          children: [
                            Icon(
                              getSportIcon(sport),
                              color: Colors.blue,
                            ),
                            SizedBox(width: 10),
                            Text(sport),
                          ],
                        ),
                      ),
                    )
                        .toList(),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                _buildTextFormField(
                  controller: _nameController,
                  labelText: 'Your Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                _buildTextFormField(
                  controller: _rollNumberController,
                  labelText: 'Your Roll Number',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your roll number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                _buildTextFormField(
                  controller: _emailController,
                  labelText: 'Your Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // You can add more validation for email format if needed
                    return null;
                  },
                ),
                SizedBox(height: 16),
                _buildTextFormField(
                  controller: _phoneController,
                  labelText: 'Your Phone Number',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    // You can add more validation for phone number format if needed
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 16),
                _buildTextFormField(
                  controller: _addressController,
                  labelText: 'Your Address',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                _buildTextFormField(
                  controller: _classController,
                  labelText: 'Your Class',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your class';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _performSignUp();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    required String? Function(String?) validator,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
    );
  }

  void _performSignUp() {
    if (_formKey.currentState!.validate()) {
      String userName = _nameController.text;
      String userRollNumber = _rollNumberController.text;
      String userEmail = _emailController.text;
      String userPhone = _phoneController.text;
      String userAddress = _addressController.text;
      String userClass = _classController.text;
      String selectedSport = _selectedSport;

      // Implement your signup logic here
      print('Name: $userName\nRoll Number: $userRollNumber\nEmail: $userEmail\nPhone: $userPhone\nAddress: $userAddress\nClass: $userClass\nSport: $selectedSport');

      // Display success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Sign-up successful!'),
          duration: Duration(seconds: 2),
        ),
      );

      // After successful signup, navigate back to the DashboardPage
      Navigator.pop(context);
    }
  }

  IconData getSportIcon(String sport) {
    switch (sport) {
      case 'Cricket':
        return Icons.sports_cricket;
      case 'Football':
        return Icons.sports_soccer;
      case 'Basketball':
        return Icons.sports_basketball;
      case 'Tennis':
        return Icons.sports_tennis;
      case 'Kabaddi':
        return Icons.sports_kabaddi;
      case 'Chess':
        return Icons.gamepad; // Using gamepad icon for Chess
      case 'Carrom':
        return Icons.sports_handball; // Using handball icon for Carrom as there is no specific Carrom icon
      default:
        return Icons.sports;
    }
  }
}
