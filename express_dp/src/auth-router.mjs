import { Express } from "express";
import { postLogin } from "./controllers/auth-controller.mjs";

const authRouter = Express.Router();

authRouter.route("/login").post(postLogin);

export default authRouter;
