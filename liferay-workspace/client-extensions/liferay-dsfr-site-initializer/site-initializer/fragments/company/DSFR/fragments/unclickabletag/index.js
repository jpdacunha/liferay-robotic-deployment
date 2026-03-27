


if (configuration.collectionRepeat) {
   fragmentElement.classList.add("fr-tags-group");
   let tag = fragmentElement.querySelector(".fr-tag");
   if (tag) {
      tag.parentElement.innerHTML = tag.parentElement.innerHTML.replace(", ", `</p><p class='fr-tag' style='font-size:${configuration.fontSize}'>`);
   }
}