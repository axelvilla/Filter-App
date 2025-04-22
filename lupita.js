document.addEventListener('DOMContentLoaded', function () {
    fetch('config.php')
      .then(res => res.json())
      .then(data => {
        const tbody = document.querySelector('#tabla tbody');
        const buscador = document.querySelector('#buscador');
        
        // Función para realizar la búsqueda
        function buscarTabla() {
          const textoBusqueda = buscador.value.toLowerCase();
          tbody.innerHTML = '';  // Limpiar el tbody antes de actualizar
          
          data.forEach((fila, i) => {
            const esCoincidente = fila.provincia.toLowerCase().includes(textoBusqueda) ||
                                  fila.capital.toLowerCase().includes(textoBusqueda) ||
                                  fila.region.toLowerCase().includes(textoBusqueda);
            
            if (esCoincidente) {
              tbody.innerHTML += `
                <tr>
                  <td>${fila.id}</td>
                  <td>${fila.provincia}</td>
                  <td>${fila.habitantes_provincia.toLocaleString()}</td>
                  <td>${fila.capital}</td>
                  <td>${fila.habitantes_capital?.toLocaleString() || 'Sin datos'}</td>
                  <td>${fila.region}</td>
                </tr>
              `;
            }
          });
        }
  
        // Inicializar la tabla al cargar
        buscarTabla();
        
        // Agregar evento de cambio de búsqueda
        buscador.addEventListener('input', buscarTabla);
      })
      .catch(error => console.error('Error fetching data:', error));
  });