INSERT INTO public.agents(
    id,
    agentcode,
    saldo,
    "agentToken",
    "secretKey",
    probganho,
    probbonus,
    probganhortp,
    probganhoinfluencer,
    probbonusinfluencer,
    probganhosaldo,
    probganhoaposta,
    callbackurl,
    limitadorchicky
) VALUES (
    'demo',          -- agentcode usado no login
    'senha123',      -- senha usada no login
    0,               -- saldo inicial
    'token-demo',    -- token do agente
    'secret-demo',   -- secret key
    0, 0, 0, 0, 0,   -- probabilidades
    0,               -- probganhosaldo
    0,               -- probganhoaposta
    '',              -- callbackurl
    0                -- limitadorchicky
);
