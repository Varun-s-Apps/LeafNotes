import express from "express"

let appLogger = (req : express.Request, res : express.Response, next: express.NextFunction) =>{



    const url =req.url;
    const method = req.method;
    const date = new Date().toLocaleDateString();
    const time = new Date().toLocaleTimeString();

    const result : string = `${url} || ${method} || ${date} || ${time} ||`;

    console.log(result);

    next();
}

export default appLogger