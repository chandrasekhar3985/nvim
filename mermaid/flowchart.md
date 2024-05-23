# Mermaid _ Flowchart

```mermaid
flowchart  TB
%% colors 
linkStyle default stroke-width:4px
classDef red fill:#ff0000, strroke:#000, stroke-width:2px,color:#ffffff
classDef blue fill:#0000ff, strroke:#000, stroke-width:2px,color:#ffffff
classDef magenda fill:#870087, strroke:#000, stroke-width:2px,color:#ffffff
classDef violet fill:#af00d7, strroke:#000, stroke-width:2px,color:#ffffff
classDef green fill:#87ff00, strroke:#000, stroke-width:2px,color:#ffffff
%% chart
S(start):::green ==>|Begin| R[(Run command)]:::blue
R -->|Compiling| C{check syntx}:::red
C--> K((Right)):::green
C-.-> W([Wrong]):::red
W-.-> c1[correct syntax]:::magenda
c1-.->C
K--> E>Execute Programe]:::violet
E--> W1{{Working}}:::green
E-->N[/Not Working/]:::red
N-->C3[\Check Program\]:::violet
C3-.->c1
W1 --> S1(Save Result):::magenda
S1-->|Terminating| S2(((Stop))):::green
%% Line Color
linkStyle 0 stroke:blue
linkStyle 1 stroke:red
linkStyle 3 stroke:violet
```

# Subgraphs
```mermaid
flowchart TB

c1-->a2 
subgraph one 
a1-->a2 
end 
subgraph two 
b1-->b2 
end 
subgraph three 
c1-->c2 
end
```
# Direction in subgraphs
```mermaid
flowchart LR

    subgraph TOP
        direction TB
        subgraph B1
            direction RL
            i1-->f1
        end
        subgraph B2
            direction BT
            i2-->f2
        end
    end
    A-->TOP-->B
    B1 --> B2    
        
        

```
#  clickable flow chart
```mermaid
flowchart LR
    A-->B
    B-->C 
    C-->D 
    click A callback "Tool tip for a call back"
    click B "https://www.github.com" "This is a tooltip for a link."
    click A call callback() "Tool tip for a callback"
    click B href "https://www.github.com" "This is a tooltip for a link"
 ```
 
