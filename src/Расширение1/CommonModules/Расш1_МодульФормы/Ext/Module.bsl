﻿
&Насервере
Процедура ПриСозданииНаСервереПосле(Элементы, Форма) Экспорт
	
	Элементы.Алгоритм.Видимость = Ложь;
	
	СоздатьПолеHTML("HTMLДокумент", "HTMLДокументСформирован", Форма)
	
	//Реквизит_HTMLДокумент = Новый РеквизитФормы("HTMLДокумент", Новый ОписаниеТипов("Строка",,Новый КвалификаторыСтроки(0)));
	//
	//ДобавляемыеРеквизиты = Новый Массив;
	//ДобавляемыеРеквизиты.Добавить(Реквизит_HTMLДокумент);
	//
	//Форма.ИзменитьРеквизиты(ДобавляемыеРеквизиты);
	//
	//ИмяЭлемента = "ПолеHTML";
	//Если Элементы.Найти(ИмяЭлемента) = Неопределено Тогда
	//	
	//	НовыйЭлемент = Элементы.Добавить(ИмяЭлемента, Тип("ПолеФормы"), Форма);
	//	НовыйЭлемент.Вид = ВидПоляФормы.ПолеHTMLДокумента;
	//	НовыйЭлемент.ПутьКДанным = "HTMLДокумент";
	//	НовыйЭлемент.УстановитьДействие("ДокументСформирован", "HTMLДокументСформирован");
	//	
	//КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытииПосле(Форма) Экспорт
	
	Форма.HTMLДокумент = АдресКонсолиКода;
	
КонецПроцедуры

&НаКлиенте
Процедура HTMLДокументСформирован(Объект, КонсольКода) Экспорт
	
	ИнициализацияРедактора(КонсольКода, Объект);
	
КонецПроцедуры

&НаКлиенте
Процедура ИнициализацияРедактора(КонсольКода, Объект)
	
	Инфо = Новый СистемнаяИнформация();
	КонсольКода.init(Инфо.ВерсияПриложения);
	// Прочитаем текст из реквизита.
	КонсольКода.setText(Объект.Алгоритм);
	
КонецПроцедуры

&НаКлиенте
Процедура ПередЗаписьюПосле(Объект, КонсольКода) Экспорт
	
	КодКонсоли = КонсольКода.getText();
	// Запишем новый текст в реквизит.
	Объект.Алгоритм = КодКонсоли;
	
КонецПроцедуры

&НаСервере
Процедура СоздатьПолеHTML(ИмяРеквизита, ИмяПроцедурыОбработчика, Форма)
	
	Реквизит_HTMLДокумент = Новый РеквизитФормы(ИмяРеквизита, Новый ОписаниеТипов("Строка",,Новый КвалификаторыСтроки(0)));
	
	ДобавляемыеРеквизиты = Новый Массив;
	ДобавляемыеРеквизиты.Добавить(Реквизит_HTMLДокумент);
	
	Форма.ИзменитьРеквизиты(ДобавляемыеРеквизиты);
	
	ИмяЭлемента = ИмяРеквизита;
	Если Форма.Элементы.Найти(ИмяЭлемента) = Неопределено Тогда
		
		НовыйЭлемент = Форма.Элементы.Добавить(ИмяЭлемента, Тип("ПолеФормы"), Форма);
		НовыйЭлемент.Вид = ВидПоляФормы.ПолеHTMLДокумента;
		НовыйЭлемент.ПутьКДанным = ИмяРеквизита;
		НовыйЭлемент.УстановитьДействие("ДокументСформирован", ИмяПроцедурыОбработчика);
		
	КонецЕсли;
	
КонецПроцедуры
