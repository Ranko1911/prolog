/* Juego de identificación de países del mundo
 * Para empezar, ejecuta:  ?- start.
*/

%Predicados dinámicos

:- dynamic si/1, no/1.

%Inicio de aplicación

start :- menu, !.

%Menú

menu :-
        write('Bienvenido al Adivino de Países.'), nl,
        write(' '), nl,
        write('Piensa un país de Europa. Cuando lo tengas, pulsa 1 para empezar'), nl,
        write('Si quieres salir del programa, puedes hacerlo pulsando exit'), nl,
        write(' '), nl,
        read(X),
        write('Has pulsado la instrucción: '), write(X), nl,
        verify(X),
        X == exit, !, nl, nl, writeln('¡Hasta la próxima!'), nl.

verify(exit) :- !.
verify(1) :- write('Empezamos el juego: '), nl, game, !.

%Inicio del juego
game :- countries(Country),
         (Country == unknown -> write('No he podido obtener una respuesta.'); 
                                write('El país en el que piensas es: '), write(Country)),
                                nl.

%Colocar como falso/verdadero
false(Question) :- assert(no(Question)).
true(Question) :- assert(si(Question)).

set([], _).
set([H|T], Truth) :- (H == Truth -> true(H), true; false(H)), set(T, Truth), true. 

% Hipótesis a testear
countries(albania) :- albania, !.
countries(alemania) :- alemania, !.
countries(andorra) :- andorra, !.
countries(armenia) :- armenia, !.
countries(austria) :- austria, !.
countries(azerbaiyán) :- azerbaiyán, !.
countries(bélgica) :- bélgica, !.
countries(bielorrusia) :- bielorrusia, !.
countries(bosnia_y_herzegovina) :- bosnia_y_herzegovina, !.
countries(bulgaria) :- bulgaria, !.
countries(república_checa) :- república_checa, !.
countries(croacia) :- croacia, !.
countries(dinamarca) :- dinamarca, !.
countries(eslovaquia) :- eslovaquia, !.
countries(eslovenia) :- eslovenia, !.
countries(españa) :- españa, !.
countries(estonia) :- estonia, !.
countries(finlandia) :- finlandia, !.
countries(francia) :- francia, !.
countries(georgia) :- georgia, !.
countries(grecia) :- grecia, !.
countries(hungría) :- hungría, !.
countries(irlanda) :- irlanda, !.
countries(islandia) :- islandia, !.
countries(italia) :- italia, !.
countries(letonia) :- letonia, !.
countries(liechtenstein) :- liechtenstein, !.
countries(lituania) :- lituania, !.
countries(luxemburgo) :- luxemburgo, !.
countries(macedonia_del_norte) :- macedonia_del_norte, !.
countries(malta) :- malta, !.
countries(moldavia) :- moldavia, !.
countries(mónaco) :- mónaco, !.
countries(montenegro) :- montenegro, !.
countries(noruega) :- noruega, !.
countries(países_bajos) :- países_bajos, !.
countries(polonia) :- polonia, !.
countries(portugal) :- portugal, !.
countries(reino_unido) :- reino_unido, !.
countries(rumanía) :- rumanía, !.
countries(rusia) :- rusia, !.
countries(san_marino) :- san_marino, !.
countries(serbia) :- serbia, !.
countries(suecia) :- suecia, !.
countries(suiza) :- suiza, !.
countries(ucrania) :- ucrania, !.
countries(ciudad_del_vaticano) :- ciudad_del_vaticano, !.
countries(unknown). 

%Reglas de los países
albania :- south, republic, coastal, continental, islamic.
alemania :- central, republic, coastal, continental, christian.
andorra :- south, monarchy, landlocked, continental, christian, s_spain.
armenia :- east, republic, landlocked, continental, christian, e_azerbaiyan.
austria :- central, republic, landlocked, continental, christian, c_hungary.
azerbaiyán :- east, republic, coastal, continental, islamic.
bélgica :- west, monarchy, coastal, continental, christian, w_luxembourg.
bielorrusia :- east, republic, landlocked, continental, christian, e_russia.
bosnia_y_herzegovina :- south, republic, coastal, continental, christian, not_euro, bosnian.
bulgaria :- east, republic, coastal, continental, christian, e_greece.
república_checa :- east, republic, landlocked, continental, atheist.
croacia :- south, republic, coastal, continental, christian, euro, croatian.
dinamarca :- north, monarchy, coastal, continental, christian, n_germany.
eslovaquia :- east, republic, landlocked, continental, christian, e_poland.
eslovenia :- south, republic, coastal, continental, christian, euro, slovene.
españa :- south, monarchy, coastal, continental, christian, s_portugal.
estonia :- north, republic, coastal, continental, atheist.
finlandia :- north, republic, coastal, continental, christian, finnish.
francia :- west, republic, coastal, continental, christian.
georgia :- east, republic, coastal, continental, christian, e_armenia.
grecia :- south, republic, coastal, continental, christian, s_turkey.
hungría :- east, republic, landlocked, continental, christian, e_croatia.
irlanda :- north, republic, coastal, island, christian, n_united_kingdom.
islandia :- north, republic, coastal, island, christian, n_not_united_kingdom.
italia :- south, republic, coastal, continental, christian, s_vatican.
letonia :- north, republic, coastal, continental, christian, latvian.
liechtenstein :- central, monarchy, landlocked, continental, christian, c_switzerland.
lituania :- north, republic, coastal, continental, christian, lithuanian.
luxemburgo :- central, monarchy, landlocked, continental, christian, c_france.
macedonia_del_norte :- south, republic, landlocked, continental, christian, s_greece.
malta :- south, republic, coastal, island, christian.
moldavia :- east, republic, landlocked, continental, christian, e_romania.
mónaco :- south, monarchy, coastal, continental, christian, s_france.
montenegro :- south, republic, coastal, continental, christian, not_euro, montenegrin.
noruega :- north, monarchy, coastal, continental, christian, not_euro.
países_bajos :- west, monarchy, coastal, continental, christian, w_not_luxembourg. 
polonia :- east, republic, coastal, continental, christian, e_germany.
portugal :- south, republic, coastal, continental, christian, s_spain.
reino_unido :- north, monarchy, coastal, island, christian.
rumanía :- east, republic, coastal, continental, christian, e_hungary.
rusia :- east, republic, coastal, continental, christian, e_china.
san_marino :- south, republic, landlocked, continental, christian, s_italy.
serbia :- south, republic, landlocked, continental, christian, s_romania.
suecia :- north, monarchy, coastal, continental, christian, euro.
suiza :- central, republic, landlocked, continental, christian, c_france.
ucrania :- east, republic, coastal, continental, christian, e_poland.
ciudad_del_vaticano :- south, monarchy, landlocked, continental, christian, s_italy.

%Reglas de clasificación por localización
north :- verify_place(norte), !.
east :- verify_place(este), !.
south :- verify_place(sur), !.
west :- verify_place(oeste), !.
central :- verify_place(centro), !.

%Reglas de clasificación por gobierno
republic :- no(monarquía) -> true(república), !; verify_government(república), !.
monarchy :- no(república) -> true(monarquía), !; verify_government(monarquía), !.

%Reglas de clasificación por tipo
continental :- no(isleño) -> true(continental), !; verify_type(continental), !.
island :- no(continental) -> true(isleño), !; verify_type(isleño), !.

%Reglas de clasificación por costa
coastal :- no(interior) -> true(costero), !; verify_coast(costero), !.
landlocked :- no(costero) -> true(interior), !; verify_coast(interior), !.

%Reglas de clasificación por religión
christian :- verify_religion(cristianismo), !.
islamic :- verify_religion(islam), !.
atheist :- verify_religion(ateísmo), !.

%Reglas de clasificación por Unión Europea
euro :- no(fuera_unión_europea) -> true(unión_europea), !; verify_union(unión_europea), !.
not_euro :- no(unión_europea) -> true(fuera_unión_europea), !; verify_union(fuera_unión_europea), !.

%Reglas de clasificación por idioma
montenegrin :- si(sur) -> si(fuera_unión_europea) -> verify_language(montenegrino), !.
bosnian :- si(sur) -> si(fuera_unión_europea) -> verify_language(bosnio), !.
croatian :- si(sur) -> si(unión_europea) -> verify_language(croata), !.
slovene :- si(sur) -> si(unión_europea) -> verify_language(esloveno), !.
finnish :- si(norte) -> verify_language(finlandés), !.
lithuanian :- si(norte) -> verify_language(lituano), !.
latvian :- si(norte) -> verify_language(letón), !.

%Reglas de clasificación por frontera
s_spain :- si(sur) -> verify_border(españa), !.
s_italy :- si(sur) -> verify_border(italia), !.
s_turkey :- si(sur) -> si(república) -> verify_border(turquía), !.
s_vatican :- si(sur) -> si(república) -> verify_border(vaticano), !.
s_greece :- si(sur) -> si(república) -> verify_border(grecia), !.
s_romania :- si(sur) -> si(república) -> verify_border(rumanía), !.
s_portugal :- si(sur) -> si(monarquía) -> verify_border(portugal), !.
s_france :- si(sur) -> si(monarquía) -> verify_border(francia), !.
e_greece :- si(este) -> verify_border(grecia), !.
e_poland :- si(este) -> verify_border(polonia), !.
e_romania :- si(este) -> si(interior) -> verify_border(rumanía), !.
e_croatia :- si(este) -> si(interior) -> verify_border(croacia), !.
e_azerbaiyan :- si(este) -> si(interior) -> verify_border(azerbaiyán), !.
e_russia :- si(este) -> si(interior) ->  verify_border(rusia), !.
e_china :- si(este) -> si(costero) -> verify_border(china), !.
e_armenia :- si(este) -> si(costero) -> verify_border(armenia), !.
e_germany :- si(este) -> si(costero) -> verify_border(alemania), !.
e_hungary :- si(este) -> si(costero) -> verify_border(hungría), !.
c_hungary :- si(centro) -> verify_border(hungría), !.
c_switzerland :- si(centro) -> verify_border(suiza), !.
c_france :- si(centro) -> verify_border(francia), !.
w_luxembourg :- si(oeste) -> verify_border(luxemburgo), !.
w_not_luxembourg :- no(luxemburgo) -> true(lejos_de_luxemburgo), !; verify_border(lejos_de_luxemburgo), !.
n_germany :- si(norte) -> verify_border(alemania), !.
n_united_kingdom :- si(norte) -> verify_border(reino_unido), !.
n_not_united_kingdom :- no(reino_unido) -> true(lejos_de_reino_unido), !; verify_border(lejos_de_reino_unido), !.

%Verificar
verify_place(Continent) :- (si(Continent) -> true ; (no(Continent) -> fail ; ask_place(Continent))).
verify_government(Government) :- (si(Government) -> true ; (no(Government) -> fail ; ask_government(Government))).
verify_type(Country) :- (si(Country) -> true ; (no(Country) -> fail ; ask_type(Country))).
verify_coast(Country) :- (si(Country) -> true ; (no(Country) -> fail ; ask_coast(Country))).
verify_religion(Religion) :- (si(Religion) -> true ; (no(Religion) -> fail ; ask_religion(Religion))).
verify_union(Union) :- (si(Union) -> true ; (no(Union) -> fail ; ask_union(Union))).
verify_language(Language) :- (si(Language) -> true ; (no(Language) -> fail ; ask_language(Language))).
verify_border(Country) :- (si(Country) -> true ; (no(Country) -> fail ; ask_border(Country))).

%Preguntas
ask_place(Question) :- write('¿Dentro de Europa, se sitúa en el: '), write(Question), write('? '),
                       read(Response), nl,
                       ((Response == si) -> true(Question), set([norte, este, sur, oeste, centro], Question); false(Question), fail).

ask_government(Question) :- write('¿El modelo de gobierno de ese país es la: '), write(Question), write('? '),
                            read(Response), nl,
                            ((Response == si) -> true(Question), set([república, monarquía], Question); false(Question), fail).

ask_type(Question) :- write('¿Geográficamente, el país es: '), write(Question), write('? '),
                      read(Response), nl,
                      ((Response == si) -> true(Question), set([continental, isleño], Question); false(Question), fail).

ask_coast(Question) :- write('¿Es el país: '), write(Question), write('? '),
                       read(Response), nl,
                       ((Response == si) -> true(Question), set([costero, interior], Question); false(Question), fail).

ask_religion(Question) :- write('¿La religión mayoritaria es: '), write(Question), write('? '),
                          read(Response), nl,
                          ((Response == si) -> true(Question), set([cristianismo, islam, ateísmo], Question); false(Question), fail).

ask_union(Question) :- write('¿Se encuentra en: '), write(Question), write('? '),
                       read(Response), nl,
                       ((Response == si) -> true(Question), set([unión_europea, fuera_unión_europea], Question); false(Question), fail).

ask_language(Question) :- write('¿Es la lengua oficial el: '), write(Question), write('? '),
                          read(Response), nl,
                          ((Response == si) -> true(Question), set([montenegrino, bosnio, croata, finlandés, letón, lituano, esloveno], Question); false(Question), fail).

ask_border(Question) :- write('¿Hace frontera con: '), write(Question), write('? '),
                        read(Response), nl,
                        ((Response == si) -> true(Question), set([españa, italia, turquía, vaticano, grecia, rumanía, portugal, francia, 
                                                                  polonia, croacia, azerbaiyán, rusia, china, armenia, alemania, hungría, 
                                                                  suiza, luxemburgo, lejos_de_luxemburgo, reino_unido, lejos_de_reino_unido], Question); false(Question), fail).

