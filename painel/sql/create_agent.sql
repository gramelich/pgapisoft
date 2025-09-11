-- SQL prepared statement to insert an agent
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
    probganhoaposta,
    probganhosaldo,
    callbackurl
) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
