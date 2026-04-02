import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pet_care_mobile/ui/screens/add_schedule_screen.dart';
import 'package:pet_care_mobile/ui/screens/schedule_detail_screen.dart';
import 'package:pet_care_mobile/features/hospital_history/application/hospital_history_controller.dart';
import 'package:pet_care_mobile/features/vaccine_history/application/vaccine_history_controller.dart';
import 'package:pet_care_mobile/features/medicine_history/application/medicine_history_controller.dart';
import 'package:pet_care_mobile/features/pet_diary/application/pet_diary_controller.dart';
import 'package:pet_care_mobile/features/pets/application/selected_pets_provider.dart';

/// 予定一覧画面
class ScheduleListScreen extends ConsumerStatefulWidget {
  const ScheduleListScreen({super.key});

  @override
  ConsumerState<ScheduleListScreen> createState() => _ScheduleListScreenState();
}

class _ScheduleListScreenState extends ConsumerState<ScheduleListScreen> {
  String _selectedFilter = '全て';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
            Colors.white,
          ],
        ),
      ),
      child: Column(
        children: [
          // ヘッダー
          _buildHeader(context),
          // フィルターチップ
          _buildFilterChips(context),
          // 予定リスト
          Expanded(child: _buildScheduleList(context)),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.event_note_rounded,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                '予定一覧',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          FilledButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddScheduleScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add_rounded, size: 18),
            label: const Text('追加'),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildChip(context, '全て'),
            const SizedBox(width: 8),
            _buildChip(context, '通院'),
            const SizedBox(width: 8),
            _buildChip(context, 'ワクチン'),
            const SizedBox(width: 8),
            _buildChip(context, '服薬'),
            const SizedBox(width: 8),
            _buildChip(context, '日記'),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(BuildContext context, String label) {
    final isSelected = _selectedFilter == label;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (bool value) {
        setState(() {
          _selectedFilter = label;
        });
      },
      backgroundColor: Colors.white,
      selectedColor: Theme.of(context).colorScheme.primaryContainer,
      checkmarkColor: Theme.of(context).colorScheme.primary,
    );
  }

  Widget _buildScheduleList(BuildContext context) {
    final selectedPetId = ref.watch(selectedPetsProvider);
    final hospitalHistories = ref.watch(hospitalHistoryControllerProvider);
    final vaccineHistories = ref.watch(vaccineHistoryControllerProvider);
    final medicineHistories = ref.watch(medicineHistoryControllerProvider);
    final petDiaries = ref.watch(petDiaryControllerProvider);

    // 選択中のペットがない場合
    if (selectedPetId == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.pets_rounded, size: 48, color: Colors.grey.shade300),
            const SizedBox(height: 8),
            Text(
              'ペットを選択してください',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
            ),
          ],
        ),
      );
    }

    return hospitalHistories.when(
      data: (hospitals) {
        return vaccineHistories.when(
          data: (vaccines) {
            return medicineHistories.when(
              data: (medicines) {
                return petDiaries.when(
                  data: (diaries) {
                    // 選択中のペットの予定をフィルタリング
                    final filteredHospitals =
                        hospitals
                            .where((h) => h.petId == selectedPetId)
                            .toList();
                    final filteredVaccines =
                        vaccines
                            .where((v) => v.petId == selectedPetId)
                            .toList();
                    final filteredMedicines =
                        medicines
                            .where((m) => m.petId == selectedPetId)
                            .toList();
                    final filteredDiaries =
                        diaries.where((d) => d.petId == selectedPetId).toList();

                    // すべての予定を日付順に並べる
                    final allSchedules = <Map<String, dynamic>>[];

                    // フィルターに応じて予定を追加
                    if (_selectedFilter == '全て' || _selectedFilter == '通院') {
                      for (final h in filteredHospitals) {
                        allSchedules.add({
                          'type': '通院',
                          'icon': Icons.local_hospital_rounded,
                          'color': Colors.red,
                          'title': h.symptom ?? '通院',
                          'memo': h.memo,
                          'date': h.date,
                          'data': h,
                        });
                      }
                    }
                    if (_selectedFilter == '全て' || _selectedFilter == 'ワクチン') {
                      for (final v in filteredVaccines) {
                        allSchedules.add({
                          'type': 'ワクチン',
                          'icon': Icons.vaccines_rounded,
                          'color': Colors.green,
                          'title': 'ワクチン接種',
                          'memo': v.memo,
                          'date': v.date,
                          'data': v,
                        });
                      }
                    }
                    if (_selectedFilter == '全て' || _selectedFilter == '服薬') {
                      for (final m in filteredMedicines) {
                        allSchedules.add({
                          'type': '服薬',
                          'icon': Icons.medication_rounded,
                          'color': Colors.orange,
                          'title': '服薬',
                          'memo': m.memo,
                          'date': m.date,
                          'data': m,
                        });
                      }
                    }
                    if (_selectedFilter == '全て' || _selectedFilter == '日記') {
                      for (final d in filteredDiaries) {
                        allSchedules.add({
                          'type': '日記',
                          'icon': Icons.edit_note_rounded,
                          'color': Colors.blue,
                          'title': d.title,
                          'memo': d.content,
                          'date': d.date,
                          'data': d,
                        });
                      }
                    }

                    // 日付順にソート（新しい順）
                    allSchedules.sort((a, b) => b['date'].compareTo(a['date']));

                    if (allSchedules.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.event_busy_rounded,
                              size: 64,
                              color: Colors.grey.shade300,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              '予定がありません',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '新しい予定を追加してみましょう',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: allSchedules.length,
                      itemBuilder: (context, index) {
                        final schedule = allSchedules[index];
                        return _buildScheduleCard(
                          context,
                          type: schedule['type'],
                          icon: schedule['icon'],
                          color: schedule['color'],
                          title: schedule['title'],
                          memo: schedule['memo'],
                          date: schedule['date'],
                          data: schedule['data'],
                        );
                      },
                    );
                  },
                  loading:
                      () => const Center(child: CircularProgressIndicator()),
                  error: (e, st) => Center(child: Text('エラー: $e')),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Center(child: Text('エラー: $e')),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, st) => Center(child: Text('エラー: $e')),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('エラー: $e')),
    );
  }

  Widget _buildScheduleCard(
    BuildContext context, {
    required String type,
    required IconData icon,
    required Color color,
    required String title,
    String? memo,
    required DateTime date,
    required dynamic data,
  }) {
    final now = DateTime.now();
    final isPast = date.isBefore(DateTime(now.year, now.month, now.day));
    final isToday =
        date.year == now.year && date.month == now.month && date.day == now.day;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder:
                    (context) => ScheduleDetailScreen(type: type, data: data),
              ),
            );
          },
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isToday ? color : Colors.grey.shade200,
                width: isToday ? 2 : 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
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
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(icon, color: color, size: 24),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: color.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  type,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: color,
                                  ),
                                ),
                              ),
                              if (isToday) ...[
                                const SizedBox(width: 4),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.amber.shade100,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    '今日',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber.shade900,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_rounded,
                      size: 16,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      DateFormat('yyyy年M月d日(E)', 'ja').format(date),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                        fontWeight:
                            isPast ? FontWeight.normal : FontWeight.w500,
                      ),
                    ),
                    if (isPast) ...[
                      const SizedBox(width: 8),
                      Text(
                        '(過去)',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ],
                ),
                if (memo != null && memo.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    memo,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
