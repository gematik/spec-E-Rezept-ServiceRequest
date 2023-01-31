CodeSystem: KimDienstkennungCS
Id: kim-dienstkennung-cs
Title: "Kim Dienstkennung CS"
Description: "Dienstkennungen von KIM für FHIR-Nachrichten"
* #eEB;Anfrage;V1.0 "Anfragedaten zum Erhalt von Versichertendaten"
* #eEB;Bescheinigung;V1.0 "Anfragedaten zum Erhalt von Versichertendaten"
* #eEB;Fehler;V1.0 "Versichertendaten in verschiedenen Ausprägungen"
* #KIM-Mail;Default;V1.0 "Default Header" // brauchen wir das? Wird von einem KIM Client nur befüllt wenn kein anderer Header angegeben wurde. Bei FHIR-KIM sollte es ja immer einen konkreten Fall geben
* #KIM-Mail;Abwesend;V1.0 "Abwesenheitsnotiz"
* #DALE-UV;Einsendung;V1.0 "Einsendung einer Unfallversicherung"
* #DALE-UV;Quittung;V1.0 "Quittung einer Unfallversicherung"
* #DiMus;Lieferung;V1.0 "DiMus Lieferung"
* #DiMus;Eingangsbestaetigung;V1.0 "Eingangsbestätigung (MDN) zum Digitalen Muster"
* #DiMus;Rueckmeldung;V1.0 "Rückmeldung bzw. qualifizierte Antwort auf den Nachrichten-Typ 'DiMus;Lieferung'"
// TEST
* #eRezept;Rezeptanforderung;V1.0 "Rezeptanforderung mit KIM"
// TEST
* #eRezept;Zuweisung;V1.0 "Direktzuweisung des E-Rezepts"
* #eRezept;Kommunikation;V1.0 "Freie E-Rezept-Kommunikation"
* #eAU;Lieferung;V1.0 "elektronische Arbeitsunfähigkeitsbescheinigung (Ausfertigung Krankenkasse)"
* #eAU;Storno-Arzt;V1.0 "Storno-Nachricht zu einer versendeten elektronischen Arbeitsunfähigkeitsbescheinigung"
* #eAU;Fehler-Kasse;V1.0 "Fehlermeldung zu einer elektronischen Arbeitsunfähigkeitsbescheinigung oder Storno-Nachricht von der Krankenkasse"
* #Arztbrief;VHitG-Versand;V1.0 "eArztbrief-Versand"
* #Arztbrief;VHitG-Versand;V1.2 "eArztbrief-Versand (Nutzdaten)"
* #Arztbrief;Eingangsbestaetigung;V1.0 "Eingangsbestätigung (MDN) zum versandten eArztbrief"
* #Arztbrief;Eingangsbestaetigung;V1.2 "Eingangsbestätigung (MDN) zum versandten eArztbrief (1.2)"
* #EBZ;PAR;1.4.0 "Behandlung von Parodontopathien"
* #EBZ;ZER;1.4.0 "Antragsdatensatz Zahnersatz"
* #EBZ;KGL;1.4.0 "Antragsdatensatz Behandlung von Kiefergelenkserkrankungen"
* #EBZ;KBR;1.4.0 "Antragsdatensatz Behandlung von Kieferbruch"
* #EBZ;KFO;1.4.0 "Antragsdatensatz Kieferorthopädische Behandlung"
* #EBZ;ANW;1.4.0 "Antwortdatensatz der Krankenkasse"
* #EBZ;FEH;1.4.0 "Fehlernachricht"
* #EBZ;MIT;1.4.0 "Mitteilungsdatensatz"
* #EBZ;PMB;1.4.0 "Antragsdatensatz von Behandlung bei anspruchsberechtigten Versicherten nach § 22a SGB V"
* #eDMP;Einsendung;V1.0 "eDMP-Einsendung Übermittlung der DMP-Dokumentationen"
* #eDMP;Quittung;V1.0 "eDMP-Quittung"
* #eDokumentation-<QSHLT>;Lieferung;V2.0 "Einlieferung eDokumentation-Qualitätssicherung in der Holmium-Laser-Therapie"
* #eDokumentation-<QSKE>;Lieferung;V2.0 "Einlieferung eDokumentation-Qualitätssicherung in der Kapselendoskopie"
* #eDokumentation-<QSMG>;Lieferung;V2.0 "Einlieferung eDokumentation-Qualitätssicherung in der Molekulargenetik"
* #eDokumentation-<QSHGV>;Lieferung;V2.0 "Einlieferung eDokumentation-Qualitätssicherung in der Hörgeräteversorgung von Jugendlichen und Erwachsenen"
* #eDokumentation-<QSHGVK>;Lieferung;V2.0 "Einlieferung eDokumentation-Qualitätssicherung in der Hörgeräteversorgung von Säuglingen, Kleinkindern und Kindern"
* #eDokumentation-<QSHLT>;Status;V2.0 "Status eDokumentation-Qualitätssicherung in der Holmium-Laser-Therapie"
* #eDokumentation-<QSKE>;Status;V2.0 "Status eDokumentation-Qualitätssicherung in der Kapselendoskopie"
* #eDokumentation-<QSMG>;Status;V2.0 "Status eDokumentation-Qualitätssicherung in der Molekulargenetik"
* #eDokumentation-<QSHGV>;Status;V2.0 "Status eDokumentation-Qualitätssicherung in der Hörgeräteversorgung von Jugendlichen und Erwachsenen"
* #eDokumentation-<QSHGVK>;Status;V2.0 "Status eDokumentation-Qualitätssicherung in der Hörgeräteversorgung von Säuglingen, Kleinkindern und Kindern"
* #eDokumentation-<QSHLT>;Eingangsbestaetigung;V2.0 "Eingangsbestätigung (MDN) zur eDokumentation-Qualitätssicherung in der Hörgeräteversorgung von Säuglingen, Kleinkindern und Kindern"
* #eDokumentation-<QSKE>;Eingangsbestaetigung;V2.0 "Eingangsbestätigung (MDN) zur eDokumentation-Qualitätssicherung in der Hörgeräteversorgung von Säuglingen, Kleinkindern und Kindern"
* #eDokumentation-<QSMG>;Eingangsbestaetigung;V2.0 "Eingangsbestätigung (MDN) zur eDokumentation-Qualitätssicherung in der Hörgeräteversorgung von Säuglingen, Kleinkindern und Kindern"
* #eDokumentation-<QSHGV>;Eingangsbestaetigung;V2.0 "Eingangsbestätigung (MDN) zur eDokumentation-Qualitätssicherung in der Hörgeräteversorgung von Säuglingen, Kleinkindern und Kindern"
* #eDokumentation-<QSHGVK>;Eingangsbestaetigung;V2.0 "Eingangsbestätigung (MDN) zur eDokumentation-Qualitätssicherung in der Hörgeräteversorgung von Säuglingen, Kleinkindern und Kindern"
* #abD-eHKS;Einsendung;V1.0 "Einsendung"
* #abD-eHKS;Quittung;V1.0 "Quittung"
* #eNachricht;Lieferung;V2.1 "eNachricht"
* #eNachricht;Eingangsbestaetigung;V2.1 "Eingangsbestätigung (MDN) zur eNachricht"
* #KZVAbr;Lieferung;V1.0 "Abrechnungs-Einlieferung"
* #KZVAbr;Rueckmeldung;V1.0 "fachliche Rückmeldung"
* #LDT-Auftrag;Lieferung;V1.0 "Laborauftrag"
* #LDT-Auftrag;Status;V1.0 "Status-Nachricht (optionale Funktion)"
* #LDT-Auftrag;Eingangsbestaetigung;V1.0 "Eingangsbestätigung (MDN) zum Laborauftrag"
* #LDT-Befund;Lieferung;V1.0 "Laborbefund"
* #LDT-Befund;Trigger;V1.0 " Initiale Nachricht für den Versand der Nachricht 'Laborbefund'"
* #LDT-Befund;Status;V1.0 "Status-Nachricht (Antwort auf optionale Funktion 'Befundabruf')"
* #LDT-Befund;Eingangsbestaetigung;V1.0 "Eingangsbestätigung (MDN) zum Laborauftrag"
* #MIO;Lieferung;V1.0 "MIO-Lieferung"
* #MIO;Rueckmeldung;V1.0 "MIO-Rückmeldung"
* #QSPB;Empfangsbestaetigung;V2.0 "Empfangsbestätigung zur QSPB Lieferung"
* #QSPB;Empfangsbestaetigung_RM;V2.0 "Empfangsbestätigung zum QSPB"
* #QSPB;Miniprotokoll;V2.0 "Miniprotokoll zur QSPB-Lieferung"
* #QSPB;Lieferung;V2.0 "Lieferung eines QSPB-Datensatzes"
* #QSPB;Datenflussprotokoll;V2.0 "Lieferung eines Datenflussprotokolls zur QSPB Lieferung"
* #QSPB;Rueckmeldebericht;V2.0 "Lieferung eines Rückmeldeberichts zu mehreren QSPB-Datensätzen (quartalsweie oder jährlich)"
* #UTeilnahme;Lieferung;V1.0 "U-Teilnahme (n Meldungen in einer Sendung)"
* #UTeilnahme;Quittung;V1.0 "Quittung zu einer U-Teilnahme-Sendung"
* #Selbsttest;Lieferung;V1.0 "Diese Dienstkennung dient ausschließlich der Einrichtung des Kontos innerhalb eines PVS und des Testes, ob Nachrichten versendet und empfangen werden können. Diese Dienstkennung wird im PVS bei der normalen Abholung von Nachrichten ignoriert."
* #1ClickAbrechnung;Lieferung;V2.0 "Abrechnungs-Einlieferung"
* #1ClickAbrechnung;Eingangsbestaetigung;V2.0 "Eingangsbestätigung (MDN) zur 1ClickAbrechnung"
* #1ClickAbrechnung;Rueckmeldung;V2.0 "fachliche Rückmeldung zur 1ClickAbrechnung"