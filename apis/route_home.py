from fastapi import APIRouter, HTTPException
import os

from fastapi.responses import HTMLResponse

TEMPLATES_PATH = os.getenv("TEMPLATES_PATH", "./templates")
template: str = open(os.path.join(TEMPLATES_PATH, "index.html"), "r").read()

home_router = APIRouter()

@home_router.get("/")
async def get_user():
    return HTMLResponse(template, status_code=200)

@home_router.get("/openSteam")
async def open_steam():
    # Opens the steamlink process
    res = os.system("steamlink -y")
    if res != 0:
        raise HTTPException(status_code=500, detail="Failed to open Steam Link")
    return {"message": "Steam is open"}
