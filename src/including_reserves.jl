function create_price_zones()
    price_zones = ["AREA1","AREA2","Others"]
    return price_zones
end


function build_price_zone_map(model::Model)::PriceZoneMap
    
    price_zones = ["AREA1","AREA2","Others"]
    area_to_zone = fill(0, model.NArea)
    area_to_zone[1] = findfirst(==("AREA1"), price_zones)
    area_to_zone[2] = findfirst(==("AREA1"), price_zones)
    area_to_zone[3] = findfirst(==("AREA2"), price_zones)
    area_to_zone[4] = findfirst(==("Others"), price_zones)
    
    NZ = length(price_zones)
    @assert length(area_to_zone) == model.NArea
    
    # prissone -> områder
    areas_in_zone = [Int[] for _ in 1:NZ]
    for a in 1:model.NArea
        z = area_to_zone[a]
        @assert 1 <= z <= NZ "Område $a har ugyldig zone-index $z"
        push!(areas_in_zone[z], a)
    end

    # hydrosys -> område
    hydrosys_to_area = fill(0, model.NHSys)
    for a in 1:model.NArea
        for j in 1:model.NAreaSys[a]
            hydrosys_to_area[model.AreaSys[a,j]] = a
        end
    end
    @assert all(hydrosys_to_area .!= 0) "Minst ett hydrosystem mangler område-mapping"

    h2_to_area = Int[] 
    # h2 -> område (kan være tom)
    if !isnothing(model.H2Data) && hasproperty(model.H2Data, :NH2Area) && hasproperty(model.H2Data, :H2Ind)
        h2_to_area = fill(0, model.H2Data.NH2Area)
        for a in 1:model.H2Data.NH2Area
            iH2 = model.H2Data.H2Ind[a]
            if iH2 > 0
                h2_to_area[iH2] = a
            end
        end
    end

    return PriceZoneMap(price_zones, area_to_zone, areas_in_zone, hydrosys_to_area, h2_to_area)
end





#=
function create_reserves_in_model(model)
    pz = PriceZonalMapping.build_price_zone_map(model.NArea,model.NHSys,model.NAreaSys,model.AreaSys,model.H2Data)
    areas_in_zone = pz.areas_in_zone
    hydrosys_to_area = pz.hydrosys_to_area
    h2_to_area = pz.h2_to_area
    NZ = length(pz.price_zones)

    

    
end
=#


