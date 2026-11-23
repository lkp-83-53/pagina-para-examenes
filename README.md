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

## Balotarios incluidos

La página trae exámenes ya cargados, que aparecen en un desplegable en la pantalla de acceso:

| Balotario | Contenido |
|---|---|
| **Matemáticas** | **30 de 45 preguntas.** Cuotas fijas por examen: álgebra 10, RM 6, aritmética 6, geometría 4, trigonometría 4. 60 min |
| **Letras** | 30 preguntas: RV (7), literatura (5), lenguaje (5), historia (4), comprensión lectora (4), geografía (2), economía, cívica y filosofía. 50 min |
| **Ciencias** | 30 preguntas: física (10), química (10), biología (10). 60 min |
| Examen de Admisión — Banco General | **90 preguntas, 30 por examen.** Nivel San Marcos / Callao, todas las materias |
| Álgebra — Admisión San Marcos | 26 preguntas: lógica proposicional, exponentes, productos notables, ecuaciones, división de polinomios, inecuaciones, valor absoluto, funciones, logaritmos, complejos y análisis dimensional |
| Simulacro de muestra | 7 preguntas de prueba, para ver cómo funciona |

### Composición del banco general

Cada examen toma 30 preguntas repartidas entre las 16 materias en la misma proporción
que tienen en el banco:

| Materia | En el banco | Por examen |
|---|---|---|
| Razonamiento Matemático | 12 | 4 |
| Razonamiento Verbal | 9 | 3 |
| Álgebra | 9 | 3 |
| Aritmética · Geometría · Trigonometría · Física · Química · Biología · Historia del Perú | 6 c/u | 2 c/u |
| Comprensión Lectora · Geografía · Economía · Lenguaje · Literatura · Educación Cívica | 3 c/u | 1 c/u |

### Cuotas por materia

Un examen puede fijar cuántas preguntas toma de cada materia, en vez de repartirlas
en proporción al banco:

```json
"porExamen": 30,
"cuotas": { "Álgebra": 10, "Razonamiento Matemático": 6, "Aritmética": 6,
            "Geometría": 4, "Trigonometría": 4 }
```

Sirve cuando el banco crece de forma despareja: el de Matemáticas tiene 23 preguntas de
álgebra y solo 5 de trigonometría, pero el examen sigue saliendo equilibrado. Dentro de
cada materia la rotación elige las que todavía no han salido.

## Rotación

La página recuerda qué preguntas ya salieron y el siguiente intento toma otras.
Con 90 preguntas y 30 por examen salen **tres exámenes completos sin repetir ni una**.
Al agotarse el banco, el ciclo se reinicia solo.

El campo **Preguntas por examen** del editor controla cuántas se toman: `0` significa todas.

Se pueden abrir en el editor desde el panel **Balotario** → *Abrir en el editor*, para usarlos
como punto de partida.

## Fórmulas en LaTeX

La página renderiza matemática con [KaTeX](https://katex.org), cargado desde jsDelivr.
Funciona en el enunciado, las alternativas y la explicación.

| Escribes | Resultado |
|---|---|
| `$x^2 + 3x - 10 = 0$` | fórmula dentro de la línea de texto |
| `$$\int_0^1 x\,dx = \frac{1}{2}$$` | fórmula centrada en su propio renglón |
| `\frac{a}{b}` `\sqrt{x}` `x_{1}` `x^{2}` | fracción, raíz, subíndice, exponente |
| `\sen` `\cos` `\tan` `\tg` `\ctg` `\cosec` | funciones trigonométricas en notación hispana |
| `\R` `\N` `\Z` `\Q` | conjuntos numéricos |

`\sen`, `\tg`, `\ctg` y `\cosec` no existen en KaTeX estándar: están definidos como macros
en la página, porque son la notación que se usa en los exámenes peruanos.

El botón **Vista previa** de cada pregunta muestra cómo queda renderizada antes de guardarla.

> KaTeX se carga desde internet. Si abres la página sin conexión, las fórmulas aparecen
> como texto plano (`$x^2$`) en lugar de renderizadas. El examen sigue funcionando.

## Resultados por postulante

**Modo docente → Ver resultados** abre el panel de resultados:

- Indicadores: exámenes rendidos, postulantes distintos, promedio, mejor puntaje, aprobados
- Tabla por intento: postulante, DNI, examen, fecha, puntaje, nota vigesimal, aciertos, tiempo, salidas y estado
- Filtros por nombre o DNI y por examen
- Rendimiento acumulado por materia, ordenado de peor a mejor, para ver qué reforzar
- Exportación a CSV (se abre en Excel) y a JSON

Cada examen enviado se registra automáticamente en el navegador donde se rindió.
Si el postulante usa otro equipo, al terminar le aparece un **código de resultado**
(`RES1-...`) que puede enviar por WhatsApp; se pega en el panel con *Pegar código de
resultado* y el intento se suma a la tabla.

> El historial vive en el `localStorage` del navegador, que ronda los 5 MB.
> Conviene exportarlo cada cierto tiempo a `resultados\` en Drive y limpiar el historial.

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
