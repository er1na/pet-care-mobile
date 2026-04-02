import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:pet_care_mobile/ui/screens/add_schedule_screen.dart';
import 'package:pet_care_mobile/ui/screens/schedule_detail_screen.dart';
import 'package:pet_care_mobile/features/hospital_history/application/hospital_history_controller.dart';
import 'package:pet_care_mobile/features/vaccine_history/application/vaccine_history_controller.dart';
import 'package:pet_care_mobile/features/medicine_history/application/medicine_history_controller.dart';
import 'package:pet_care_mobile/features/pet_diary/application/pet_diary_controller.dart';
import 'package:pet_care_mobile/features/pets/application/selected_pets_provider.dart';

class CalendarScreen extends ConsumerStatefulWidget {
  const CalendarScreen({super.key});

  @override
  ConsumerState<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends ConsumerState<CalendarScreen> {
  late final ValueNotifier<DateTime> _focusedDay;
  late final ValueNotifier<DateTime?> _selectedDay;
  final CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  void initState() {
    super.initState();
    final today = DateTime.now();
    _focusedDay = ValueNotifier(today);
    _selectedDay = ValueNotifier(today);
  }

  @override
  void dispose() {
    _focusedDay.dispose();
    _selectedDay.dispose();
    super.dispose();
  }

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
          // 月表示とナビゲーション
          _buildMonthHeader(),
          // カレンダー本体
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: _buildCalendar(),
          ),
          // イベント一覧エリア
          Expanded(child: _buildEventList()),
        ],
      ),
    );
  }

  // 月表示ヘッダー
  Widget _buildMonthHeader() {
    return ValueListenableBuilder<DateTime>(
      valueListenable: _focusedDay,
      builder: (context, focusedDay, _) {
        final now = DateTime.now();
        final isCurrentMonth =
            focusedDay.year == now.year && focusedDay.month == now.month;

        return Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
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
              // 前月ボタン
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.chevron_left_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () {
                    _focusedDay.value = DateTime(
                      focusedDay.year,
                      focusedDay.month - 1,
                    );
                  },
                ),
              ),
              // 年月表示
              Column(
                children: [
                  Text(
                    DateFormat('yyyy年 M月', 'ja').format(focusedDay),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  if (isCurrentMonth)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '今月',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                ],
              ),
              // 次月ボタン
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.chevron_right_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () {
                    _focusedDay.value = DateTime(
                      focusedDay.year,
                      focusedDay.month + 1,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // カレンダー本体
  Widget _buildCalendar() {
    return ValueListenableBuilder<DateTime>(
      valueListenable: _focusedDay,
      builder: (context, focusedDay, _) {
        return ValueListenableBuilder<DateTime?>(
          valueListenable: _selectedDay,
          builder: (context, selectedDay, _) {
            return TableCalendar(
              firstDay: DateTime(2020, 1, 1),
              lastDay: DateTime(2030, 12, 31),
              focusedDay: focusedDay,
              selectedDayPredicate: (day) => isSameDay(selectedDay, day),
              calendarFormat: _calendarFormat,
              locale: 'ja_JP',

              // 日付選択時のコールバック
              onDaySelected: (selectedDay, focusedDay) {
                _selectedDay.value = selectedDay;
                _focusedDay.value = focusedDay;

                // TODO: 選択した日付のイベントを表示
                print(
                  '選択した日付: ${DateFormat('yyyy/MM/dd').format(selectedDay)}',
                );
              },

              // ページ変更時のコールバック
              onPageChanged: (focusedDay) {
                _focusedDay.value = focusedDay;
              },

              // カレンダースタイル
              calendarStyle: CalendarStyle(
                // 今日の日付のスタイル
                todayDecoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                todayTextStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
                // 選択した日付のスタイル
                selectedDecoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                selectedTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                // 週末のスタイル
                weekendTextStyle: TextStyle(
                  color: Colors.red.shade600,
                  fontWeight: FontWeight.w500,
                ),
                // 通常の日のスタイル
                defaultTextStyle: const TextStyle(fontWeight: FontWeight.w500),
                defaultDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                // 外部の月の日付
                outsideTextStyle: TextStyle(color: Colors.grey.shade400),
                outsideDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                // 週末の装飾
                weekendDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                // 無効な日付の装飾
                disabledDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                // マーカー（イベント表示用）
                markerDecoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(2),
                ),
                markerMargin: const EdgeInsets.symmetric(horizontal: 1),
                // セルのパディング
                cellMargin: const EdgeInsets.all(4),
              ),

              // ヘッダースタイル（曜日）
              headerVisible: false, // 月のヘッダーは独自実装を使用
              // 曜日のスタイル
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                weekendStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade700,
                ),
              ),

              // イベントローダー
              eventLoader: (day) {
                return _getEventsForDay(day, ref);
              },

              // カスタムマーカービルダー
              calendarBuilders: CalendarBuilders(
                markerBuilder: (context, day, events) {
                  if (events.isEmpty) return null;

                  return Positioned(
                    bottom: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          events.take(4).map((event) {
                            return Container(
                              width: 6,
                              height: 6,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 0.5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: _getEventColor(event as String),
                              ),
                            );
                          }).toList(),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  // その日のイベントを取得
  List<String> _getEventsForDay(DateTime day, WidgetRef ref) {
    final List<String> events = [];
    final selectedPetId = ref.watch(selectedPetsProvider);

    // 選択中のペットがない場合は空のリストを返す
    if (selectedPetId == null) return events;

    final hospitalHistoryState = ref.watch(hospitalHistoryControllerProvider);
    final vaccineHistoryState = ref.watch(vaccineHistoryControllerProvider);
    final medicineHistoryState = ref.watch(medicineHistoryControllerProvider);
    final petDiaryState = ref.watch(petDiaryControllerProvider);

    hospitalHistoryState.whenData((hospitals) {
      if (hospitals.any(
        (h) => h.petId == selectedPetId && _isSameDay(h.date, day),
      )) {
        events.add('hospital');
      }
    });

    vaccineHistoryState.whenData((vaccines) {
      if (vaccines.any(
        (v) => v.petId == selectedPetId && _isSameDay(v.date, day),
      )) {
        events.add('vaccine');
      }
    });

    medicineHistoryState.whenData((medicines) {
      if (medicines.any(
        (m) => m.petId == selectedPetId && _isSameDay(m.date, day),
      )) {
        events.add('medicine');
      }
    });

    petDiaryState.whenData((diaries) {
      if (diaries.any(
        (d) => d.petId == selectedPetId && _isSameDay(d.date, day),
      )) {
        events.add('diary');
      }
    });

    return events;
  }

  // イベントの種類に応じた色を取得
  Color _getEventColor(String eventType) {
    switch (eventType) {
      case 'hospital':
        return Colors.red;
      case 'vaccine':
        return Colors.green;
      case 'medicine':
        return Colors.orange;
      case 'diary':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  // イベント一覧エリア（将来実装）
  Widget _buildEventList() {
    return ValueListenableBuilder<DateTime?>(
      valueListenable: _selectedDay,
      builder: (context, selectedDay, _) {
        if (selectedDay == null) {
          return const SizedBox.shrink();
        }

        return Container(
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: Column(
            children: [
              // ヘッダー
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade200, width: 1),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.event,
                            color: Theme.of(context).colorScheme.primary,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat('M月d日(E)', 'ja').format(selectedDay),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '予定を確認',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // 新規登録ボタン
                    FilledButton.tonalIcon(
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // イベント一覧
              Expanded(child: _buildScheduleList(selectedDay)),
            ],
          ),
        );
      },
    );
  }

  // スケジュール一覧を表示
  Widget _buildScheduleList(DateTime selectedDay) {
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
                    // 選択した日付とペットの予定をフィルタリング
                    final selectedHospitals =
                        hospitals
                            .where(
                              (h) =>
                                  h.petId == selectedPetId &&
                                  _isSameDay(h.date, selectedDay),
                            )
                            .toList();
                    final selectedVaccines =
                        vaccines
                            .where(
                              (v) =>
                                  v.petId == selectedPetId &&
                                  _isSameDay(v.date, selectedDay),
                            )
                            .toList();
                    final selectedMedicines =
                        medicines
                            .where(
                              (m) =>
                                  m.petId == selectedPetId &&
                                  _isSameDay(m.date, selectedDay),
                            )
                            .toList();
                    final selectedDiaries =
                        diaries
                            .where(
                              (d) =>
                                  d.petId == selectedPetId &&
                                  _isSameDay(d.date, selectedDay),
                            )
                            .toList();

                    final totalCount =
                        selectedHospitals.length +
                        selectedVaccines.length +
                        selectedMedicines.length +
                        selectedDiaries.length;

                    if (totalCount == 0) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.event_available_rounded,
                              size: 48,
                              color: Colors.grey.shade300,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'この日の予定はありません',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return ListView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      children: [
                        // 通院
                        ...selectedHospitals.map(
                          (history) => _buildScheduleCard(
                            type: '通院',
                            icon: Icons.local_hospital_rounded,
                            color: Colors.red,
                            title: history.symptom ?? '通院',
                            memo: history.memo,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder:
                                      (context) => ScheduleDetailScreen(
                                        type: '通院',
                                        data: history,
                                      ),
                                ),
                              );
                            },
                          ),
                        ),
                        // ワクチン
                        ...selectedVaccines.map(
                          (history) => _buildScheduleCard(
                            type: 'ワクチン',
                            icon: Icons.vaccines_rounded,
                            color: Colors.green,
                            title: 'ワクチン接種',
                            memo: history.memo,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder:
                                      (context) => ScheduleDetailScreen(
                                        type: 'ワクチン',
                                        data: history,
                                      ),
                                ),
                              );
                            },
                          ),
                        ),
                        // 服薬
                        ...selectedMedicines.map(
                          (history) => _buildScheduleCard(
                            type: '服薬',
                            icon: Icons.medication_rounded,
                            color: Colors.orange,
                            title: '服薬',
                            memo: history.memo,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder:
                                      (context) => ScheduleDetailScreen(
                                        type: '服薬',
                                        data: history,
                                      ),
                                ),
                              );
                            },
                          ),
                        ),
                        // 日記
                        ...selectedDiaries.map(
                          (diary) => _buildScheduleCard(
                            type: '日記',
                            icon: Icons.edit_note_rounded,
                            color: Colors.blue,
                            title: diary.title,
                            memo: diary.content,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder:
                                      (context) => ScheduleDetailScreen(
                                        type: '日記',
                                        data: diary,
                                      ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
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

  // スケジュールカード
  Widget _buildScheduleCard({
    required String type,
    required IconData icon,
    required Color color,
    required String title,
    String? memo,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              children: [
                // アイコン
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                const SizedBox(width: 12),
                // 内容
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
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      if (memo != null && memo.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          memo,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
                // 矢印アイコン
                Icon(Icons.chevron_right_rounded, color: Colors.grey.shade400),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 日付比較
  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
