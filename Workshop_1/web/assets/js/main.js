/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
// Open Popup Modal
let btnAddProject = document.getElementById("btn-add-project");
btnAddProject.addEventListener("click", () => {
    document.querySelectorAll(".add-project-e").forEach(item => {
        item.style.display = "block";
    });
    document.querySelector(".add-project").classList.add("open");
});

document.querySelectorAll(".btn-edit-project").forEach(btn => {
    btn.addEventListener("click", function () { 
        document.querySelectorAll(".edit-project-e").forEach(item => {
            item.style.display = "block";
        });
        setTimeout(() => {
        document.querySelector(".edit-project").classList.add("open");
        document.querySelector("input[name='project_id_update']").value = this.getAttribute("data-id");
        document.querySelector("input[name='project_name_update']").value = this.getAttribute("data-name");
        document.querySelector("textarea[name='Description_update']").value = this.getAttribute("data-description");
        document.querySelector("select[name='Status_update']").value = this.getAttribute("data-status");
        document.querySelector("input[name='estimated_launch_update']").value = this.getAttribute("data-launch");
        }, 100);
    });
});

// Close Popup Modal
let closePopup = document.querySelectorAll(".modal-close");
let modalPopup = document.querySelectorAll(".modal");

for (let i = 0; i < closePopup.length; i++) {
    closePopup[i].onclick = () => {
        modalPopup[i].classList.remove("open");
        modalPopup[i].querySelectorAll(".form-message").forEach(span => {
            span.textContent = "";
        });
    };
}





