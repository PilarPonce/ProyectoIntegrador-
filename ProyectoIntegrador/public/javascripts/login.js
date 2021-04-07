window.addEventListener(`load`, function () {
    var email = document.getElementById("email")
    var pass = document.getElementById("password")

    form.addEventListener("submit", enviar => {
        enviar.preventDefault()

        var aviso = ""

        var entrar = false                                                          //validar
        var elEmail = /^[a-zA-Z0-9.!#$%&'+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)$/
        avisando.innerHTML = ""                                                     //chequea ditintos campos con los diversos casos
        if (!elEmail.test(email.value)) {
            aviso += `El email es invalido <br>`
            entrar = true
        }
        if (pass.value.length < 6) {
            aviso += `La contraseña es invalida <br>`
            entrar = true
        }

        if (entrar) {
            avisando.innerHTML = aviso
        } else {
            avisando.innerHTML = "Enviado"
            localStorage.setItem("UserName", nombre.value)
        }
    }) })