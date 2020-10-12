;
((d, w, c, M) => {
    M.AutoInit()
    M.Datepicker.init(d.querySelector('.datepicker'), {
        autoClose: true,
        format: 'yyyy-mm-dd'
    })


    const horario = d.getElementById('horario'),
        form = d.forms[0],
        respuesta = d.querySelector('.Response')

    const mensaje_error = msg => `
    <p class="section center  red  darken-1  white-text  Messages" >
      ${msg}
      <br>
      <i class="material-icons">sentiment_very_dissatisfied</i>
    </p>
  `

    const mensaje_ok = msg => `
    <p class="section center  green  darken-1  white-text  Messages" >
      ${msg}
      <br>
      <i class="material-icons">sentiment_very_satisfied</i>
    </p>
  `

    d.addEventListener('change', e => {
        if (e.target.matches('#actividad')) {
            let data = new FormData()
            data.append('disciplina', e.target.value)

            fetch('./app.php', {
                body: data,
                method: 'post'
            })
                .then(res => {
                    //c(res)
                    return (res.ok)
                        ? res.text()
                        : Promise.reject({ status: res.status, statusText: res.statusText })
                })
                .then(res => {
                    //c(res)
                    horario.innerHTML = `<h5 class="grey-text  text-darken-2">ELIGE UN HORARIO</h5>${res}`
                })
                .catch(err => {
                    let mensaje = mensaje_error(`Parece que hay un problema. Error ${err.status}: ${err.statusText}`)
                    //c(mensaje)
                    horario.innerHTML = mensaje
                })
        }
    })

    d.addEventListener('submit', e => {
        if (e.target.matches('form')) {
            e.preventDefault()
            alert('Registrando...')

            let data = new FormData(e.target)

            /* for (let key of data.keys()) {
              c(key)
            }
      
            for (let value of data.values()) {
              c(value)
            } */

            fetch('./app.php', {
                body: data,
                method: 'post'
            })
                .then(res => {
                    //c(res)
                    return (res.ok)
                        ? res.json()
                        : Promise.reject({ status: res.status, statusText: res.statusText })
                })
                .then(res => {
                    c(res)
                    let mensaje

                    if (res.err) {
                        mensaje = mensaje_error(res.msg)
                    } else {
                        mensaje = mensaje_ok(res.msg)
                        form.reset()
                    }

                    respuesta.innerHTML = mensaje
                })
                .catch(err => {
                    let mensaje = mensaje_error(`Parece que hay un problema. Error ${err.status}: ${err.statusText}`)
                    //c(mensaje)
                    respuesta.innerHTML = mensaje
                })
        }
    })

    d.addEventListener('click', e => {
        if (e.target.matches('.delete')) {
            e.preventDefault()

            let seElimina = confirm(`Estas seguro de eliminar el registro del correo ${e.target.dataset.registro}?`)

            if (seElimina) {
                let data = new FormData()
                data.append('registro', e.target.dataset.registro)

                fetch('./app.php', {
                    body: data,
                    method: 'post'
                })
                    .then(res => {
                        c(res.ok)
                        return (res.ok)
                            ? w.location.reload()
                            : Promise.reject({ status: res.status, statusText: res.statusText })
                    })
                    .catch(err => {
                        let mensaje = `Parece que hay un problema. Error ${err.status}: ${err.statusText}`
                        c(mensaje)
                        alert(mensaje)
                    })
            } else {
                return false
            }
        }
    })
})(document, window, console.log, M);
