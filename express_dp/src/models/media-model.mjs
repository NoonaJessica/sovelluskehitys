// Note: db functions are async and must be called with await from the controller
// How to handle errors in controller?
import promisePool from "../utils/database.mjs";

const listAllMedia = async () => {
  try {
    const [rows] = await promisePool.query("SELECT * FROM mediaItems");
    console.log("rows", rows);
    return rows;
  } catch (e) {
    console.error("error", e.message);
    return { error: e.message };
  }
};

const findMediaById = async (id) => {
  try {
    const [rows] = await promisePool.query(
      "SELECT * FROM mediaItems WHERE media_id = ?",
      [id]
    );
    console.log("rows", rows);
    return rows[0];
  } catch (e) {
    console.error("error", e.message);
    return { error: e.message };
  }
};

const addMedia = async (media) => {
  const { user_id, filename, size, mimetype, title, description } = media;
  const sql = `INSERT INTO mediaItems (user_id, filename, filesize, media_type, title, description)
               VALUES (?, ?, ?, ?, ?, ?)`;
  const params = [user_id, filename, size, mimetype, title, description];
  try {
    const rows = await promisePool.query(sql, params);
    console.log("rows", rows);
    return { media_id: rows[0].insertId };
  } catch (e) {
    console.error("error", e.message);
    return { error: e.message };
  }
};


const fetchAllMedia = ()

export { listAllMedia, findMediaById, addMedia };
