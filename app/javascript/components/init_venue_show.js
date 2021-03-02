const toggleDisplay = () => {
  const reviewsBtn = document.getElementById('reviews-btn');
  const photosBtn = document.getElementById('photos-btn');

  const reviewsList = document.querySelector('.reviews');
  const photosList = document.querySelector('.photos');

  if(reviewsBtn) {
    photosBtn.addEventListener('click', () => {
      reviewsBtn.classList.remove("active");
      photosBtn.classList.add("active");
      reviewsList.classList.add("hidden");
      photosList.classList.remove("hidden");
    });

    reviewsBtn.addEventListener('click', () => {
      reviewsBtn.classList.add("active")
      photosBtn.classList.remove("active");
      reviewsList.classList.remove("hidden");
      photosList.classList.add("hidden");
    });
  }
}

const showAddTagForm = () => {

  // check to make sure the right elements are being selected!!
  // const addBtn = document.getElementById('add-new');
  const tagBtn = document.getElementById('tag-btn');
  const formBox = document.getElementById('form-box');
  const form = document.querySelector('.form-inline');

  if(tagBtn) {
    tagBtn.addEventListener('click', () => {
      tagBtn.classList.toggle('hidden');
      formBox.classList.toggle('hidden');
    });

    form.addEventListener('submit', () => {
      formBox.classList.toggle('hidden');
      tagBtn.classList.toggle('hidden');
    });
  }

}

export { toggleDisplay };
export { showAddTagForm };
