import express from "express";

const app = express();
const serverPort = process.env.PORT || 3000;

app.use(express.json());
app.use(express.urlencoded({ extends: false }));

app.get("/", (req, res) => {
  res.status(200).send("this is docker automation ci pipeline examples!");
});

app.get("/health", (req, res) => {
  res.status(200).json({
    status: "OK",
  });
});

app.listen(3000, () => {
  console.log(`The Server is up and running on http://localhost:${serverPort}`);
});
