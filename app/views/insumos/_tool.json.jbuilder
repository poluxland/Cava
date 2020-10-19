json.extract! insumo, :id, :cantidad, :nombre, :valor, :disponible, :bodega, :created_at, :updated_at
json.url insumo_url(insumo, format: :json)
