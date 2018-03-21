import * as typeformEmbed from '@typeform/embed';

function typeformAdd() {
  const embedElement = document.getElementById('pre-form-embed');
  typeformEmbed.makeWidget(
    embedElement,
    'https://davidbenamran.typeform.com/to/Dcyfaj',
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
