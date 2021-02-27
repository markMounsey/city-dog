const toggleDisplay = () => {
  // const toggleBar = document.querySelector('.review-photo-tgl');
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

export { toggleDisplay };
