//<!--UNIVERSIDADE DE MOGI DAS CRUZES - UMC
//ANDRÉ HIDEKI HATAISHI DA SILVA - 11231100985
//RODRIGO GAZOLLI DE OLIVEIRA - 11231101823
//ANÁLISE E IMPLEMENTAÇÃO DE SOFTWARE
//PROFESSOR: ADILSON LIMA
//19/11/2024
//PROJETO INVCONTROL-->

window.addEventListener('DOMContentLoaded', event => {
    // Simple-DataTables
    // https://github.com/fiduswriter/Simple-DataTables/wiki

    const datatablesSimple = document.getElementById('datatablesSimple');
    if (datatablesSimple) {
        new simpleDatatables.DataTable(datatablesSimple, {
            labels: {
                placeholder: "Buscar...", // Texto na barra de busca
                searchTitle: "Pesquisar na tabela", // Texto ao passar o mouse na barra de busca
                pageTitle: "Página {page}", // Texto de paginação
                perPage: "Produtos por p\u00e1gina", // Texto para produtos por página
                noRows: "Nenhum produto encontrada", // Texto exibido quando não há linhas
                info: "Mostrando {start} a {end} de {rows} produtos", // Informação de exibição
                noResults: "Nenhum resultado encontrado" // Texto para busca sem resultados
            }

        });
    }
});
