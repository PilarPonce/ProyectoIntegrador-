window.addEventListener(`load`, function () {

    var nombre = document.getElementById("name") 
    var email = document.getElementById("email")
    var pass = document.getElementById("password")
    var form = document.getElementById("form")
    var avisando = document.getElementById("aviso")

    
    form.addEventListener("submit", enviar => {   
        enviar.preventDefault() 

        var aviso = ""

        var entrar = false                                                          //validar
        var elEmail = /^[a-zA-Z0-9.!#$%&'+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)$/ 
        
        avisando.innerHTML = ""                                                     //chequea ditintos campos con los diversos casos
        if (nombre.value.length < 1) { 
            aviso += `El nombre es invalido <br>`
            entrar = true
        }
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
    })


})