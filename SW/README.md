# Make splash screen for Demistify ports

```sh
#after editing splash*.txt files execute following commands:
python3 make_splash_ascii-hex.py
mv splash.hex ascii-hex2mif/
cd ascii-hex2mif/
./splash_mif.sh 
cp splash.mif ../../rtl/video/
```

