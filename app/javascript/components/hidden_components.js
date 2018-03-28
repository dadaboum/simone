function hideElements() {
  document.getElementById('searchbar').style.visibility = "hidden";
  const fillBtn = document.getElementById('fill-in-btn');
  if (fillBtn) { fillBtn.style.visibility = "hidden" };
  const seeBtn = document.getElementById('see-answers-btn');
  if (seeBtn) { seeBtn.style.visibility = "hidden" };
}

export { hideElements }
