var cantidadNormal = Int()
var cantidadDeNotas = Int()
var contador = 0
var contador2 = 0
var nombreDeAlumnos = [String]()
var notasNormal = [Int]()

func cantidadDeAlumnos(cantidad: Int?) throws -> Int {
	if cantidad == nil {
		throw error.cantidadNil
	} else if cantidad! < 0 {
		throw error.cantidadNegativo
	} else if cantidad! == 0 {
		throw error.cantidadCero
	}

	return cantidad!
}

func notas(nota: Int?) throws -> Int {
	if nota == nil {
		throw error.notaNil
	} else if nota! < 0 {
		throw error.notaNegativo
	}

	return nota!
}

func cantidadNotas(numero: Int?) throws -> Int {
	if numero == nil {
		throw error.numeroNil
	} else if numero! < 0 {
		throw error.numeroNegativo
	} else if numero! == 0 {
		throw error.numeroCero
	}

	return numero!
}

enum error: Error {
	case cantidadNil, cantidadNegativo, cantidadCero, notaNil, notaNegativo, numeroNil, numeroNegativo, numeroCero
}

repeat {
	do {
	print("Ingresa la cantidad de alumnos para evaluar: ", terminator:"")
	cantidadNormal = try cantidadDeAlumnos(cantidad:Int (readLine()!))
	} catch error.cantidadNil {
	print("Ingresa solamente numeros")
	} catch error.cantidadNegativo {
	print("No ingreses numeros negativos")
	} catch error.cantidadCero {
	print("No ingreses 0, sino para que usaras esto?")
	}
} while cantidadNormal == nil || cantidadNormal < 0 || cantidadNormal == 0

if cantidadNormal > 0 {
	repeat {
		do {
			print("Ingresa la cantidad de notas: ", terminator:"")
			cantidadDeNotas = try cantidadNotas(numero: Int (readLine()!))
		} catch error.numeroNil {
			print("Ingresa solamente numeros")
		} catch error.numeroNegativo {
			print("No ingreses numeros negativos")
		} catch error.numeroCero {
			print("No ingreses 0, evaluaras 0 notas?")
		}
	} while cantidadDeNotas == nil || cantidadDeNotas < 0 || cantidadDeNotas == 0
}

if cantidadNormal > 0 && cantidadDeNotas > 0 {
	do {
		while contador != cantidadNormal {
			print("Ingresa el nombre del estudiante a evaluar: ", terminator:"")
			nombreDeAlumnos.append(String (readLine()!))
				repeat {
				print("Ingresa las notas del alumno \(nombreDeAlumnos[contador]): ", terminator:"")
				notasNormal.append(try notas(nota: Int (readLine()!)))
				contador2 += 1
				} while contador2 != cantidadDeNotas
			contador2 = 0
			let sumaDeNotas = notasNormal.reduce (0, +)
			let promedio = sumaDeNotas / cantidadDeNotas
			print("El promedio del estudiante \(nombreDeAlumnos[contador]) es de: \(promedio)")
			notasNormal = [Int]()
			contador += 1
		}
	} catch error.notaNil {
		print("Ingresa solamente numeros")
	} catch error.notaNegativo {
		print("No ingreses numeros negativos")
	}
}
