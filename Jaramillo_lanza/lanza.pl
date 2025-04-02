#!/usr/bin/perl 

#**************************************************************
#                       Pontificia Universidad Javeriana
#     Materia: Sistemas Operativos
#     Archivo: Automatización de ejecuciones por lotes
#     Autor: Gabriel Jaramillo Cuberos
#     Descripción: Script para ejecutar programas de manera automatizada
#****************************************************************/

# Obtiene la ruta del directorio actual utilizando el comando pwd
$Path = `pwd`; 

# Elimina el carácter de nueva línea al final de la cadena almacenada en $Path
chomp($Path);

# Lista con los nombres de los ejecutables a procesar
@Nombre_Ejecutable = ("mm_clasico");

# Lista con los tamaños de matriz que se usarán en las pruebas
@Size_Matriz = (500, 1000);

# Lista con la cantidad de hilos que se asignarán para la ejecución
@Num_Hilos = (1,2);

# Número de veces que se repetirá la ejecución para cada configuración
$Repeticiones = 30;

# Itera sobre cada ejecutable en la lista
foreach $Nombre_Ejecutable (@Nombre_Ejecutable) {
    # Itera sobre cada tamaño de matriz
    foreach $size (@Size_Matriz) {
        # Itera sobre cada cantidad de hilos
        foreach $hilo (@Num_Hilos) {
            
            # Define el nombre del archivo de salida que almacenará los resultados
            $file = "$Path/$Nombre_Ejecutable-".$size."-Hilos-".$hilo.".dat";
            
            # Ejecuta el programa la cantidad de veces especificada en $Repeticiones
            for ($i = 0; $i < $Repeticiones; $i++) {
                
                # Ejecuta el programa con los parámetros correspondientes y guarda la salida en el archivo
                system("$Path/$Nombre_Ejecutable $size $hilo  >> $file");
                
                # printf("$Path/$Nombre_Ejecutable $size $hilo \n");
            }
            
            # Cierra el archivo de salida
            close($file);
            
            $p = $p + 1;
        }
    }
}
