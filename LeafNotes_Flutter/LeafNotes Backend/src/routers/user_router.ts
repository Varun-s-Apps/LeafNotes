import express from "express";
import { UserController } from "../controller/UserController";



const userRouter : express.Router = express.Router();


userRouter.post("/signUp", UserController.signUp)
userRouter.post("/signIn", UserController.signIn)
//Get profile
userRouter.get("/myProfile",UserController.myProfile)
userRouter.put("/updateProfile",UserController.updateProfile)


export default userRouter;

