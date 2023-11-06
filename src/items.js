const getItems = (res) => {
  res.writeHead(200, { "content-Type": "application(Json" });
  //mock data
  const items = [
    { id: 5, name: "porkkana" },
    { id: 6, name: "omena" },
    { id: 19, name: "mango" },
  ];
  const getItems = (res) => {
    res.writeHead(200, { "content-Type": "application(Json" });
    const js = JSON.stringify(items);
    res.end(`{"message": "All items", "items": ${jsonItems}}`);
  };
};

const getItemsbyId = (res, id) => {
  res.writeHead(200, { "content-Type": "application(Json" });
  const item = { id: 6, name: "omena" };
  res.end(JSON.stringify(item));
};

const postItem = (req, res) => {
  let body = [];
  req
    .on("error", (err) => {
      console.error(err);
    })
    .on("data", (chunk) => {
      body.push(chunk);
    })
    .on("end", () => {
      body = Buffer.concat(body).toString();
      console.log("req body", body);
      body = JSON.parse(body);
      if (!body.name) {
        res.writeHead(400, { "content-Type": "application/json" });
        res.end(`{"message": "missing data."}`);
        return;
      }
      const newId = items[items.length - 1].id + 1;
      items.push({ id: newId, name: body.name });
      res.writeHead(201, { "content-Type": "application(Json" });
      res.end(`{"message": "new"}`);
    });

  items.push({ id: Math.ceil(Math.random() * 100), name: "new item" });
};

export { getItems, getItemsbyId, postItem };
