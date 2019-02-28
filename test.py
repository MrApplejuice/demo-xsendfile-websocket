#!/usr/bin/env python

import asyncio
import websockets

async def echo(websocket, path):
    print("Connected: ", websocket, path)
    async for message in websocket:
        print("Echo: ", message)
        await websocket.send(message)

asyncio.get_event_loop().run_until_complete(
    websockets.serve(echo, '0.0.0.0', 18888))
asyncio.get_event_loop().run_forever()
