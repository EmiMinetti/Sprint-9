const logMiddleware = (req, res, next) => {
    console.log(`${req.method}: ${req.url}`);
  
    res.on("finish", () => {
      // aca normalmente se comprime, se manejan los errores, se encripta, etc
      console.log("Termine la request");
    });
    next();
  };
  
const authMiddleware = (req, res, next) => {
    const headers = req.headers;
    if (headers["x-api-key"] !== "tasksenpai") {
      console.log("Intento de request con api key invalido");
      res.status(401).json({ message: "No estas autorizado para hacer esto" });
      return;
    }
    next();
  };

module.exports = { logMiddleware , authMiddleware };