json.extract! insumos_order, :id, :cantidad, :responsable, :status, :insumo_id, :created_at, :updated_at
json.url insumos_order_url(insumos_order, format: :json)
