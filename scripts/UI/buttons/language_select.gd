extends OptionButton

var langs: Array = ["system", ""]
var selected_language = 0

signal translation_changed

func _ready() -> void:
	langs.append_array(TranslationServer.get_loaded_locales())
	print(langs)
	add_item(tr(langs[0]))
	add_separator()
	for lang in langs.slice(2):
		add_item(tr(lang))
	selected_language = PlayerPrefs.get_int("language", 0)
	select(selected_language)
	_item_selected(selected_language)

func _item_selected(index: int):
	translation_changed.emit()
	selected_language = index
	if selected_language == 0:
		TranslationServer.set_locale(OS.get_locale_language())
	else :
		TranslationServer.set_locale(langs[selected_language])
	PlayerPrefs.set_pref("language", selected_language)
