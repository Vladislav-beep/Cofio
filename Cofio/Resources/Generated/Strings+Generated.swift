// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Strings {
  internal enum Common {
    /// Ошибка
    internal static let error = Strings.tr("Localizable", "Common.error", fallback: "Ошибка")
    /// Удача
    internal static let success = Strings.tr("Localizable", "Common.success", fallback: "Удача")
    internal enum CancelButton {
      /// Отмена
      internal static let title = Strings.tr("Localizable", "Common.cancel_button.title", fallback: "Отмена")
    }
    internal enum CloseButton {
      /// Localizable.strings
      ///   Cofio
      /// 
      ///   Created by Владислав Сизонов on 14.12.2022.
      internal static let title = Strings.tr("Localizable", "Common.close_button.title", fallback: "Закрыть")
    }
    internal enum DeleteButton {
      /// Удалить
      internal static let title = Strings.tr("Localizable", "Common.delete_button.title", fallback: "Удалить")
    }
  }
  internal enum Tab {
    /// Главная
    internal static let mainTab = Strings.tr("Localizable", "Tab.main_tab", fallback: "Главная")
    /// Повторение
    internal static let repetitionTab = Strings.tr("Localizable", "Tab.repetition_tab", fallback: "Повторение")
    /// Настройки
    internal static let settingsTab = Strings.tr("Localizable", "Tab.settings_tab", fallback: "Настройки")
    /// Статистика
    internal static let statisticsTab = Strings.tr("Localizable", "Tab.statistics_tab", fallback: "Статистика")
  }
  internal enum CardsModule {
    /// Карточки
    internal static let title = Strings.tr("Localizable", "cards_module.title", fallback: "Карточки")
    internal enum EmptyCell {
      /// Чтобы добавить карточку нажите плюс вверху экрана
      internal static let subtitle = Strings.tr("Localizable", "cards_module.empty_cell.subtitle", fallback: "Чтобы добавить карточку нажите плюс вверху экрана")
      /// Нет карточек
      internal static let title = Strings.tr("Localizable", "cards_module.empty_cell.title", fallback: "Нет карточек")
    }
  }
  internal enum CardsRepetitionModule {
    /// Выучил
    internal static let learnedButton = Strings.tr("Localizable", "cards_repetition_module.learned_button", fallback: "Выучил")
    /// Еще раз
    internal static let moreButton = Strings.tr("Localizable", "cards_repetition_module.more_button", fallback: "Еще раз")
  }
  internal enum CollectionTextField {
    /// Название коллекции
    internal static let placeholder = Strings.tr("Localizable", "collection_textField.placeholder", fallback: "Название коллекции")
  }
  internal enum FinishOfferModule {
    /// Понятно
    internal static let buttonTitle = Strings.tr("Localizable", "finish_offer_module.button_title", fallback: "Понятно")
    /// выучена!
    internal static let learned = Strings.tr("Localizable", "finish_offer_module.learned", fallback: "выучена!")
    /// Следующее повторение
    internal static let nextRepeat = Strings.tr("Localizable", "finish_offer_module.next_repeat", fallback: "Следующее повторение")
    /// повторена
    internal static let repeated = Strings.tr("Localizable", "finish_offer_module.repeated", fallback: "повторена")
    /// Тема
    internal static let titleLabel = Strings.tr("Localizable", "finish_offer_module.title_label", fallback: "Тема")
  }
  internal enum LearningMethodModule {
    /// Выбор способа запоминания
    internal static let title = Strings.tr("Localizable", "learning_method_module.title", fallback: "Выбор способа запоминания")
    internal enum LongCell {
      /// Для запоминания используется методика прогрессирующего запоминания, первое повторение происходит в тот же день, далее на следующий, потом через 3 дня, 5....
      internal static let subtitle = Strings.tr("Localizable", "learning_method_module.long_cell.subtitle", fallback: "Для запоминания используется методика прогрессирующего запоминания, первое повторение происходит в тот же день, далее на следующий, потом через 3 дня, 5....")
      /// Прогрессирующее повторение
      internal static let title = Strings.tr("Localizable", "learning_method_module.long_cell.title", fallback: "Прогрессирующее повторение")
    }
    internal enum WeekCell {
      /// Методика состоит в том, чтобы повторять информацию каждый день в течение недели
      internal static let subtitle = Strings.tr("Localizable", "learning_method_module.week_cell.subtitle", fallback: "Методика состоит в том, чтобы повторять информацию каждый день в течение недели")
      /// Каждодневное повторение
      internal static let title = Strings.tr("Localizable", "learning_method_module.week_cell.title", fallback: "Каждодневное повторение")
    }
  }
  internal enum MainModule {
    /// Карточки для запоминания любой информации, подготовки к экзаменам, изучения иностранных слов
    internal static let subtitle = Strings.tr("Localizable", "main_module.subtitle", fallback: "Карточки для запоминания любой информации, подготовки к экзаменам, изучения иностранных слов")
    /// Главная
    internal static let title = Strings.tr("Localizable", "main_module.title", fallback: "Главная")
    internal enum EmptyCell {
      /// Чтобы добавить коллекцию нажите плюс внизу экрана
      internal static let subtitle = Strings.tr("Localizable", "main_module.empty_cell.subtitle", fallback: "Чтобы добавить коллекцию нажите плюс внизу экрана")
      /// Нет коллекций
      internal static let title = Strings.tr("Localizable", "main_module.empty_cell.title", fallback: "Нет коллекций")
    }
    internal enum LearningMethodAlert {
      /// Перейдите в вкладку Настройки и выберите способ запоминания информации
      internal static let message = Strings.tr("Localizable", "main_module.learning_method_alert.message", fallback: "Перейдите в вкладку Настройки и выберите способ запоминания информации")
      /// Не выбран способ запоминания
      internal static let title = Strings.tr("Localizable", "main_module.learning_method_alert.title", fallback: "Не выбран способ запоминания")
    }
    internal enum LearningMethodAlertButton {
      /// Перейти в настройки
      internal static let title = Strings.tr("Localizable", "main_module.learning_method_alert_button.title", fallback: "Перейти в настройки")
    }
    internal enum RepeatNoThemesToast {
      /// Нет тем для изучения либо одна из тем не содержит карточек
      internal static let message = Strings.tr("Localizable", "main_module.repeat_no_themes_toast.message", fallback: "Нет тем для изучения либо одна из тем не содержит карточек")
    }
    internal enum RepeatStartedToast {
      /// Повторение коллекции началось
      internal static let title = Strings.tr("Localizable", "main_module.repeat_started_toast.title", fallback: "Повторение коллекции началось")
    }
    internal enum StartLearning {
      /// Изучить коллекцию
      internal static let title = Strings.tr("Localizable", "main_module.start_learning.title", fallback: "Изучить коллекцию")
    }
  }
  internal enum NewCardModule {
    internal enum AddButton {
      /// Добавить карточку
      internal static let title = Strings.tr("Localizable", "new_card_module.add_button.title", fallback: "Добавить карточку")
    }
    internal enum AddDefinition {
      /// Определение или слово
      internal static let textViewPlaceholder = Strings.tr("Localizable", "new_card_module.add_definition.textView_placeholder", fallback: "Определение или слово")
    }
    internal enum AddDescription {
      /// Описание или перевод
      internal static let textViewPlaceholder = Strings.tr("Localizable", "new_card_module.add_description.textView_placeholder", fallback: "Описание или перевод")
    }
    internal enum EditButton {
      /// Редактировать
      internal static let title = Strings.tr("Localizable", "new_card_module.edit_button.title", fallback: "Редактировать")
    }
  }
  internal enum NewCollectionModule {
    /// Выберите иконку
    internal static let chooseIcon = Strings.tr("Localizable", "new_collection_module.choose_icon", fallback: "Выберите иконку")
    /// Редактирование коллекции
    internal static let editTitle = Strings.tr("Localizable", "new_collection_module.edit_title", fallback: "Редактирование коллекции")
    /// Добавление коллекции
    internal static let title = Strings.tr("Localizable", "new_collection_module.title", fallback: "Добавление коллекции")
    internal enum Alert {
      /// Имя коллекции не может быть пустым
      internal static let message = Strings.tr("Localizable", "new_collection_module.alert.message", fallback: "Имя коллекции не может быть пустым")
    }
    internal enum Button {
      /// Редактировать
      internal static let editTitle = Strings.tr("Localizable", "new_collection_module.button.edit_title", fallback: "Редактировать")
      /// Добавить
      internal static let title = Strings.tr("Localizable", "new_collection_module.button.title", fallback: "Добавить")
    }
  }
  internal enum OnboardingModule {
    /// Дальше
    internal static let buttonTitle = Strings.tr("Localizable", "onboarding_module.button_title", fallback: "Дальше")
    /// Изучайте и запоминайте информацию с помощью карточек.
    internal static let subtitle1 = Strings.tr("Localizable", "onboarding_module.subtitle1", fallback: "Изучайте и запоминайте информацию с помощью карточек.")
    /// Для удобства все темы можно группировать в коллекции. Для каждой коллекции выбирается своя иконка.
    internal static let subtitle2 = Strings.tr("Localizable", "onboarding_module.subtitle2", fallback: "Для удобства все темы можно группировать в коллекции. Для каждой коллекции выбирается своя иконка.")
    /// Рядом с названием каждой темы есть прогресс, показываеющий сколько повторений темы сделано.
    internal static let subtitle3 = Strings.tr("Localizable", "onboarding_module.subtitle3", fallback: "Рядом с названием каждой темы есть прогресс, показываеющий сколько повторений темы сделано.")
    /// В каждую тему можно добавить неограниченное количество карточек.
    internal static let subtitle4 = Strings.tr("Localizable", "onboarding_module.subtitle4", fallback: "В каждую тему можно добавить неограниченное количество карточек.")
    /// Чтобы начать изучать определенную тему свайпните плашку влево.
    internal static let subtitle5 = Strings.tr("Localizable", "onboarding_module.subtitle5", fallback: "Чтобы начать изучать определенную тему свайпните плашку влево.")
    /// В разделе Повторение показывается какую тему нужно повторить сегодня, а повторение какой темы пропущено.
    internal static let subtitle6 = Strings.tr("Localizable", "onboarding_module.subtitle6", fallback: "В разделе Повторение показывается какую тему нужно повторить сегодня, а повторение какой темы пропущено.")
    /// В разделе статистика можно посмотреть количество добавленный и выученных карточек за разные периоды времени.
    internal static let subtitle7 = Strings.tr("Localizable", "onboarding_module.subtitle7", fallback: "В разделе статистика можно посмотреть количество добавленный и выученных карточек за разные периоды времени.")
    /// Добро пожаловать!
    internal static let title1 = Strings.tr("Localizable", "onboarding_module.title1", fallback: "Добро пожаловать!")
    /// Добавляйте коллекции!
    internal static let title2 = Strings.tr("Localizable", "onboarding_module.title2", fallback: "Добавляйте коллекции!")
    /// Следите за прогрессом!
    internal static let title3 = Strings.tr("Localizable", "onboarding_module.title3", fallback: "Следите за прогрессом!")
    /// Добавляйте карточки!
    internal static let title4 = Strings.tr("Localizable", "onboarding_module.title4", fallback: "Добавляйте карточки!")
    /// Начать повторение!
    internal static let title5 = Strings.tr("Localizable", "onboarding_module.title5", fallback: "Начать повторение!")
    /// Повторяйте!
    internal static let title6 = Strings.tr("Localizable", "onboarding_module.title6", fallback: "Повторяйте!")
    /// Статистика!
    internal static let title7 = Strings.tr("Localizable", "onboarding_module.title7", fallback: "Статистика!")
  }
  internal enum RepetitionModule {
    /// Последнее повторение!
    internal static let lastRepeat = Strings.tr("Localizable", "repetition_module.last_repeat", fallback: "Последнее повторение!")
    /// Нужно повторить
    internal static let needsRepeat = Strings.tr("Localizable", "repetition_module.needs_repeat", fallback: "Нужно повторить")
    /// Нужно было повторить
    internal static let needsRepeatPast = Strings.tr("Localizable", "repetition_module.needs_repeat_past", fallback: "Нужно было повторить")
    /// Повторение
    internal static let title = Strings.tr("Localizable", "repetition_module.title", fallback: "Повторение")
    /// Сегодня
    internal static let today = Strings.tr("Localizable", "repetition_module.today", fallback: "Сегодня")
    /// Завтра
    internal static let tomorrow = Strings.tr("Localizable", "repetition_module.tomorrow", fallback: "Завтра")
    /// Вчера
    internal static let yesteday = Strings.tr("Localizable", "repetition_module.yesteday", fallback: "Вчера")
    internal enum EmptyCell {
      /// Начните изучение коллекции или темы или добавьте карточки в существующие темы
      internal static let subtitle = Strings.tr("Localizable", "repetition_module.empty_cell.subtitle", fallback: "Начните изучение коллекции или темы или добавьте карточки в существующие темы")
      /// Нет тем для повторения
      internal static let title = Strings.tr("Localizable", "repetition_module.empty_cell.title", fallback: "Нет тем для повторения")
    }
  }
  internal enum SettingsModule {
    /// Настройки
    internal static let title = Strings.tr("Localizable", "settings_module.title", fallback: "Настройки")
    internal enum DeleteAlert {
      /// Вы действительно хотите удалить все данные?
      internal static let message = Strings.tr("Localizable", "settings_module.delete_alert.message", fallback: "Вы действительно хотите удалить все данные?")
      /// Удаление данных
      internal static let title = Strings.tr("Localizable", "settings_module.delete_alert.title", fallback: "Удаление данных")
    }
    internal enum DeleteCell {
      /// Удалить все данные
      internal static let title = Strings.tr("Localizable", "settings_module.delete_cell.title", fallback: "Удалить все данные")
    }
    internal enum LearningCell {
      /// Выбор способа запоминания
      internal static let title = Strings.tr("Localizable", "settings_module.learning_cell.title", fallback: "Выбор способа запоминания")
    }
    internal enum OnboardingCell {
      /// Показать онбординг
      internal static let title = Strings.tr("Localizable", "settings_module.onboarding_cell.title", fallback: "Показать онбординг")
    }
  }
  internal enum ThemeModule {
    /// Темы
    internal static let header = Strings.tr("Localizable", "theme_module.header", fallback: "Темы")
    internal enum Alert {
      /// Добавить
      internal static let addButton = Strings.tr("Localizable", "theme_module.alert.add_button", fallback: "Добавить")
      /// Отмена
      internal static let cancelButton = Strings.tr("Localizable", "theme_module.alert.cancel_button", fallback: "Отмена")
      /// Редактировать
      internal static let editButton = Strings.tr("Localizable", "theme_module.alert.edit_button", fallback: "Редактировать")
      /// Отредактируйте название темы
      internal static let editSubtitle = Strings.tr("Localizable", "theme_module.alert.edit_subtitle", fallback: "Отредактируйте название темы")
      /// Редактирование темы
      internal static let editTitle = Strings.tr("Localizable", "theme_module.alert.edit_title", fallback: "Редактирование темы")
      /// Напишите название темы, которую хотите добавить
      internal static let subtitle = Strings.tr("Localizable", "theme_module.alert.subtitle", fallback: "Напишите название темы, которую хотите добавить")
      /// Название темы
      internal static let textFieldPlaceholder = Strings.tr("Localizable", "theme_module.alert.textField_placeholder", fallback: "Название темы")
      /// Добавление темы
      internal static let title = Strings.tr("Localizable", "theme_module.alert.title", fallback: "Добавление темы")
    }
    internal enum EmptyCell {
      /// Чтобы добавить тему нажите плюс вверху экрана
      internal static let subtitle = Strings.tr("Localizable", "theme_module.empty_cell.subtitle", fallback: "Чтобы добавить тему нажите плюс вверху экрана")
      /// Нет тем
      internal static let title = Strings.tr("Localizable", "theme_module.empty_cell.title", fallback: "Нет тем")
    }
    internal enum RepeatNoCardsToast {
      /// Добавьте карточки в тему
      internal static let title = Strings.tr("Localizable", "theme_module.repeat_no_cards_toast.title", fallback: "Добавьте карточки в тему")
    }
    internal enum RepeatStartedToast {
      /// Повторение темы началось
      internal static let title = Strings.tr("Localizable", "theme_module.repeat_started_toast.title", fallback: "Повторение темы началось")
    }
    internal enum StartLearning {
      /// Изучить тему
      internal static let title = Strings.tr("Localizable", "theme_module.start_learning.title", fallback: "Изучить тему")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
