function openModal(modalId) {
  document.getElementById("content-scrim").style.display = "flex";
  document.getElementById(modalId).style.display = "flex";
}
function closeModal() {
  document.getElementById("content-scrim").style.display = "none";
  document.querySelectorAll(".modal-content").forEach((modal) => {
    modal.style.display = "none";
  });
}
function openIgluModal() {
  openModal("iglu-modal");
}
function openHuskyModal() {
  openModal("husky-modal");
}
function openSantasModal() {
  openModal("santas-modal");
}
function openMountainModal() {
  openModal("mountain-modal");
}
