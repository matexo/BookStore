(function () {
    var app = angular.module('bookStore', ['ngStorage']);
    app.controller('BookCategoryController', function () {
        this.categories = ['Albumy', 'Audiobooki', 'Biografie', 'Biznes, ekonomia, marketing', 'Dla dzieci',
            'Dla młodzieży', 'Encyklopedie, leksykony', 'Fantastyka', 'Filozofia', 'Historia', 'Informatyka',
            'Językoznawstwo, język polski', 'Kalendarze', 'Komiks', 'Kuchnia i diety', 'Literatura', 'Literatura faktu',
            'Literatura obyczajowa', 'Nauka języków', 'Nauki ścisłe, medycyna', 'Podręczniki szkolne, edukacja',
            'Poradniki', 'Prawo', 'Psychologia i pedagogika', 'Religie i wyznania', 'Romans', 'Rozwój osobisty, motywacja',
            'Sensacja, kryminał', 'Socjologia', 'Sport i wypoczynek', 'Sztuka', 'Thriller, horror', 'Turystyka i podróże',
            'Zdrowie, rodzina, związki'];
    });

    app.controller('SessionController', function () {
        this.loggedIn = localStorage.getItem('loggedIn');

        this.login = function(){
            localStorage.setItem('loggedIn', true);
        };

        this.logout = function(){
            localStorage.setItem('loggedIn', false);
        };
    });
})();