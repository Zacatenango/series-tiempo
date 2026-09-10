print("fgsfds! fgsfds!")

# Pequeña introducción a R
# Las variables se asignan con una flechita, no con igual. Es una referencia a la flechita de UNIX
skvrn <- 5
# Esto nos permite violar las leyes de la sintaxis usual y hacer una asignación al revés. Siguiendo
# la analogía de la UNIX shell, es como si tirara $ echo "povrch" > prvych.txt
"povrch" -> prvych
# Podemos también encadenar múltiples asignaciones
TRUE -> raer -> tufriqana

# Como en MATLAB, en R todo es un vector. Los vectores se hacen con la función c() de "combinar"
vectorcillo <- c(1,2,3,4)
# Operar con un vector hace operaciones elemento por elemento como en MATLAB
vectorcillo_x2 <- vectorcillo * 2
# Puedo operar con los vectores
mean(vectorcillo)
length(vectorcillo)
# E igual que en MATLAB, los vectores empiezan desde 1
vectorcillo[1]
# Puedo rebanarlos. A diferencia de Python, el intervalo de rebanada es incluyente
vectorcillo[2:4]
# Puedo sacar elementos con pruebas lógicas como si fueran PANDAS. Aquí saco números pares y nones
vectorcillo[(vectorcillo %% 2) == 0]
vectorcillo[(vectorcillo %% 2) == 1]

# Puedo cargar librerías en cualquier momento
library(dplyr)

# Con fines demostrativos, voy a generar unos datos al azar
set.seed(297974)
datos <- tibble(tiempo = 1:20, valor = rnorm(20))
horizonte <- 5
datos

# El operador $ saca una columna de un dataframe/tibble por su nombre (o un elemento con nombre
# de una lista). Es como acceder a un atributo con obj.atributo en otros lenguajes. En PANDAS,
# datos$valor es equivalente a datos["valor"].
datos$valor

# El pipe sirve para pasar el resultado de la izquierda al primer parámetro de la func de la derecha
# Permite escribir expresiones complejas con un estilo de terminal UNIX, poniendo una variable
# inicial como si fuera el primer proceso que tira a stdout y las funciones como procesos filtro
datos |> slice_head(n = nrow(datos) - horizonte) -> datos_entrenamiento
datos |> slice_tail(n = horizonte) -> datos_validacion
nrow(datos_entrenamiento)
nrow(datos_validacion)

# El operador ~ ("tilde") declara una fórmula: una expresión que describe una relación entre
# variables sin evaluarla de inmediato, algo así como una plantilla. Se lee "y en función de x" y
# se usa principalmente en funciones de modelado estadístico, como aquí con lm() (regresión lineal)
modelo <- lm(valor ~ tiempo, data = datos_entrenamiento)
modelo

# Funciones: las asigno a una variable como en Javascript
# No hay "return" aquí; el retorno es implícito y es el resultado de la última expresión de la func
sumar <- function(a,b=10)
{
   a + b
}
sumar(15)
sumar(2,7)

# Los parámetros con nombres son como en Python
round(x=3.14159265354, digits=2)

# Referencia rápida de Tibble, que se usa hoy en día en vez de los PANDAS
# El tibble es un DF modernizado y opinionado, rediseñado a partir de la experiencia con PANDAS.
# Mientras que los dataframes cambian el tipo de los datos entrantes (e.g. convierte strings a
# factores), el tibble respeta el tipo de datos, no cambia nombres de variables, y no inventa
# nombres de filas.
# Puedo convertir rápido y sencillo un dataframe a tibble
iris |> as_tibble() -> tibble_iris
# Puedo crear un tibble a partir de una función matemática
# Nota: aquí no funcionan los paréntesis BSD de Javascript, tienen que ser egipcios sí o sí, similar
# al `return {` de Javascript, ya que `audio <- tibble` es R válido (asignar el handle de la 
# librería tibble a una variable llamada audio) y por lo tanto lo que sigue deja de ser válido por
# no estar operando sobre una función
audio <- tibble(
   T = seq(from=0, to=1, by=1/44100),
   y = sin(2*3.141592*500*T)
)

# Los tsibbles son tibbles especiales que tienen registro de cuál es la 
