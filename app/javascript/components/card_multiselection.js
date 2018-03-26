const toggleActiveAndInput = (event) => {
  event.currentTarget.parentNode.classList.toggle("active");
  const target_surgery_id = event.currentTarget.dataset.surgeryid;
  const hiddenInput = document.querySelector('#validate_batch_input');
  if (hiddenInput.value.includes(target_surgery_id)){
    const array = hiddenInput.value.split(",");
    const index = array.indexOf(target_surgery_id);
    array.splice(index, 1);
    hiddenInput.value = array;
  } else {
    if (hiddenInput.value === "") {
      hiddenInput.value = target_surgery_id;
    } else {
      hiddenInput.value += `,${target_surgery_id}`;
    }
  }
};

function ready() {
  const inputs = document.querySelectorAll('input[type=checkbox]');
  inputs.forEach((input) => {
    input.addEventListener("click", toggleActiveAndInput)
  })
};

export { ready };
