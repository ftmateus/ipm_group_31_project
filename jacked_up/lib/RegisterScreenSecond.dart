
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jacked_up/SignInScreen.dart';

class RegisterScreenSecond extends StatefulWidget {
  const RegisterScreenSecond({super.key, required this.userInfo});

  final UserInfo userInfo;

  @override
  State<RegisterScreenSecond> createState() => _RegisterScreenSecondState();
}

class _RegisterScreenSecondState extends State<RegisterScreenSecond> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();

  Gender? _gender = Gender.male;

  var dateTime = DateTime.now();

  birthdayPicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Date of Birth:', style: TextStyle(fontSize: 18),),
        const SizedBox(width: 15),
        TextButton.icon(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            textStyle: const TextStyle(fontSize: 18),
            side: const BorderSide(
              color: Colors.black45,
            ),
          ),
          onPressed: () async {
            DateTime? newDate = await showDatePicker(
                context: context,
                initialDate: dateTime,
                firstDate: DateTime(1900),
                lastDate: DateTime(2030));
            if (newDate == null) return;
            dateTime = newDate;
            setState(() => dateTime = newDate);
          },
          label: Text(
              '${dateTime.day}/${dateTime.month}/${dateTime.year}'),
          icon: const Icon(Icons.calendar_month),
        ),
      ],
    );
  }

  heightField() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Enter your height',
        labelText: 'Height(Cm)',
        icon: Icon(Icons.straighten),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d{0,2})'))],
      controller: _height,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your height';
        }
        return null;
      },
    );
  }

  weightField() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Enter your weight',
        labelText: 'Weight(Kg)',
        icon: Icon(Icons.monitor_weight),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d{0,2})'))],
      controller: _weight,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your weight';
        }
        return null;
      },
    );
  }

  genderRadioButtons(){
    return Row(
      children:[
        Radio<Gender>(
            value: Gender.male,
            groupValue: _gender,
            onChanged: (Gender? value) {
              setState(() {
                _gender = value;
              });
            },
          ),
        const Text('Male', style: TextStyle(fontSize: 18)),
        Radio<Gender>(
          value: Gender.female,
          groupValue: _gender,
          onChanged: (Gender? value) {
            setState(() {
              _gender = value;
            });
          },
        ),
        const Text('Female', style: TextStyle(fontSize: 18)),
        Radio<Gender>(
          value: Gender.other,
          groupValue: _gender,
          onChanged: (Gender? value) {
            setState(() {
              _gender = value;
            });
          },
        ),
        const Text('Other', style: TextStyle(fontSize: 18))
      ],
    );
  }

  signInButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              minimumSize: const Size(130, 10),
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                var oldInfo = widget.userInfo;
                var newInfo = UserInfo(oldInfo.email, oldInfo.username,
                    oldInfo.password, dateTime, _gender, int.parse(_height.text),
                    double.parse(_weight.text));
                    Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) =>
                        SignInScreen(userInfo: newInfo)), (route) => false);
              }
            },
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
        body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Expanded(
                    child: Image(
                        image: AssetImage('assets/images/jackedUp.png'),
                        fit: BoxFit.cover,
                        width: double.infinity)),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        birthdayPicker(),
                        genderRadioButtons(),
                        heightField(),
                        weightField(),
                        const SizedBox(height: 20),
                        signInButton(),
                        const SizedBox(height: 20)
                      ],
                    ),
                  ),
                ),

              ],
            )));
  }
}
