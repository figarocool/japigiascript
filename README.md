# 🎯 Japigia ScripT - Il Primo Script mIRC Italiano con Eseguibili

[![Version](https://img.shields.io/badge/version-1.0-blue.svg)](https://github.com/figarocoo/japigia-script)
[![Year](https://img.shields.io/badge/year-1999--2000-orange.svg)](https://github.com/figarocoo/japigia-script)
[![Language](https://img.shields.io/badge/language-mIRC%20Script-green.svg)](https://github.com/figarocoo/japigia-script)
[![Status](https://img.shields.io/badge/status-Legacy%20Project-red.svg)](https://github.com/figarocoo/japigia-script)

> **IL Primo ScripT Con ExE in ITaliaN0** - Un sistema completo di script mIRC sviluppato tra il 1999-2000

## 📋 Indice

- [Panoramica](#-panoramica)
- [Caratteristiche Principali](#-caratteristiche-principali)
- [Struttura del Progetto](#-struttura-del-progetto)
- [Funzionalità Tecniche](#-funzionalità-tecniche)
- [Installazione](#-installazione)
- [Utilizzo](#-utilizzo)
- [Strumenti Inclusi](#-strumenti-inclusi)
- [Sistema Audio](#-sistema-audio)
- [Sistema Grafico](#-sistema-grafico)
- [Sicurezza](#-sicurezza)
- [Storia del Progetto](#-storia-del-progetto)
- [Crediti](#-crediti)
- [Licenza](#-licenza)

## 🎯 Panoramica

**Japigia ScripT** è stato uno dei primi e più completi script mIRC sviluppati in Italia, rappresentando un vero e proprio "sistema operativo per IRC". Creato da Stefano (FigaroCoo) tra il 1999 e il 2000, questo progetto ha segnato un'epoca nell'evoluzione degli script IRC italiani.

### 🏆 Riconoscimenti
- **Primo script italiano** con integrazione di eseguibili esterni
- **Sistema completo** di amministrazione, protezione e intrattenimento
- **Pioniere** nell'integrazione di strumenti di rete avanzati

## ⭐ Caratteristiche Principali

### 🛡️ Sistema di Protezione Avanzato
- **Anti-flood automatico** con protezioni multiple
- **Rilevamento NetBus e Back Orifice** con controlli automatici
- **Sistema di ban intelligente** con protezioni anti-mass-ban
- **Protezione da attacchi** con sistema di difesa automatica

### 🎮 Sistema di Guerra e Attacchi
- **Nuke Tools**: Wnuke2, Wnuke95, Freeze, Smurf, Dripper
- **Pestilenza**: Sistema di attacco automatico avanzato
- **Aggressor Pro**: Tool di attacco professionale
- **Port Scanner**: Scansione porte e identificazione vulnerabilità

### 🤖 Sistema di Cloni e Bot
- **Gestione cloni multipli** con connessioni firewall
- **Bot automatici** per amministrazione canali
- **Sistema identità multiple** con gestione avanzata
- **Controllo remoto** dei cloni con interfaccia dedicata

### 🌐 Strumenti di Rete
- **NeoTrace**: Traceroute avanzato con mappe geografiche
- **NetInfo**: Analisi completa delle informazioni di rete
- **Port Scanner**: Scansione porte con rilevamento servizi
- **Telnet Client**: Client telnet integrato

## 📁 Struttura del Progetto

```
ScripT/
├── 📂 base/              # Script principali e configurazioni
│   ├── script.ini        # Script principale di avvio
│   ├── remote.ini        # Sistema di comandi remoti
│   ├── events.ini        # Gestione eventi IRC
│   ├── modes.ini         # Modalità operative
│   ├── war.ini           # Sistema di guerra
│   ├── Jappy.mrc         # Sistema di rilevamento lag
│   └── RR-GUI.MRC        # Interfaccia grafica avanzata
├── 📂 UTIL/              # Strumenti esterni
│   ├── NeoTrace.exe      # Traceroute avanzato
│   ├── NetInfo.exe       # Analisi di rete
│   ├── p.exe             # Port scanner
│   └── telnet.exe        # Client telnet
├── 📂 Nuke/              # Strumenti di attacco
│   ├── WinSmurf.exe      # Smurf attack
│   ├── Crashegg.exe      # Crash tools
│   └── threed32.ocx      # Componenti grafici
├── 📂 Grafica/           # File grafici e skin
│   ├── *.bmp             # 40+ immagini per interfaccia
│   └── *.jpg             # Immagini di sfondo
├── 📂 sounds/            # Sistema audio
│   ├── *.mid             # 25+ file MIDI
│   └── Wavs/             # Effetti sonori
├── 📂 logs/              # Log delle conversazioni
├── 📂 sub/               # Strumenti aggiuntivi
└── 📂 vecchi-log/        # Log storici
```

## 🔧 Funzionalità Tecniche

### 🎛️ Sistema di Menu Avanzato
- **Menu contestuali** per query, canali, nicklist
- **Sistema di protezioni** automatiche configurabili
- **Gestione completa** dei canali IRC
- **Comandi di amministrazione** (op, deop, kick, ban)

### 🔄 Sistema di Variabili Dinamiche
- **500+ variabili** di configurazione
- **Sistema di stati** per modalità operative
- **Gestione colori** e formattazione avanzata
- **Controllo temporizzatori** e eventi

### 🎨 Interfaccia Grafica Personalizzata
- **RR-GUI 3.0**: Sistema di interfaccia avanzato
- **Skin personalizzabili** con temi multipli
- **Sistema di finestre** dinamiche
- **Effetti grafici** e animazioni

### 🔐 Sistema di Sicurezza
```mirc
# Controlli automatici di sicurezza
on 1:CONNECT: {
  if ($portfree(12345) != $true) { 
    echo -a Probabile infezione NETBUS!
  }
  if ($portfree(31337) != $true) { 
    echo -a Probabile infezione BACK ORIFICE!
  }
}
```

## 🚀 Installazione

### Prerequisiti
- **mIRC 5.x** o superiore
- **Windows 95/98/NT** o superiore
- **Connessione Internet** per funzionalità di rete

### Passi di Installazione
1. **Estrai** tutti i file nella directory mIRC
2. **Avvia mIRC** e carica lo script principale
3. **Configura** le impostazioni tramite `/setup`
4. **Personalizza** skin e suoni secondo preferenze

### Configurazione Iniziale
```mirc
/setup                    # Configurazione guidata
/panel                    # Apertura pannello controllo
/load -rs base/script.ini # Caricamento script principale
```

## 💻 Utilizzo

### Comandi Principali
```mirc
/panel                    # Pannello di controllo principale
/setup                    # Configurazione sistema
/war                      # Attivazione sistema guerra
/protection               # Attivazione protezioni
/cloni                    # Gestione cloni
/lag                      # Controllo lag server
```

### Sistema di Protezione
```mirc
/protection on            # Attiva protezioni
/massdeop on             # Protezione mass-deop
/masskick on             # Protezione mass-kick
/banpro on               # Protezione ban
```

### Gestione Cloni
```mirc
/go [firewall] [numero] [server]  # Avvia cloni
/cloni status             # Stato cloni attivi
/cloni join #canale       # Cloni entrano in canale
/cloni quit               # Termina tutti i cloni
```

## 🛠️ Strumenti Inclusi

### 🌐 Strumenti di Rete
| Strumento | Descrizione | Funzione |
|-----------|-------------|----------|
| **NeoTrace** | Traceroute avanzato | Tracciamento percorsi con mappe |
| **NetInfo** | Analisi di rete | Informazioni dettagliate IP/host |
| **Port Scanner** | Scansione porte | Identificazione servizi attivi |
| **Telnet** | Client telnet | Connessioni remote |

### ⚔️ Strumenti di Attacco
| Strumento | Tipo | Descrizione |
|-----------|------|-------------|
| **Wnuke2** | Nuke | Attacco Windows 95/98 |
| **Wnuke95** | Nuke | Variante per Windows 95 |
| **Freeze** | DoS | Congelamento connessione |
| **Smurf** | DoS | Attacco smurf |
| **Dripper** | Flood | Flood di pacchetti |

### 🤖 Sistema Bot
- **Gestione automatica** dei canali
- **Risposte automatiche** a comandi
- **Sistema di protezione** avanzato
- **Logging completo** delle attività

## 🎵 Sistema Audio

### 🎶 Collezione MIDI (25+ brani)
#### Cartoni Animati
- **Ken** - Kenshiro (Hokuto no Ken)
- **Simpson** - Tema dei Simpson
- **Goldrake** - Tema di Goldrake
- **MazingaZ** - Tema di Mazinga Z
- **UfoRobot** - Tema di UFO Robot

#### Musica Classica
- **Bond** - Tema di James Bond
- **Trilogy** - Trilogy
- **Real McCoy** - Real McCoy
- **Bella** - Bella

#### Techno e Moderna
- **Techno** - Brani techno
- **Mortal Kombat** - Tema del gioco
- **Rocky** - Tema di Rocky

### 🔊 Effetti Sonori
- **CONNECT.WAV** - Suono connessione
- **WARNING.WAV** - Avvisi di sicurezza
- **NETBUS.WAV** - Rilevamento NetBus
- **Ok.wav** - Conferme operazioni

## 🎨 Sistema Grafico

### 🖼️ Interfaccia Personalizzata
- **40+ file BMP** per personalizzazione completa
- **Skin multiple** con temi diversi
- **Sistema di colori** avanzato
- **Finestre dinamiche** con effetti

### 🎭 Temi Disponibili
- **Tema Classico** - Interfaccia standard
- **Tema Dark** - Interfaccia scura
- **Tema Colorato** - Interfaccia colorata
- **Tema Personalizzato** - Creazione temi custom

## 🔒 Sicurezza

### ⚠️ Avviso Importante
Questo progetto include strumenti che potrebbero essere considerati:
- **Strumenti di attacco** (Nuke, DoS, Flood)
- **Trojan** (NetBus, SubSeven)
- **Port scanner** per identificazione vulnerabilità

### 🛡️ Protezioni Integrate
- **Rilevamento automatico** di NetBus e Back Orifice
- **Controllo porte** sospette
- **Sistema di allerta** per intrusioni
- **Protezione anti-flood** avanzata

### 📋 Note Legali
- Utilizzare solo per **scopi educativi**
- **Non utilizzare** per attacchi non autorizzati
- **Rispettare** le leggi locali sulla sicurezza informatica
- **Responsabilità** dell'utente per l'utilizzo

## 📚 Storia del Progetto

### 🕰️ Timeline di Sviluppo
- **1999**: Inizio sviluppo e prime funzionalità
- **2000**: Completamento e ottimizzazioni
- **2000**: Rilascio versione 1.0 completa
- **2025**: Archiviazione e documentazione

### 🌟 Contesto Storico
Negli anni '90 e primi 2000, IRC era il **centro della comunità hacker italiana**. Script come Japigia ScripT rappresentavano l'apice della creatività tecnica, combinando:
- **Programmazione avanzata** in mIRC Script
- **Integrazione di strumenti esterni**
- **Sistemi di protezione** innovativi
- **Interfaccia utente** personalizzabile

### 👥 Comunità IRC Italiana
Il progetto era utilizzato su canali come:
- **#italia** - Canale principale italiano
- **#hacker.it** - Comunità hacker
- **#crack.it** - Scene cracking
- **#warez** - Condivisione software
- **#emuita** - Emulatori e gaming

## 👨‍💻 Crediti

### 🎯 Autore Principale
- **Nome**: Stefano (FigaroCoo)
- **Email**: yapigia@iol.it / Japigia@iol.it
- **Nick IRC**: FigaroCoo / FiigaroCo
- **Sito**: http://www.MicrosoftHacker.3000.it

### 🤝 Collaboratori
- **Comunità IRC Italiana** - Testing e feedback
- **Scene Hacker Italiana** - Ispirazione e supporto
- **Utenti mIRC** - Suggerimenti e miglioramenti

### 🛠️ Strumenti Utilizzati
- **mIRC Script** - Linguaggio principale
- **Visual Basic** - Strumenti esterni
- **Assembly** - Ottimizzazioni critiche
- **C/C++** - Strumenti di rete

## 📄 Licenza

### ⚖️ Disclaimer
```
Japigia ScripT - Copyright 1999-2000 by Stefano

Il Sottoscritto Stefano non si assume nessuna responsabilità 
sul programma e sui file ad esso associati.

Utilizzare a proprio rischio e pericolo.
Solo per scopi educativi e di ricerca.
```

### 🔒 Condizioni d'Uso
- **Solo per scopi educativi** e di ricerca
- **Non utilizzare** per attività illegali
- **Rispettare** le leggi locali
- **Responsabilità** dell'utente per l'utilizzo

---

## 📞 Contatti

- **Email**: yapigia@iol.it
- **IRC**: FigaroCoo su vari network
- **Sito**: http://www.MicrosoftHacker.3000.it

---

*Questo progetto rappresenta un pezzo di storia dell'IRC italiano e della comunità hacker degli anni '90. Utilizzatelo con rispetto e responsabilità.* 🎯

**"IL Primo ScripT Con ExE in ITaliaN0"** - Stefano, 1999-2000
