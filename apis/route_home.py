from fastapi import APIRouter, HTTPException
import os

from fastapi.responses import HTMLResponse

TEMPLATES_PATH = os.getenv("TEMPLATES_PATH", "./templates")

home_router = APIRouter()

@home_router.get("/")
async def get_user():
    template: str = open(os.path.join(TEMPLATES_PATH, "index.html"), "r").read()
    print(template)
    return HTMLResponse(template, status_code=200)

@home_router.get("/openSteam")
async def get_user():
    # Opens the steamlink process
    print("aaaa")
    res = os.system("steamlink")
    if res != 0:
        raise HTTPException(status_code=500, detail="Failed to open Steam Link")
    print("bbbb")
    return {"message": "Steam is open"}
