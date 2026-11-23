# Página para exámenes de admisión

Plataforma de una sola página (HTML puro, sin dependencias) para **crear exámenes de admisión** y que otra persona los **rinda en línea**, con el formato de las plataformas tipo Cursalab.

## Qué incluye

**Modo docente** (enlace al pie de la pantalla de acceso)
- Título, subtítulo, duración, nota mínima y sigla del logo
- Editor de preguntas: enunciado, tema/curso, de 2 a 6 alternativas, marca de la correcta y explicación
- Carga masiva: pegar varias preguntas de golpe (la correcta se marca con `*`)
- Reordenar, duplicar y eliminar preguntas
- Opciones: mezclar preguntas, mezclar alternativas, ocultar resultados, avisar si el postulante cambia de pestaña

**Modo postulante**
- Acceso con nombre y DNI + aceptación de reglas de ética
- Pantalla de instrucciones con el resumen del examen
- Cronómetro con envío automático al agotarse el tiempo
- Una pregunta a la vez, navegación por teclado (← → y teclas 1-5)
- Panel lateral con el estado de cada pregunta: respondida, vista, marcada para revisar
- Confirmación antes de enviar, con el conteo de pendientes
- Resultados: puntaje, nota vigesimal, aprobado/desaprobado y revisión pregunta por pregunta con la explicación

## Cómo se comparte un examen

En el modo docente, **Generar código del examen** produce un texto que empieza con `EXAM1-`.
Quien lo recibe abre la misma página, toca **"Tengo un código de examen"**, lo pega y rinde.

El examen en edición se guarda en el `localStorage` del navegador donde se creó. El código es lo que viaja.

## Publicación

Es un único archivo `index.html` sin build ni dependencias: funciona abriéndolo directo
o publicado en GitHub Pages.
