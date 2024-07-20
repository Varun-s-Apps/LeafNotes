import express from "express";
import { UserController } from "../controller/userController";



const userRouter : express.Router = express.Router();


userRouter.post("/signUp", UserController.signUp)
userRouter.post("/signIn", UserController.signIn)


export default userRouter;

