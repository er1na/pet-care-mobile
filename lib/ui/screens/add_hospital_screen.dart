import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:pet_care_mobile/features/hospitals/application/hospital_controller.dart';
import 'package:pet_care_mobile/features/hospitals/domain/hospital.dart';

/// 病院登録・編集画面
class AddHospitalScreen extends ConsumerStatefulWidget {
  const AddHospitalScreen({super.key, this.hospital});

  /// 編集時に渡す既存データ。nullのとき新規登録モード
  final Hospital? hospital;

  @override
  ConsumerState<AddHospitalScreen> createState() => _AddHospitalScreenState();
}

class _AddHospitalScreenState extends ConsumerState<AddHospitalScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _telController = TextEditingController();

  bool get _isEditing => widget.hospital != null;

  @override
  void initState() {
    super.initState();
    if (_isEditing) {
      _nameController.text = widget.hospital!.name;
      _addressController.text = widget.hospital!.address;
      _telController.text = widget.hospital!.tel;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _telController.dispose();
    super.dispose();
  }

  Future<void> _saveHospital() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      final now = DateTime.now();

      final hospital = Hospital(
        localId: _isEditing ? widget.hospital!.localId : const Uuid().v4(),
        name: _nameController.text.trim(),
        address: _addressController.text.trim(),
        tel: _telController.text.trim(),
        updatedAt: now,
        deletedAt: null,
        syncState: 0,
      );

      await ref.read(hospitalControllerProvider.notifier).upsert(hospital);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_isEditing ? '病院を更新しました！' : '病院を登録しました！'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${_isEditing ? '更新' : '登録'}に失敗しました: $e'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          _isEditing ? '病院を編集' : '病院を登録',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilledButton(
              onPressed: _saveHospital,
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20),
              ),
              child: const Text('保存'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFormCard(
                context,
                children: [
                  // 病院名
                  _buildSectionTitle('病院名', Icons.local_hospital_rounded),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: '病院名を入力',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return '病院名を入力してください';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  // 住所
                  _buildSectionTitle('住所', Icons.location_on_rounded),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      hintText: '住所を入力',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return '住所を入力してください';
                      }
                      return null;
                    },
                    maxLines: 2,
                  ),
                  const SizedBox(height: 16),
                  // 電話番号
                  _buildSectionTitle('電話番号', Icons.phone_rounded),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _telController,
                    decoration: InputDecoration(
                      hintText: '例: 03-1234-5678',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return '電話番号を入力してください';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormCard(BuildContext context, {required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
          size: 20,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
