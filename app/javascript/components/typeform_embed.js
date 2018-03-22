import * as typeformEmbed from '@typeform/embed';

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
        console.log('Typeform successfully submitted')
      }
    }
  )
}

export { typeformAdd };
