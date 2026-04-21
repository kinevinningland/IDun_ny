module PriceZonalMapping
export PriceZoneMap, build_price_zone_map

"""
Holder all mapping mellom modellområder og prissoner.
"""
struct PriceZoneMap
    price_zones::Vector{String}
    area_to_zone::Vector{Int}
    areas_in_zone::Vector{Vector{Int}}
    hydrosys_to_area::Vector{Int}
    h2_to_area::Vector{Int}
end

"""
Bygger mapping for prissoner.

Input:
- NArea: antall modellområder
- NHSys: antall hydrosystemer
- NAreaSys, AreaSys: mapping område -> hydrosystemer (som i modellen)
- area_to_zone: vektor lengde NArea med zone-index (1..NZ)

Return:
- PriceZoneMap
"""
function build_price_zone_map(
    NArea,
    NHSys,
    NAreaSys,
    AreaSys,
    H2Data
)

    price_zones = ["NO1","NO2","NO3","NO4","Others"]#,"SE1","SE2","SE3","SE4","DK1","DK2","FI","Others"]#["NUMEDAL","OTRA","TERM","TEV"]#
    area_to_zone = fill(0, NArea)
    #area_to_zone[1] = findfirst(==("NUMEDAL"), price_zones)
    #area_to_zone[2] = findfirst(==("OTRA"), price_zones)
    #area_to_zone[3] = findfirst(==("TEV"), price_zones)
    #area_to_zone[4] = findfirst(==("TERM"), price_zones)

    area_to_zone[21] = findfirst(==("Others"), price_zones)
    area_to_zone[22] = findfirst(==("Others"), price_zones)
    area_to_zone[23] = findfirst(==("Others"), price_zones)
    area_to_zone[24] = findfirst(==("Others"), price_zones)
    area_to_zone[25] = findfirst(==("Others"), price_zones)
    area_to_zone[26] = findfirst(==("Others"), price_zones)
    area_to_zone[27] = findfirst(==("Others"), price_zones)     
    area_to_zone[28] = findfirst(==("Others"), price_zones)
    area_to_zone[29] = findfirst(==("Others"), price_zones)
    area_to_zone[30] = findfirst(==("Others"), price_zones)
    area_to_zone[31] = findfirst(==("Others"), price_zones)
    area_to_zone[32] = findfirst(==("Others"), price_zones)
    area_to_zone[43] = findfirst(==("Others"), price_zones)
    area_to_zone[44] = findfirst(==("Others"), price_zones) 
    area_to_zone[45] = findfirst(==("Others"), price_zones)
    area_to_zone[46] = findfirst(==("Others"), price_zones)
    area_to_zone[47] = findfirst(==("Others"), price_zones)
    area_to_zone[48] = findfirst(==("Others"), price_zones)
    area_to_zone[49] = findfirst(==("Others"), price_zones)
    area_to_zone[50] = findfirst(==("Others"), price_zones)
    area_to_zone[51] = findfirst(==("Others"), price_zones)
    area_to_zone[52] = findfirst(==("Others"), price_zones)
    area_to_zone[53] = findfirst(==("Others"), price_zones)
    area_to_zone[54] = findfirst(==("Others"), price_zones) 
    area_to_zone[55] = findfirst(==("Others"), price_zones)
    area_to_zone[58] = findfirst(==("Others"), price_zones)
    area_to_zone[59] = findfirst(==("Others"), price_zones)
    area_to_zone[60] = findfirst(==("Others"), price_zones)
    area_to_zone[61] = findfirst(==("Others"), price_zones)
    area_to_zone[63] = findfirst(==("Others"), price_zones)
    area_to_zone[64] = findfirst(==("Others"), price_zones)
    area_to_zone[65] = findfirst(==("Others"), price_zones)
    area_to_zone[69] = findfirst(==("Others"), price_zones)
    area_to_zone[70] = findfirst(==("Others"), price_zones)
    area_to_zone[71] = findfirst(==("Others"), price_zones)
    area_to_zone[76] = findfirst(==("Others"), price_zones)
    area_to_zone[77] = findfirst(==("Others"), price_zones)
    area_to_zone[78] = findfirst(==("Others"), price_zones)
    area_to_zone[72] = findfirst(==("Others"), price_zones)


    #=
    area_to_zone[33] = findfirst(==("NO3"), price_zones) #OK
    area_to_zone[34] = findfirst(==("NO5"), price_zones) #OK
    area_to_zone[35] = findfirst(==("NO2"), price_zones) #OK
    area_to_zone[36] = findfirst(==("NO2"), price_zones) #OK
    area_to_zone[39] = findfirst(==("SE4"), price_zones) #OK
    area_to_zone[56] = findfirst(==("DK1"), price_zones) # DK1 eller DK2? Hydrogen danmark
    area_to_zone[66] = findfirst(==("NO3"), price_zones) # H2-M?
    area_to_zone[67] = findfirst(==("NO2"), price_zones) #H2-S?
    area_to_zone[68] = findfirst(==("NO4"), price_zones) #H2-N?
    area_to_zone[73] = findfirst(==("NO4"), price_zones) #OK
    area_to_zone[74] = findfirst(==("NO4"), price_zones) #OK
    area_to_zone[75] = findfirst(==("NO4"), price_zones) #OK
    area_to_zone[57] = findfirst(==("FI"), price_zones) #OK
    area_to_zone[62] = findfirst(==("SE1"), price_zones) #Sweden-H2?
       

    area_to_zone[1] = findfirst(==("NO1"), price_zones) #OK
    area_to_zone[2] = findfirst(==("NO1"), price_zones) #spørre om NO1 eller NO2, SørØst
    area_to_zone[3] = findfirst(==("NO1"), price_zones) #spørre, NO1,NO3,NO5? Hallingdal
    area_to_zone[4] = findfirst(==("NO2"), price_zones) #spørre NO1,NO2? Telemark

    area_to_zone[5] = findfirst(==("NO2"), price_zones) #OK
    area_to_zone[6] = findfirst(==("NO2"), price_zones) #OK

    area_to_zone[8] = findfirst(==("NO3"), price_zones) #OK
    area_to_zone[9] = findfirst(==("NO4"), price_zones) #OK

    area_to_zone[10] = findfirst(==("NO4"), price_zones) #OK
    area_to_zone[11] = findfirst(==("NO4"), price_zones) #OK

    area_to_zone[7] = findfirst(==("NO5"), price_zones) #OK

    area_to_zone[12] = findfirst(==("SE1"), price_zones) #OK
    area_to_zone[13] = findfirst(==("SE1"), price_zones) #OK
    area_to_zone[37] = findfirst(==("SE1"), price_zones) #OK

    area_to_zone[14] = findfirst(==("SE2"), price_zones) #OK
    area_to_zone[15] = findfirst(==("SE2"), price_zones) #OK

    area_to_zone[16] = findfirst(==("SE3"), price_zones) #OK
    area_to_zone[38] = findfirst(==("SE3"), price_zones) #OK

    area_to_zone[17] = findfirst(==("SE4"), price_zones) #OK

    area_to_zone[20] = findfirst(==("DK1"), price_zones) #OK
    area_to_zone[42] = findfirst(==("DK1"), price_zones) #OK

    area_to_zone[19] = findfirst(==("DK2"), price_zones) #OK
    area_to_zone[41] = findfirst(==("DK2"), price_zones) #OK

    area_to_zone[18] = findfirst(==("FI"), price_zones) #OK
    area_to_zone[40] = findfirst(==("FI"), price_zones) #OK
    =#

    area_to_zone[33] = findfirst(==("NO3"), price_zones) #OK
    area_to_zone[34] = findfirst(==("NO2"), price_zones) #OK #var NO5
    area_to_zone[35] = findfirst(==("NO2"), price_zones) #OK
    area_to_zone[36] = findfirst(==("NO2"), price_zones) #OK
    area_to_zone[39] = findfirst(==("Others"), price_zones) #OK
    area_to_zone[56] = findfirst(==("Others"), price_zones) # DK1 eller DK2? Hydrogen danmark
    area_to_zone[66] = findfirst(==("NO3"), price_zones) # H2-M?
    area_to_zone[67] = findfirst(==("NO2"), price_zones) #H2-S?
    area_to_zone[68] = findfirst(==("NO4"), price_zones) #H2-N?
    area_to_zone[73] = findfirst(==("NO4"), price_zones) #OK
    area_to_zone[74] = findfirst(==("NO4"), price_zones) #OK
    area_to_zone[75] = findfirst(==("NO4"), price_zones) #OK
    area_to_zone[57] = findfirst(==("Others"), price_zones) #OK
    area_to_zone[62] = findfirst(==("Others"), price_zones) #Sweden-H2?
       

    area_to_zone[1] = findfirst(==("NO1"), price_zones) #OK
    area_to_zone[2] = findfirst(==("NO1"), price_zones) #spørre om NO1 eller NO2, SørØst
    area_to_zone[3] = findfirst(==("NO1"), price_zones) #spørre, NO1,NO3,NO5? Hallingdal
    area_to_zone[4] = findfirst(==("NO2"), price_zones) #spørre NO1,NO2? Telemark

    area_to_zone[5] = findfirst(==("NO2"), price_zones) #OK
    area_to_zone[6] = findfirst(==("NO2"), price_zones) #OK

    area_to_zone[8] = findfirst(==("NO3"), price_zones) #OK
    area_to_zone[9] = findfirst(==("NO4"), price_zones) #OK

    area_to_zone[10] = findfirst(==("NO4"), price_zones) #OK
    area_to_zone[11] = findfirst(==("NO4"), price_zones) #OK

    area_to_zone[7] = findfirst(==("NO2"), price_zones) #OK #Var NO5

    area_to_zone[12] = findfirst(==("Others"), price_zones) #OK
    area_to_zone[13] = findfirst(==("Others"), price_zones) #OK
    area_to_zone[37] = findfirst(==("Others"), price_zones) #OK

    area_to_zone[14] = findfirst(==("Others"), price_zones) #OK
    area_to_zone[15] = findfirst(==("Others"), price_zones) #OK

    area_to_zone[16] = findfirst(==("Others"), price_zones) #OK
    area_to_zone[38] = findfirst(==("Others"), price_zones) #OK

    area_to_zone[17] = findfirst(==("Others"), price_zones) #OK

    area_to_zone[20] = findfirst(==("Others"), price_zones) #OK
    area_to_zone[42] = findfirst(==("Others"), price_zones) #OK

    area_to_zone[19] = findfirst(==("Others"), price_zones) #OK
    area_to_zone[41] = findfirst(==("Others"), price_zones) #OK

    area_to_zone[18] = findfirst(==("Others"), price_zones) #OK
    area_to_zone[40] = findfirst(==("Others"), price_zones) #OK

    NZ = length(price_zones)
    @assert length(area_to_zone) == NArea

    # prissone -> områder
    areas_in_zone = [Int[] for _ in 1:NZ]
    for a in 1:NArea
        z = area_to_zone[a]
        @assert 1 <= z <= NZ "Område $a har ugyldig zone-index $z"
        push!(areas_in_zone[z], a)
    end

    # hydrosys -> område
    hydrosys_to_area = fill(0, NHSys)
    for a in 1:NArea
        for j in 1:NAreaSys[a]
            hydrosys_to_area[AreaSys[a,j]] = a
        end
    end
    @assert all(hydrosys_to_area .!= 0) "Minst ett hydrosystem mangler område-mapping"

    #=
    h2_to_area = Int[] 
    # h2 -> område (kan være tom)
    if !isnothing(H2Data) && hasproperty(H2Data, :NH2Area) && hasproperty(H2Data, :H2Ind)
        h2_to_area = fill(0, H2Data.NH2Area)
        for a in 1:H2Data.NH2Area
            iH2 = H2Data.H2Ind[a]
            if iH2 > 0
                h2_to_area[iH2] = a
            end
        end
    end
    =#
    h2_to_area = Int[]
    if !isnothing(H2Data) && hasproperty(H2Data, :NArea) && hasproperty(H2Data, :Ind) && H2Data.NArea > 0
        h2_to_area = fill(0, H2Data.NArea)  # h2_index -> model area
        for a in 1:NArea
            iH2 = H2Data.Ind[a]             # 0 hvis ikke H2 i området
            if iH2 > 0
                h2_to_area[iH2] = a
            end
        end
    end
    @assert isempty(h2_to_area) || all(h2_to_area .!= 0) "Minst ett H2-område mangler mapping"
    

    return PriceZoneMap(price_zones, area_to_zone, areas_in_zone, hydrosys_to_area, h2_to_area)
end

struct PriceZoneMapDetailed
    price_zones::Vector{String}
    area_to_zone::Vector{Int}
    areas_in_zone::Vector{Vector{Int}}
    hydro_areas_in_zone::Vector{Vector{Int}}
    h2_areas_in_zone::Vector{Vector{Int}}
    h2_to_area::Vector{Int}
end

function build_price_zone_map_detailed(
    NArea,
    NHSys,
    H2Data
)

    price_zones = ["NO1","NO2","NO3","NO4","NO5","Others"]
    area_to_zone = fill(0, NArea)

    area_to_zone[21] = findfirst(==("Others"), price_zones)
    area_to_zone[22] = findfirst(==("Others"), price_zones)
    area_to_zone[23] = findfirst(==("Others"), price_zones)
    area_to_zone[24] = findfirst(==("Others"), price_zones)
    area_to_zone[25] = findfirst(==("Others"), price_zones)
    area_to_zone[26] = findfirst(==("Others"), price_zones)
    area_to_zone[27] = findfirst(==("Others"), price_zones)     
    area_to_zone[28] = findfirst(==("Others"), price_zones)
    area_to_zone[29] = findfirst(==("Others"), price_zones)
    area_to_zone[30] = findfirst(==("Others"), price_zones)
    area_to_zone[31] = findfirst(==("Others"), price_zones)
    area_to_zone[32] = findfirst(==("Others"), price_zones)
    area_to_zone[43] = findfirst(==("Others"), price_zones)
    area_to_zone[44] = findfirst(==("Others"), price_zones) 
    area_to_zone[45] = findfirst(==("Others"), price_zones)
    area_to_zone[46] = findfirst(==("Others"), price_zones)
    area_to_zone[47] = findfirst(==("Others"), price_zones)
    area_to_zone[48] = findfirst(==("Others"), price_zones)
    area_to_zone[49] = findfirst(==("Others"), price_zones)
    area_to_zone[50] = findfirst(==("Others"), price_zones)
    area_to_zone[51] = findfirst(==("Others"), price_zones)
    area_to_zone[52] = findfirst(==("Others"), price_zones)
    area_to_zone[53] = findfirst(==("Others"), price_zones)
    area_to_zone[54] = findfirst(==("Others"), price_zones) 
    area_to_zone[55] = findfirst(==("Others"), price_zones)
    area_to_zone[58] = findfirst(==("Others"), price_zones)
    area_to_zone[59] = findfirst(==("Others"), price_zones)
    area_to_zone[60] = findfirst(==("Others"), price_zones)
    area_to_zone[61] = findfirst(==("Others"), price_zones)
    area_to_zone[63] = findfirst(==("Others"), price_zones)
    area_to_zone[64] = findfirst(==("Others"), price_zones)
    area_to_zone[65] = findfirst(==("Others"), price_zones)
    area_to_zone[69] = findfirst(==("Others"), price_zones)
    area_to_zone[70] = findfirst(==("Others"), price_zones)
    area_to_zone[71] = findfirst(==("Others"), price_zones)
    area_to_zone[76] = findfirst(==("Others"), price_zones)
    area_to_zone[77] = findfirst(==("Others"), price_zones)
    area_to_zone[78] = findfirst(==("Others"), price_zones)
    area_to_zone[72] = findfirst(==("Others"), price_zones)

    area_to_zone[33] = findfirst(==("NO3"), price_zones) #OK
    area_to_zone[34] = findfirst(==("NO5"), price_zones) #OK
    area_to_zone[35] = findfirst(==("NO2"), price_zones) #OK
    area_to_zone[36] = findfirst(==("NO2"), price_zones) #OK
    area_to_zone[39] = findfirst(==("Others"), price_zones) #OK
    area_to_zone[56] = findfirst(==("Others"), price_zones) # DK1 eller DK2? Hydrogen danmark
    area_to_zone[66] = findfirst(==("NO3"), price_zones) # H2-M?
    area_to_zone[67] = findfirst(==("NO2"), price_zones) #H2-S?
    area_to_zone[68] = findfirst(==("NO4"), price_zones) #H2-N?
    area_to_zone[73] = findfirst(==("NO4"), price_zones) #OK
    area_to_zone[74] = findfirst(==("NO4"), price_zones) #OK
    area_to_zone[75] = findfirst(==("NO4"), price_zones) #OK
    area_to_zone[57] = findfirst(==("Others"), price_zones) #OK
    area_to_zone[62] = findfirst(==("Others"), price_zones) #Sweden-H2?
       

    area_to_zone[1] = findfirst(==("NO1"), price_zones) #OK
    area_to_zone[2] = findfirst(==("NO1"), price_zones) #spørre om NO1 eller NO2, SørØst
    area_to_zone[3] = findfirst(==("NO1"), price_zones) #spørre, NO1,NO3,NO5? Hallingdal
    area_to_zone[4] = findfirst(==("NO2"), price_zones) #spørre NO1,NO2? Telemark

    area_to_zone[5] = findfirst(==("NO2"), price_zones) #OK
    area_to_zone[6] = findfirst(==("NO2"), price_zones) #OK

    area_to_zone[8] = findfirst(==("NO3"), price_zones) #OK
    area_to_zone[9] = findfirst(==("NO4"), price_zones) #OK

    area_to_zone[10] = findfirst(==("NO4"), price_zones) #OK
    area_to_zone[11] = findfirst(==("NO4"), price_zones) #OK

    area_to_zone[7] = findfirst(==("NO5"), price_zones) #OK

    area_to_zone[12] = findfirst(==("Others"), price_zones) #OK
    area_to_zone[13] = findfirst(==("Others"), price_zones) #OK
    area_to_zone[37] = findfirst(==("Others"), price_zones) #OK

    area_to_zone[14] = findfirst(==("Others"), price_zones) #OK
    area_to_zone[15] = findfirst(==("Others"), price_zones) #OK

    area_to_zone[16] = findfirst(==("Others"), price_zones) #OK
    area_to_zone[38] = findfirst(==("Others"), price_zones) #OK

    area_to_zone[17] = findfirst(==("Others"), price_zones) #OK

    area_to_zone[20] = findfirst(==("Others"), price_zones) #OK
    area_to_zone[42] = findfirst(==("Others"), price_zones) #OK

    area_to_zone[19] = findfirst(==("Others"), price_zones) #OK
    area_to_zone[41] = findfirst(==("Others"), price_zones) #OK

    area_to_zone[18] = findfirst(==("Others"), price_zones) #OK
    area_to_zone[40] = findfirst(==("Others"), price_zones) #OK
    
    NZ = length(price_zones)
    @assert length(area_to_zone) == NArea

    # prissone -> områder
    areas_in_zone = [Int[] for _ in 1:NZ]
    for a in 1:NArea
        z = area_to_zone[a]
        @assert 1 <= z <= NZ "Område $a har ugyldig zone-index $z"
        push!(areas_in_zone[z], a)
    end

    hydro_areas_in_zone = [Int[] for _ in 1:NZ]
    for iArea in 1:NHSys
        z = area_to_zone[iArea]
        push!(hydro_areas_in_zone[z], iArea)
    end

    h2_to_area = Int[]
    h2_areas_in_zone = [Int[] for _ in 1:NZ]

    if !isnothing(H2Data) && hasproperty(H2Data, :NArea) && hasproperty(H2Data, :Ind) && H2Data.NArea > 0
        h2_to_area = fill(0, H2Data.NArea)
        for a in 1:NArea
            iH2 = H2Data.Ind[a]
            if iH2 > 0
                h2_to_area[iH2] = a
                z = area_to_zone[a]
                push!(h2_areas_in_zone[z], iH2)
            end
        end
    end

    return PriceZoneMapDetailed(price_zones, area_to_zone, areas_in_zone, hydro_areas_in_zone, h2_areas_in_zone, h2_to_area)
end

end # module




