fetch('config.php')
  .then(res => res.json())
  .then(data => {
    console.log(data); 
    const tbody = document.querySelector('#tabla tbody');
    data.forEach((fila, i) => {
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
    });
  });

  