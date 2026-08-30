print("fgsfds! fgsfds!")

# Pequeña introducción a R
# Las variables se asignan con una flechita, no con igual
skvrn <- 5
# Esto nos permite violar las leyes de la sintaxis usual y hacer una asignación al revés
"povrch" -> prvych
# Podemos también encadenar múltiples asignaciones
TRUE -> raer -> tufriqana

# Como en MATLAB, en R todo es un vector. Los vectores se hacen con la función c() de "combinar"
vectorcillo <- c(1,2,3,4)
# Operar con un vector hace operaciones elemento por elemento como en MATLAB
vectorcillo_x2 = vectorcillo * 2
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
