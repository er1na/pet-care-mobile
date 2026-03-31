import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:pet_care_mobile/features/vaccines/application/vaccine_controller.dart';
import 'package:pet_care_mobile/features/vaccines/domain/vaccine.dart';

/// ワクチン登録・編集画面
class AddVaccineScreen extends ConsumerStatefulWidget {
  const AddVaccineScreen({super.key, this.vaccine});

  /// 編集時に渡す既存データ。nullのとき新規登録モード
  final Vaccine? vaccine;

  @override
  ConsumerState<AddVaccineScreen> createState() => _AddVaccineScreenState();
}

class _AddVaccineScreenState extends ConsumerState<AddVaccineScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _memoController = TextEditingController();

  bool get _isEditing => widget.vaccine != null;

  @override
  void initState() {
    super.initState();
    if (_isEditing) {
      _nameController.text = widget.vaccine!.name;
      _memoController.text = widget.vaccine!.memo ?? '';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _memoController.dispose();
    super.dispose();
  }

  Future<void> _saveVaccine() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      final now = DateTime.now();

      final vaccine = Vaccine(
        localId: _isEditing ? widget.vaccine!.localId : const Uuid().v4(),
        name: _nameController.text.trim(),
        memo: _memoController.text.trim().isNotEmpty
            ? _memoController.text.trim()
            : null,
        updatedAt: now,
        deletedAt: null,
        syncState: 0,
      );

      await ref.read(vaccineControllerProvider.notifier).upsert(vaccine);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_isEditing ? 'ワクチンを更新しました！' : 'ワクチンを登録しました！'),
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
          _isEditing ? 'ワクチンを編集' : 'ワクチンを登録',
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
              onPressed: _saveVaccine,
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
                  // ワクチン名
                  _buildSectionTitle('ワクチン名', Icons.vaccines_rounded),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: '例: 狂犬病ワクチン、混合ワクチン',
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
                        return 'ワクチン名を入力してください';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  // メモ
                  _buildSectionTitle('メモ', Icons.note_rounded),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _memoController,
                    decoration: InputDecoration(
                      hintText: '例: 年1回接種、接種間隔など（任意）',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    maxLines: 3,
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
