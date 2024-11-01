import { z } from 'zod';

const diagnosticoSchema = z.object({
  descripcion: z.string(),
  estado: z.enum(['Preliminar', 'Confirmado']), 
});

const alergiaSchema = z.object({
  nombreAlergia: z.string(),
  fechaAlergia: z.string().refine((date) => !isNaN(Date.parse(date)), {
    message: 'La fecha de alergia debe ser válida',
  }),
  importanciaAlergia: z.enum(['Leve', 'Normal', 'Alta']),
});

const antecedentePatologicoSchema = z.object({
  descripcionAntecedente: z.string(),
  fechaDesde: z.string().refine((date) => !isNaN(Date.parse(date)), {
    message: 'La fecha inicial debe ser válida',
  }),
  fechaHasta: z.string().refine((date) => !isNaN(Date.parse(date)), {
    message: 'La fecha final debe ser válida',
  }),
}).refine((data) => new Date(data.fechaHasta) >= new Date(data.fechaDesde), {
  message: 'La fecha final no puede ser anterior a la fecha inicial',
  path: ['fechaHasta'],
});

const habitoSchema = z.object({
  descripcionHabito: z.string(),
  fechaDesde: z.string().refine((date) => !isNaN(Date.parse(date)), {
    message: 'La fecha inicial debe ser válida',
  }),
  fechaHasta: z.string().refine((date) => !isNaN(Date.parse(date)), {
    message: 'La fecha final debe ser válida',
  }),
}).refine((data) => new Date(data.fechaHasta) >= new Date(data.fechaDesde), {
  message: 'La fecha final no puede ser anterior a la fecha inicial',
  path: ['fechaHasta'],
});

const medicamentoSchema = z.object({
  nombreMedicamento: z.string(),
  dosisMedicamento: z.string(),
  frecuenciaMedicamento: z.string(),
});

const datosPacienteSchema = z.object({
  evolucion: z.string().min(1, { message: "Debe ingresar la evolución" }),
  diagnosticos: z.array(diagnosticoSchema).min(1, { message: "Debe ingresar al menos un diagnóstico" }),
  alergias: z.array(alergiaSchema),
  antecedentesPatologicos: z.array(antecedentePatologicoSchema),
  habitos: z.array(habitoSchema),
  medicamentos: z.array(medicamentoSchema),
});

export function validateDatosPaciente(input) {
  return datosPacienteSchema.safeParse(input);
}
