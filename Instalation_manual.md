# Neovim Installation and Configuration Procedure  

[![4252024133346.png](https://i.postimg.cc/NjYXTnnM/4252024133346.png)](https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://github.com/neovim/neovim&ved=2ahUKEwitx7WhrKiGAxXszTgGHXsICB4QFnoECB8QAQ&sqi=2&usg=AOvVaw2YkFEe39NA-NV2yH4uUbTV)  
[Reference](https://raw.githubusercontent.com/chandrasekhar3985/.brenconfig/master/README.md)   

**TABLE OF INDEX** 

1. [MAC INSTALLATION](#MAC-INSTALLATION)

---


# MAC INSTALLATION

Install HOME brew in Mac

[Homebrew](https://brew.sh/) 
Or
copy paste following script in your terminal
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- Recomendate follow the tutorial of terminal beautification.
[Terminal beautification](https://drive.google.com/file/d/170pS2MbXCrOy1pwLtpEXOgWYaWkY5JzH/view?usp=drivesdk) 

---
- Then update and upgrade home brew.
  ```sh
  brew update
  ```

  ```sh
  brew doctor
  ```
  ```sh
  brew upgrade
  ```
  **_Install git_** 
  ```sh
  brew install git
  ```
  **_Install Lazygit_** 
  ```sh
  brew install jesseduffield/lazygit/lazygit
  ```
  **_Install Python_** 
  ```sh
  brew install python
  ```
  **_Install Node_**
  ```sh
  brew install node
  ```
  **_For formatting in lua_** 
  ```sh
  brew install stylua
  ```
  ```sh
  brew install lua-language-server
  ```
  ---
  **_Install following packages_** 
  ```sh
  brew install fzf
  ```
  ```sh
  brew install ripgrep
  
  ```
  ```sh
  brew install pandoc
  ```
  ```sh
  brew install pandoc-plot
  ```
  ```sh
  brew install npm
  ```
  ```sh
  brew install wget
  ```
  ```sh
  brew install neovim-remote
  ```
  ```sh
  brew install glow
  ```
  ```sh
  brew install slides
  ```
  ```sh
  brew install marksman
  ```
  ---
  **_INSTALL LATEX_**
  ```sh
  brew install --cask mactex
  ```
  **_Install Skim_**

  ```sh
  brew install skim
  ```
  ```sh
  alias skim='/Applications/Skim.app/Contents/MacOS/Skim'
  ```
  ```sh
  funcsave skim
  ```
  > You should now be able to open Skim with the 
  command skim inside the terminal. 
  Change the automatic refreshing in Skim by 
  opening the Skim menu and navigating to 
  Preferences and selecting the Sync tab. 
  Check both Check for file changes and 
  Reload automatically. 
  In the Preset menu, select custom and set the Command to nvim 
  with the Arguments as follows:

`-headless -c "VimtexInverseSearch %l '%f'"`   
**_Now change directory to `cd ~/.config`_** 

Run following command

```sh
git clone https://github.com/chandrasekhar3985/nvim.git
```

