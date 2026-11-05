"""Check catalogue/token parity and declared foreground/background pairs, offline."""
import json,re
from pathlib import Path
root=Path(__file__).parent

def luminance(h):
 v=[int(h[i:i+2],16)/255 for i in (1,3,5)]
 v=[c/12.92 if c<=.04045 else ((c+.055)/1.055)**2.4 for c in v]
 return sum(a*b for a,b in zip(v,[.2126,.7152,.0722]))
def contrast(a,b):
 a,b=sorted([luminance(a),luminance(b)])
 return (b+.05)/(a+.05)
pairs=[('text-primary','surface',4.5),('text-primary','surface-raised',4.5),('text-muted','surface',4.5),('text-muted','surface-raised',4.5),('on-action','action-primary',4.5),('on-action','action-hover',4.5),('link','surface',4.5),('error','surface',4.5),('success','surface',4.5),('focus-ring','surface',3),('focus-ring','surface-raised',3),('border-control','surface',3),('border-control','surface-raised',3),('disabled-text','disabled-surface',4.5)]
report={}
for entry in json.loads((root/'catalog.json').read_text())['themes']:
 p=root/entry['id'];d=json.loads((p/'tokens.json').read_text());t=d['tokens'];css=dict(re.findall(r'--([\w-]+):\s*([^;]+);',(p/'tokens.css').read_text()))
 assert css==t,entry['id']+' CSS/JSON mismatch'
 assert (p/'THEME.md').is_file() and (p/'references/video-frame.jpg').is_file()
 rows=[]
 for a,b,minratio in pairs:
  r=contrast(t[a],t[b]);rows.append({'pair':a+'/'+b,'ratio':round(r,2),'required':minratio});assert r>=minratio,(entry['id'],a,b,r)
 report[entry['id']]=rows
print(json.dumps(report,indent=2))
