document.addEventListener('DOMContentLoaded', function () {
    document.querySelectorAll('.button_sort').forEach((button, index) => {
        let ascending = true;

        button.addEventListener('click', () => {
            const table = button.closest('table');
            const tbody = table.querySelector('tbody');
            const rows = Array.from(tbody.querySelectorAll('tr'));

            const isNumeric = rows.every(row => {
                const cell = row.children[index].textContent.trim();
                return cell === '' || !isNaN(cell.replace(/,/g, ''));
            });

            const sortedRows = rows.sort((a, b) => {
                let valA = a.children[index].textContent.trim();
                let valB = b.children[index].textContent.trim();

                if (isNumeric) {
                    valA = parseFloat(valA.replace(/,/g, '')) || 0;
                    valB = parseFloat(valB.replace(/,/g, '')) || 0;
                }

                if (valA < valB) return ascending ? -1 : 1;
                if (valA > valB) return ascending ? 1 : -1;
                return 0;
            });

            tbody.innerHTML = '';
            sortedRows.forEach(row => tbody.appendChild(row));

            ascending = !ascending;
        });
    });
});
