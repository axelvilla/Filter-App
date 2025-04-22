document.addEventListener('DOMContentLoaded', function () {
    fetch('config.php')
      .then(res => res.json())
      .then(data => {
        const tbody = document.querySelector('#tabla tbody');
        const buscador = document.querySelector('#buscador');
        
    
        function buscarTabla() {
          const textoBusqueda = buscador.value.toLowerCase();
          tbody.innerHTML = '';  
          
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
  
       
        buscarTabla();
        
  
        buscador.addEventListener('input', buscarTabla);
      })
      .catch(error => console.error('Error fetching data:', error));
  });