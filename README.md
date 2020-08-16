# gonet
gonet application for test a new work oportunitie

José Pablo Pérez Estrada


Preguntas Gonet
1.- Las capas de la aplicación (por ejemplo capa de persistencia, vistas, red, negocio, etc) y qué clases perte-necen a cual.

La aplicación esta separa en las capas de :
  - Modelo
  -Vista
  -Controlador
  -Peticiones APIREST
  -Persistencia de datos 
  
  
  para la capa de modelo se tiene DB.swift
  para peticiones al APIREST es ApiPetitions.swift
  para modelos de datos se tiene en movieModels.swift
  y para los controladores se tienen :
    - viewController.swift
    - moviesViewController.swift
    - DetailViewController.swift

2.- ¿En qué consiste y cuál es el propósito de el principio de responsabilidad única?

  El principio de responsabilidad unica es uno de los 5 de SOLID y nos dice a grozo modo que 
  el principio de responsabilidad que un objeto debe realizar una única cosa y que esta debe estar 
  contenida únicamente en la clase.
  
3.- ¿Qué características tiene, según su opinión, un código limpio?
    - La primera caracteristica y mas importante para mi es que el codigo no debe repetirse ya que 
      en ocaciones se repite la misma función en virias clases o controllers, cuando esta puede realizarce 
      en una sola clase y ser reutlizada, entonces para mi lo mas importante en un codigo limpio es la reutilzación.
    - Los controladores o clases no deben estar muy cargadas es decir entre mas chicas es mejor, asi es mas facil de 
      leer el codigo.
      
4.- Describa la razón del patrón de diseño usado.
La aplicación es muy pequeña y solo pide hacer peticiones al servidor y mostrar la información, no pasa parametros de regreso a las vistas 
anteriores y por lo tanto decidi utilizar MVC en caso de tener que hacer vistas independientes con paso de parametros de ida y vuelta quiza hubiera utilizado delegations.

  
