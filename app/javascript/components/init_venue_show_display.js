const toggleDisplay = () => {
  // const toggleBar = document.querySelector('.review-photo-tgl');
  const reviewsBtn = document.getElementById('reviews-btn');
  const photosBtn = document.getElementById('photos-btn');

  const reviewsList = document.querySelector('.reviews');
  const photosList = document.querySelector('.photos');

  reviewsBtn.focus();

  photosBtn.addEventListener('click', () => {
    reviewsList.classList.add("hidden");
    photosList.classList.remove("hidden");
  });

  reviewsBtn.addEventListener('click', () => {
    reviewsList.classList.remove("hidden");
    photosList.classList.add("hidden");
  });
}

export { toggleDisplay };
