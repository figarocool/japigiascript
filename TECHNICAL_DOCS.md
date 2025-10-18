# 📋 Documentazione Tecnica - Japigia ScripT

## 🔧 Architettura del Sistema

### 🏗️ Struttura Modulare
Il sistema è progettato con un'architettura modulare che permette:
- **Caricamento dinamico** dei moduli
- **Configurazione flessibile** per diversi scenari
- **Estensibilità** tramite plugin esterni
- **Manutenzione** semplificata

### 📊 Componenti Principali

#### 1. **Sistema di Avvio (START.INI)**
```mirc
on 1:START: {
  .disable #clicking
  .disable #assault
  .disable #Pestilence.who
  .disable #mass.msg
  /.load -pm $mircdirpopups.ini
  /set %topicpro OFF
  if (%midi == ON) { /splay %midiso }
  echo 12 StEfaN0 e lieto di presentarvi
  about
  /.play -c $me $mircdirtitlebar.txt 30
  titlebar <<<- Japigia Script SstaR by Japigia @Script ->>>
}
```

#### 2. **Sistema di Variabili (remote.ini)**
- **500+ variabili** di configurazione
- **Gestione stati** per modalità operative
- **Controllo colori** e formattazione
- **Sistema di timer** e eventi

#### 3. **Sistema di Eventi (events.ini)**
```mirc
on *:DNS: {
  if (%fw.cloning == 1) {
    .set %fw.cloning 0
    .set %fw.server $iaddress
    go1
  }
}
```

## 🛡️ Sistema di Protezione

### 🔒 Protezioni Automatiche
```mirc
# Controllo NetBus
if ($portfree(12345) != $true) { 
  echo -a Probabile infezione NETBUS!
  /.splay $mircdirsounds\alert.wav
}

# Controllo Back Orifice
if (($portfree(31337) != $true) || ($portfree(666) != $true)) {
  echo -a Probabile infezione BACK ORIFICE!
  /.splay $mircdirsounds\alert.wav
}
```

### 🚫 Anti-Flood System
```mirc
# Protezione mass-deop
on *:MODE: {
  if ($1 == #) && ($2 == -o) && ($me isop $1) {
    if (%massdeop == On) {
      /mode $1 +o $me
      /echo -a Protezione MassDeOp attivata!
    }
  }
}
```

## 🤖 Sistema di Cloni

### 🔄 Architettura Cloni
```mirc
alias go {
  if ($1 == $null || $2 == $null || $3 == $null) { 
    echo 0 -a [usage, /go [firewall] [number] [server] [port]]
    halt 
  }
  skwinchk
  .set %fw.granted 0
  .set %fw.connected 0
  .set %fw.current2 0
  .set %fw.proxy $1
  .set %fw.amount $2
  .set %fw.cloning 1
  .dns $3
}
```

### 🌐 Gestione Connessioni
```mirc
on *:sockopen:firewall: {
  if ($sockerr > 0) { 
    .aline 1 @fwclones [error to open sock, sock close $sockname]
    return 
  }
  bset &binvar 1 4
  bset &binvar 2 1
  bset &binvar 3 $int(%port.byte1)
  bset &binvar 4 %port.byte2
  .sockwrite firewall &binvar
}
```

## 🎨 Sistema Grafico (RR-GUI)

### 🖼️ Interfaccia Avanzata
```mirc
alias rrgui.init {
  if ($1 == $null) && ($window(@rrgui.fade) != $null) { halt }
  rrgui.createini
  window -c @rrgui.init
  window -ph +f @rrgui.init 50 50 143 30
  drawrect -rfn @rrgui.init $rrgui.color(1) 1 0 0 145 30
  drawtext -rn @rrgui.init $rrgui.color(5) "Ms Sans Serif" 14 15 3 Initializing RR-GUI
}
```

### 🎭 Sistema di Skin
```mirc
on 1:START: {
  if (%skin == on) {
    .background -sn $mircdir\skins\ $+ %skin.name $+ \sfondo2.bmp
    .background -mt $mircdir\skins\ $+ %skin.name $+ \Tema1.bmp
    .rrgui.init
  }
}
```

## 🎵 Sistema Audio

### 🎶 Gestione MIDI
```mirc
# Caricamento automatico musica
if (%midi == ON) { 
  /splay %midiso 
}

# Sistema di riproduzione
alias splay {
  if ($1 == stop) {
    .timer 1 0 /sndplay $null
    halt
  }
  .timer 1 0 /sndplay $mircdirsounds\ $+ $1
}
```

### 🔊 Effetti Sonori
- **CONNECT.WAV** - Connessione stabilita
- **WARNING.WAV** - Avvisi di sicurezza
- **NETBUS.WAV** - Rilevamento NetBus
- **Ok.wav** - Conferme operazioni

## ⚔️ Sistema di Guerra

### 🎯 Nuke Tools
```mirc
# Menu nuke tools
nuke=.Wnuke2:/run $mircdirnuke\Wnuke2.exe
nuke=.Wnuke95:/run $mircdirnuke\Wnuke95.exe
nuke=.Freeze:/run $mircdirnuke\Freeze.exe
nuke=.Smurf:/run $mircdirnuke\WinSmurf.exe
```

### 🌊 Sistema Pestilenza
```mirc
alias pest {
  if ($1 == $null) { echo -a Usage: /pest [canale] | halt }
  .timer 1 1 /pestilence $1
}

alias pestilence {
  if ($me isop $1) {
    /mode $1 +b *!*@*
    /kick $1 $nick Pestilenza attivata!
  }
}
```

## 🌐 Strumenti di Rete

### 🔍 NeoTrace Integration
```mirc
# Integrazione NeoTrace
alias trace {
  if ($1 == $null) { echo -a Usage: /trace [host] | halt }
  /run $mircdirutil\NeoTrace.exe $1
}
```

### 🔎 Port Scanner
```mirc
# Port scanner integrato
alias scan {
  if ($1 == $null) { echo -a Usage: /scan [host] [port] | halt }
  /run $mircdirutil\p.exe $1 $2
}
```

## 📊 Sistema di Logging

### 📝 Log Avanzati
```mirc
# Sistema di logging automatico
on *:TEXT:*:#: {
  if (%logging == on) {
    /write $mircdirlogs\ $+ $chan $+ .log [ $+ $time $+ ] < $+ $nick $+ > $1-
  }
}
```

### 📈 Statistiche
```mirc
# Contatori statistiche
on *:JOIN:#: {
  inc %joins
  /echo -a Totale join: %joins
}
```

## 🔧 Sistema di Configurazione

### ⚙️ Setup Automatico
```mirc
alias setup {
  echo -a === CONFIGURAZIONE JAPIGIA SCRIPT ===
  set %nick $$?="Nickname:"
  set %server $$?="Server IRC:"
  set %port $$?="Porta (default 6667):"
  set %autojoin $$?="Canali auto-join (separati da virgola):"
  echo -a Configurazione completata!
}
```

### 🎛️ Pannello di Controllo
```mirc
alias panel {
  /window -c @script_panel
  /window -kl10g4 +el @Script_Panel 1 1 100 397 Tahoma 11
  /aline -l @Script_Panel Consoles
  /aline -l @Script_Panel Bot: %botmode
  /aline -l @Script_Panel Stealth: %stealth
  /aline -l @Script_Panel Offscreen: %offscreen
}
```

## 🚀 Ottimizzazioni

### ⚡ Fast Start
```mirc
#faststart on
on 1:START: {
  .disable #clicking
  .disable #assault
  .echo -s System Ready... (Fast Start)
}
#faststart end
```

### 🔄 Gestione Memoria
```mirc
# Pulizia automatica variabili
alias cleanup {
  unset %temp.*
  unset %fw.*
  unset %clone.*
  echo -a Memoria pulita!
}
```

## 🐛 Debug e Troubleshooting

### 🔍 Sistema di Debug
```mirc
alias debug {
  echo -a === DEBUG INFO ===
  echo -a Nick: $nick
  echo -a Server: $server
  echo -a Canali: $chan(0)
  echo -a Variabili: $var(0)
  echo -a Timer attivi: $timer(0)
}
```

### 📋 Log Errori
```mirc
on *:ERROR: {
  /write $mircdirlogs\error.log [ $+ $time $+ ] ERROR: $1-
}
```

## 📚 API Reference

### 🎯 Comandi Principali
| Comando | Descrizione | Parametri |
|---------|-------------|-----------|
| `/panel` | Pannello controllo | Nessuno |
| `/setup` | Configurazione | Nessuno |
| `/go` | Avvia cloni | firewall, numero, server |
| `/war` | Sistema guerra | Nessuno |
| `/protection` | Protezioni | on/off |
| `/lag` | Controllo lag | Nessuno |

### 🔧 Variabili Globali
| Variabile | Tipo | Descrizione |
|-----------|------|-------------|
| `%botmode` | Boolean | Modalità bot |
| `%stealth` | Boolean | Modalità stealth |
| `%fw.amount` | Number | Numero cloni |
| `%fw.proxy` | String | Proxy firewall |
| `%massdeop` | Boolean | Protezione mass-deop |

### 🎨 Funzioni Grafiche
| Funzione | Descrizione | Parametri |
|----------|-------------|-----------|
| `rrgui.init` | Inizializza GUI | Nessuno |
| `rrgui.fade` | Effetto fade | colore1, colore2 |
| `drawrect` | Disegna rettangolo | finestra, colore, x, y, w, h |
| `drawtext` | Disegna testo | finestra, colore, font, size, x, y, testo |

---

*Questa documentazione tecnica fornisce una panoramica completa dell'architettura e delle funzionalità del sistema Japigia ScripT.*
