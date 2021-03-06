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
  const tagBtn = document.getElementById('tag-btn');
  const formBox = document.getElementById('form-box');
  const form = document.querySelector('.form-inline');
  const offToggle = document.querySelector("#tag-form > .form-inline > a");

  if(tagBtn) {
    tagBtn.addEventListener('click', () => {
      tagBtn.classList.toggle('hidden');
      formBox.classList.toggle('hidden');
    });

    form.addEventListener('submit', () => {
      formBox.classList.toggle('hidden');
      tagBtn.classList.toggle('hidden');
    });

    offToggle.addEventListener('click', () => {
      formBox.classList.toggle('hidden');
      tagBtn.classList.toggle('hidden');
    });
  }
}

const togglePicMap = () => {
  const photo = document.querySelector('.show-img-ven');
  const map = document.querySelector('.map-wrapper');
  const imgToggle = document.querySelector('.img-toggle');
  const toggleBack = document.querySelector('.tog-back')

  if (imgToggle) {
    imgToggle.addEventListener('click', () => {
      photo.classList.toggle('hidden');
      map.classList.toggle('hidden');
    });

    toggleBack.addEventListener('click', () => {
      map.classList.toggle('hidden');
      photo.classList.toggle('hidden');
    })
  }
}

export { toggleDisplay };
export { showAddTagForm };
export { togglePicMap };
