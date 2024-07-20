import express from "express";
import { connectToDatabase, getDatabase } from "../config/mongodb_client";
import { User } from "../models/user_model";
import bcrypt from "bcrypt";
import { Db, ObjectId } from "mongodb";

export class UserController {
  //CONTROL ALL HTTP REQUESTS RELATED TO USER

  static async signUp(request: express.Request, response: express.Response) {
    let db = getDatabase();
    let usersCollection = db.collection("users");

    const user: User = request.body;

    const checkUserInDb = {
      email: user.email,
    };

    const data = await usersCollection.find(checkUserInDb).toArray();

    if (data.length != 0) {
      //USER ALREADY IN DATABASE

      response.status(403).send({
        status: "Failure",
        response: "Email already exists",
      });
    } else {
      //USER NOT IT DATABSE
      //HENCE SIGN UP

      let salt = await bcrypt.genSalt(10); //10 rounds
      user.password = await bcrypt.hash(user.password, salt);

      //SIGNING UP
      const responseData = usersCollection.insertOne(user);

      const objectId = (await responseData).insertedId; //Object ID

      const userInfo = await usersCollection
        .find({ _id: new ObjectId(objectId) })
        .toArray();

      const userResponseData = userInfo[0];

      userResponseData.password = " ";

      response.status(200).json({
        status: "Success",
        response: userResponseData,
      });
    }
  }

  static async signIn(request: express.Request, response: express.Response) {
    //check data in db
    let db = getDatabase();
    const userCollection = db.collection("users");

    const user: User = request.body;

    //decrypt password

    const checkUserInDb = {
        email: user.email,
      };

    const data = await userCollection.find(checkUserInDb).toArray();

    if (data.length != 0) {
      let userInfo = data[0];

      const pass = await bcrypt.compare(user.password, userInfo.password);
      //if pass true, password is correct

      if ((user.email == userInfo.email) && pass) {
        userInfo.password = "";

        response.status(200).json({
          "status": "Success",
          "response": userInfo,
        });
      } else {
        response.status(403).json({
          "status": "Failure",
          "response": "Invalid Email and Password. Please check.",
        });
      }
    } else {
      response.status(403).json({
        "status": "Failure",
        "response": "Invalid Email and Password. Please check.",
      });
    }

    //sign in
  }
}
