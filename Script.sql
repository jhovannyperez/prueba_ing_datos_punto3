CREATE TABLE agrupacion_por_pais AS (
select pais_del_tratado as pais, 
count("Vigente") FILTER (WHERE "Vigente" = true) as "cantidad de tratados vigentes", 
count("Vigente") FILTER (WHERE "Vigente" = false) as "cantidad de tratados no vigentes", 
min("Fecha_Ley_Aprobatoria")::DATE as "fecha adopción primer tratado",
extract(YEAR FROM age(current_date ,min("Fecha_Ley_Aprobatoria")))*12 + extract(MONTH FROM age (current_date, min("Fecha_Ley_Aprobatoria"))) as "diferencia en meses desde el primer acuerdo a la
fecha actual"
from public.df_all group by pais_del_tratado
)