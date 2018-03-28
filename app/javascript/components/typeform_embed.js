import * as typeformEmbed from '@typeform/embed';

function fakeSubmit(){
  console.log("We waited 3s and we are in the callback fct");
  document.getElementById('fake-submit').click();
}

function typeformAdd() {
  const embedElement = document.getElementById('typeform-embed');
  const surgery_id = embedElement.dataset.surgeryid;
  const typeform_id = embedElement.dataset.typeformid;
  typeformEmbed.makeWidget(
    embedElement,
    `https://davidbenamran.typeform.com/to/${typeform_id}?surgery_id=${surgery_id}`,
    {
      hideHeaders: true,
      hideFooter: true,
      opacity: 0,
      buttonText: "Take the survey!",
      onSubmit: function () {
        window.setTimeout(fakeSubmit, 3000)
      }
    }
  )
}

export { typeformAdd };
