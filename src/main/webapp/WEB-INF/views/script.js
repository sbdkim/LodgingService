// Get form elements
const regionInput = document.querySelector('#region-input');
const checkinInput = document.querySelector('#checkin-input');
const checkoutInput = document.querySelector('#checkout-input');
const guestsInput = document.querySelector('#guests-input');
const searchBtn = document.querySelector('#search-btn');

// Add click event listener to search button
searchBtn.addEventListener('click', function(event) {
  event.preventDefault();
  const region = regionInput.value;
  const checkinDate = checkinInput.value;
  const checkoutDate = checkoutInput.value;
  const guests = guestsInput.value;
  // Do something with search data (e.g. navigate to search results page)
});

// Add datepicker functionality to checkin and checkout inputs
const dateOptions = {
  day: '2-digit',
  month: 'short',
  year: 'numeric'
};

const checkinPicker = datepicker('#checkin-input', {
  minDate: new Date(),
  formatter: (inputValue, date) => {
    const formattedDate = date.toLocaleDateString('en-US', dateOptions);
    checkinInput.setAttribute('value', formattedDate);
    return formattedDate;
  },
  onSelect: (instance, date) => {
    const checkoutDate = new Date(date);
    checkoutDate.setDate(checkoutDate.getDate() + 1);
    checkoutPicker.setDate(checkoutDate);
    checkoutInput.focus();
  }
});

const checkoutPicker = datepicker('#checkout-input', {
  minDate: new Date(),
  formatter: (inputValue, date) => {
    const formattedDate = date.toLocaleDateString('en-US', dateOptions);
    checkoutInput.setAttribute('value', formattedDate);
    return formattedDate;
  }
});
