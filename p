<!DOCTYPE html>
<html>
<head>
  <style>
    /* Estilos para ocultar todas las diapositivas, excepto la actual */
    .slide {
      display: none;
      text-align: center;
    }

    /* Estilos para la diapositiva actual */
    .current-slide {
      display: block;
    }

    /* Estilos para los botones de navegación */
    .navigation-buttons {
      position: fixed;
      top: 50%;
      left: 20px;
      transform: translateY(-50%);
    }

    .navigation-buttons button {
      margin-bottom: 10px;
      padding: 10px;
      background-color: #007bff;
      color: #fff;
      border: none;
      cursor: pointer;
      border-radius: 5px;
    }

    .next-button {
      float: right;
      animation: fade-in 1s ease-in-out forwards;
    }
  </style>
</head>
<body>
  <div class="slide current-slide">
    <h1>Diapositiva 1</h1>
    <p>Contenido de la diapositiva 1</p>
  </div>

  <div class="slide">
    <h1>Diapositiva 2</h1>
    <p>Contenido de la diapositiva 2</p>
  </div>

  <div class="slide">
    <h1>Diapositiva 3</h1>
    <p>Contenido de la diapositiva 3</p>
  </div>

  <div class="navigation-buttons">
    <button class="previous-button" disabled>Anterior</button>
    <button class="next-button">Siguiente</button>
  </div>

  <script>
    // Obtener todas las diapositivas
    const slides = document.querySelectorAll('.slide');
    let currentSlide = 0;
    const previousButton = document.querySelector('.previous-button');
    const nextButton = document.querySelector('.next-button');

    // Mostrar la diapositiva actual
    slides[currentSlide].classList.add('current-slide');
    previousButton.disabled = true;

    // Función para mostrar la siguiente diapositiva
    function showNextSlide() {
      slides[currentSlide].classList.remove('current-slide');
      currentSlide = (currentSlide + 1) % slides.length;
      slides[currentSlide].classList.add('current-slide');
      updateNavigationButtons();
    }

    // Función para mostrar la diapositiva anterior
    function showPreviousSlide() {
      slides[currentSlide].classList.remove('current-slide');
      currentSlide = (currentSlide - 1 + slides.length) % slides.length;
      slides[currentSlide].classList.add('current-slide');
      updateNavigationButtons();
    }

    // Actualizar los botones de navegación según la diapositiva actual
    function updateNavigationButtons() {
      if (currentSlide === 0) {
        previousButton.disabled = true;
      } else {
        previousButton.disabled = false;
      }

      if (currentSlide === slides.length - 1) {
        nextButton.disabled = true;
      } else {
        nextButton.disabled = false;
      }
    }

    // Agregar eventos de clic a los botones de navegación
    nextButton.addEventListener('click', showNextSlide);
    previousButton.addEventListener('click', showPreviousSlide);
  </script>
</body>
</html>
