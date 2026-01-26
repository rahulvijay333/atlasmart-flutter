import 'package:atlasmart/application/admin/add_admin/add_admins_bloc.dart';
import 'package:atlasmart/domain/admin/profile/model/admin_profile.dart';
import 'package:atlasmart/domain/core/constants/font.dart';
import 'package:atlasmart/presentation/common/button_widget.dart';
import 'package:atlasmart/presentation/common/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/core/constants/strings.dart';

class ScreenAddAdmin extends StatefulWidget {
  const ScreenAddAdmin({super.key});

  @override
  State<ScreenAddAdmin> createState() => _ScreenAddAdminState();
}

class _ScreenAddAdminState extends State<ScreenAddAdmin> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  // Controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _selectedRole = AppStrings.roleEditor;

  final List<String> _roles = [
    AppStrings.roleSuperAdmin,
    AppStrings.roleEditor,
    AppStrings.roleModerator,
  ];

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Mock API call
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text(AppStrings.adminCreatedSuccess)),
        );
        Navigator.pop(context);
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.addNewAdmin)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.createAdminAccount,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                AppStrings.createAdminSubtitle,
                style: TextStyle(color: Colors.grey[600]),
              ),
              const SizedBox(height: 32),

              // Name Field
              TextFormField(
                controller: _nameController,
                textCapitalization: TextCapitalization.sentences,
                maxLength: 100,
                buildCounter:
                    (
                      context, {
                      required currentLength,
                      required isFocused,
                      required maxLength,
                    }) => null,
                decoration: const InputDecoration(
                  labelText: AppStrings.fullName,
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_outline),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.enterNameError;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Email Field
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: AppStrings.email,
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.enterEmailError;
                  }
                  if (!value.contains('@')) {
                    return AppStrings.enterValidEmailError;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Password Field
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: AppStrings.password,
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock_outline),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.enterPasswordError;
                  }
                  if (value.length < 6) {
                    return AppStrings.passwordLengthError;
                  }
                  return null;
                },
              ),
              // const SizedBox(height: 16),

              // // Role Dropdown
              // DropdownButtonFormField<String>(
              //   initialValue: _selectedRole,
              //   decoration: const InputDecoration(
              //     labelText: AppStrings.role,
              //     border: OutlineInputBorder(),
              //     prefixIcon: Icon(Icons.admin_panel_settings_outlined),
              //   ),
              //   items: _roles.map((role) {
              //     return DropdownMenuItem(value: role, child: Text(role));
              //   }).toList(),
              //   onChanged: (value) {
              //     setState(() {
              //       _selectedRole = value!;
              //     });
              //   },
              // ),
              const SizedBox(height: 32),

              // Submit Button
              BlocConsumer<AddAdminBloc, AddAdminsState>(
                listener: (context, state) {
                  state.whenOrNull(
                    success: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              'Success',
                              style: AppFont.subHeading16BoldStyle,
                              textAlign: TextAlign.center,
                            ),
                            content: Text(
                              'Admin added successfully',
                              style: AppFont.title14Style,
                              textAlign: TextAlign.center,
                            ),
                            actions: [
                              Center(
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },

                    failure: (message) {
                      AppSnackBar.show(context, message);
                    },
                  );
                },
                builder: (context, state) {
                  return ButtonWidget(
                    isloading: state == AddAdminsState.loading() ? true : false,
                    title: AppStrings.createAdminButton,
                    height: 50,
                    ontap: state != AddAdminsState.loading()
                        ? () {
                            if (_formKey.currentState!.validate()) {
                              final data =
                                  AdminUserModel(
                                    userName: _nameController.text.trim(),
                                    userEmail: _emailController.text.trim(),
                                    joinedDate: null,
                                  ).copyWith(
                                    password: _passwordController.text.trim(),
                                  );

                              BlocProvider.of<AddAdminBloc>(
                                context,
                              ).add(AddAdminsEvent.addNewAdmin(data));
                            }
                          }
                        : () {},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
