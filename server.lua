-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--( Tunnel )-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module('vrp','lib/Tunnel')
local Proxy = module('vrp','lib/Proxy')
vRP = Proxy.getInterface('vRP')
scriptCdsTxt = {}
Tunnel.bindInterface('gn_cdstxt',scriptCdsTxt)
cdstxtCL = Tunnel.getInterface('gn_cdstxt')
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--( Copiar CDS )---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function scriptCdsTxt.writeOnTxt(x,y,z,h)
    local file = io.open("cds.txt", "r+")
    if file then
        io.input(file)
        local textoAntigo = io.read('*all')
        if textoAntigo ~= '' and config['pegarHeading'] then
            io.output(file)
            io.write('\n' .. tD(x) .. ',' .. tD(y) .. ',' .. tD(z) .. ',' .. tD(h))
            io.close(file)
            TriggerClientEvent('Notify',source,config['notificações']['sucesso']['tipo'],config['notificações']['sucesso']['app'],config['notificações']['sucesso']['titulo'],config['notificações']['sucesso']['mensagem'],config['notificações']['sucesso']['tempo'],config['notificações']['sucesso']['som'])	
        elseif config['pegarHeading'] then
            io.output(file)
            io.write(tD(x) .. ',' .. tD(y) .. ',' .. tD(z) .. ',' .. tD(h))
            io.close(file)
            TriggerClientEvent('Notify',source,config['notificações']['sucesso']['tipo'],config['notificações']['sucesso']['app'],config['notificações']['sucesso']['titulo'],config['notificações']['sucesso']['mensagem'],config['notificações']['sucesso']['tempo'],config['notificações']['sucesso']['som'])	
        elseif textoAntigo ~= '' and not config['pegarHeading'] then
            io.output(file)
            io.write('\n' .. tD(x) .. ',' .. tD(y) .. ',' .. tD(z))
            io.close(file)
            TriggerClientEvent('Notify',source,config['notificações']['sucesso']['tipo'],config['notificações']['sucesso']['app'],config['notificações']['sucesso']['titulo'],config['notificações']['sucesso']['mensagem'],config['notificações']['sucesso']['tempo'],config['notificações']['sucesso']['som'])	
        elseif not config['pegarHeading'] then
            io.output(file)
            io.write(tD(x) .. ',' .. tD(y) .. ',' .. tD(z))
            io.close(file)
            TriggerClientEvent('Notify',source,config['notificações']['sucesso']['tipo'],config['notificações']['sucesso']['app'],config['notificações']['sucesso']['titulo'],config['notificações']['sucesso']['mensagem'],config['notificações']['sucesso']['tempo'],config['notificações']['sucesso']['som'])	
        end
    else
        TriggerClientEvent('Notify',source,config['notificações']['arquivoNaoExiste']['tipo'],config['notificações']['arquivoNaoExiste']['app'],config['notificações']['arquivoNaoExiste']['titulo'],config['notificações']['arquivoNaoExiste']['mensagem'],config['notificações']['arquivoNaoExiste']['tempo'],config['notificações']['arquivoNaoExiste']['som'])	
    end
end

function tD(n)
    n = math.ceil(n * 100) / 100
    return n
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--( Criar Txt )----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("criar", function(source, args, rawCommand)
    local file = io.open("cds.txt", "r")
    
    if file then
        TriggerClientEvent('Notify',source,config['notificações']['arquivoExiste']['tipo'],config['notificações']['arquivoExiste']['app'],config['notificações']['arquivoExiste']['titulo'],config['notificações']['arquivoExiste']['mensagem'],config['notificações']['arquivoExiste']['tempo'],config['notificações']['arquivoExiste']['som'])	
    else
        TriggerClientEvent('Notify',source,config['notificações']['arquivoCriado']['tipo'],config['notificações']['arquivoCriado']['app'],config['notificações']['arquivoCriado']['titulo'],config['notificações']['arquivoCriado']['mensagem'],config['notificações']['arquivoCriado']['tempo'],config['notificações']['arquivoCriado']['som'])	
        local txt = io.output('cds.txt')
        io.close(txt)
    end
end)
