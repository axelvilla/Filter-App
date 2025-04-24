const sortButton = `
<svg xmlns="http://www.w3.org/2000/svg" height="15px" viewBox="0 -960 960 960" width="15px" fill="#1f1f1f">
  <path d="M480-120 300-300l58-58 122 122 122-122 58 58-180 180ZM358-598l-58-58 180-180 180 180-58 58-122-122-122 122Z"/>
</svg>
`;

const buttons = document.querySelectorAll(".button_sort");

buttons.forEach(buttons => {
    buttons.innerHTML = sortButton;
})