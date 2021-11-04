@Echo off
Pushd "С:\Path\to\file\"
for %%f in (*.avi) do (
  ffmpeg -y -i "%%~f" -c:v libx264 -preset slow -b:v 17000K -aspect 16:9 -vf yadif=1:-1:0,crop=in_w-2*0:in_h-2*4,scale=1280:720 -r 50 -pass 1 -f mp4 NULL 
  ffmpeg -y -i "%%~f" -c:v libx264 -preset slow -b:v 17000K -aspect 16:9 -vf yadif=1:-1:0,crop=in_w-2*0:in_h-2*4,scale=1280:720 -r 50 -pass 2 -f mp4 -c:a aac -b:a 256K "%%~nf.mp4"
)
PopD
Pause