const toggleDisplay = () => {
  const reviews = document.getElementById('reviews')
  const photos = document.getElementById('photos')
  console.log(reviews);
  console.log(photos);

  if(reviews && photos) {
    if (document.activeElement != reviews && document.activeElement != photos) {
      reviews.focus();
    }

  }

}

export { toggleDisplay };
