# Página para exámenes de admisión

Plataforma de una sola página (HTML puro, sin dependencias) para **crear exámenes de admisión** y que otra persona los **rinda en línea**, con el formato de las plataformas tipo Cursalab.

## Qué incluye

**Modo docente** (enlace al pie de la pantalla de acceso)
- Título, subtítulo, duración, nota mínima y sigla del logo
- Editor de preguntas: enunciado, tema/curso, de 2 a 6 alternativas, marca de la correcta y explicación
- Carga masiva: pegar varias preguntas de golpe (la correcta se marca con `*`)
- Reordenar, duplicar y eliminar preguntas
- Imagen o figura por pregunta, incrustada en el balotario
- Guardar y cargar balotarios como archivos `.json`
- Opciones: mezclar preguntas, mezclar alternativas, ocultar resultados

**Modo postulante**
- Acceso con nombre y DNI + aceptación de reglas de ética
- Pantalla de instrucciones con el resumen del examen
- Cronómetro con envío automático al agotarse el tiempo
- Una pregunta a la vez, navegación por teclado (← → y teclas 1-5)
- Panel lateral con el estado de cada pregunta: respondida, vista, marcada para revisar
- Confirmación antes de enviar, con el conteo de pendientes
- Resultados: puntaje, nota vigesimal, aprobado/desaprobado y revisión pregunta por pregunta con la explicación

**Vigilancia durante el examen**
- Registra cada salida de la página (cambio de pestaña o minimizar), con duración y hora
- Advertencia bloqueante en cada salida, indicando cuántas le quedan
- Descalificación automática a la tercera salida o al superar 1 minuto fuera
- Ambos límites configurables; la bitácora de salidas aparece en el reporte final

## Cómo se comparte un examen

En el modo docente, **Generar código del examen** produce un texto que empieza con `EXAM1-`.
Quien lo recibe abre la misma página, toca **"Tengo un código de examen"**, lo pega y rinde.

El examen en edición se guarda en el `localStorage` del navegador donde se creó. El código es lo que viaja.

## Dónde vive cada cosa

| Qué | Dónde |
|---|---|
| Código de la página | `C:\Users\nvill\pagina-para-examen` y este repositorio |
| Balotarios (`.json`) e imágenes | `G:\Mi unidad\APPS PARA CONTROL DE GASTOS\pagina_para_examenes` |
| Publicado en | https://lkp-83-53.github.io/pagina-para-examenes/ |

El repositorio guarda **solo el código**. Los balotarios no se versionan aquí a propósito:
contienen las respuestas correctas y el repositorio es público.

## Formato del balotario

```json
{
  "titulo": "Simulacro de Admisión 01",
  "duracion": 60,
  "notaMin": 60,
  "maxSalidas": 3,
  "maxSegFuera": 60,
  "preguntas": [
    { "t": "Álgebra", "p": "Resuelve: 2x + 7 = 3x - 5",
      "o": ["x = -12", "x = 2", "x = 12", "x = 6"], "c": 2,
      "e": "7 + 5 = 3x - 2x, entonces x = 12.", "img": "" }
  ]
}
```

`c` es el índice de la alternativa correcta empezando en 0. `img` guarda la figura
incrustada como data URL, o queda vacío.

## Publicación

Es un único archivo `index.html` sin build ni dependencias: funciona abriéndolo directo
o publicado en GitHub Pages.

## Scripts

En `scripts\` hay la misma utilidad en dos sabores: `.ps1` para PowerShell y `.sh` para Git Bash.

| Script | Para qué |
|---|---|
| `vincular-git` | Enlaza la carpeta local con este repositorio. Se corre una sola vez. |
| `publicar` | `add` + `commit` + `push` en un paso. Acepta el mensaje como argumento. |
| `servir` | Levanta `http://localhost:8080` y abre el navegador. |

```powershell
# PowerShell, desde C:\Users\nvill\pagina-para-examen
.\scripts\vincular-git.ps1
.\scripts\publicar.ps1 "agrego balotario de geometria"
.\scripts\servir.ps1
```

```bash
# Git Bash, desde la misma carpeta
./scripts/vincular-git.sh
./scripts/publicar.sh "agrego balotario de geometria"
./scripts/servir.sh
```

Si PowerShell bloquea los `.ps1`, habilita los scripts del usuario una sola vez:
`Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`
