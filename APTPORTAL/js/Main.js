$(document).ready(function () {
    inizializza();
});


//come document ready ma funziona anche con update parziale della pagina!!!
function pageLoad() {
    inizializza();
}

//inizializzat tutti gli elementi jquery UI
function inizializza(){  

        //carico i campi datepicker
        $(".datePicker").datepicker(
            {
                gotoCurrent: true,
                dateFormat: 'dd/mm',
                showOn: "button",
                buttonImage: "/css/redmond/images/calendar.gif",
                buttonImageOnly: true
            });

            $("#check_all").click(function () {
                var checked_status = this.checked;
                $("input").each(function () {
                    this.checked = checked_status;
                });
            }); 

        //stili bottone
        $("button, input:submit, input:button, .lbutton").button();

        //popup jquery
        if ($(".result").html() == "") {
        }
        else {
            $(".result").dialog({
                modal: true,
                dialogClass: 'dialog_cont',
                title: "Info",
                buttons: [
                            {
                                text: "Ok",
                                click: function () {
                                    //svuoto il div result per evitare ripetizioni
                                    $(".result").html("");
                                    //chiudo il dialog
                                    $(this).dialog("close");
                                }

                            }
                            ]
            });
                    }
                    //alert sui pulsanti di eliminazione
                    $("input:button").click(function () {
                        if ($(this).val() == "Elimina") {
                            if(!confirm("Sei sicuro di voler procedere?"))
                            {
                                return false;
                            }
                        }
                    })
}


//se il div result contiene HTML lo stampo altrimenti no!
function cancella_html() {
    //alert("canc");
    $(".result").html("");
}