const toggleActiveAndInput = (event) => {
  if (event.currentTarget.name !== "select-all") {
    event.currentTarget.parentNode.querySelector('.surgery-content').classList.toggle("active");
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
    const hiddenInputs = document.querySelectorAll('#batch_input');
    hiddenInputs.forEach(function(e){
      e.value = hiddenInput.value;
    });
  }
};

function ready() {
  const inputs = document.querySelectorAll('input[type=checkbox]');
  inputs.forEach((input) => {
    input.addEventListener("click", toggleActiveAndInput);
  })
};

export { ready };

const toggleAll = (event) => {
  const inputs = document.querySelectorAll('input[type=checkbox]');
  inputs.forEach((input) => {
    if (input.name !== "select-all") {
      input.click();
    }
  })
  console.log("Entrée fonction")
}

function selectAll() {
  const check = document.querySelector('input[type=checkbox]');
  if (check) {
    check.addEventListener("click", toggleAll);
  }

};

export { selectAll };
