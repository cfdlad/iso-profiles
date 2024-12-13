#!/bin/python3

############################################
#
# Libadwaita Theme Changer
# created by OdzioM
#
############################################

import sys
import os
import subprocess as sp

if __name__ == "__main__":
    try:
        home_dir = os.getenv('HOME')
        config_dir = "/.config"
        config_dir2 = "/usr/share"
        themes_dir = "/.themes"
        themes_dir2 = "/usr/share/themes"
        if "--reset" in sys.argv:
            print(f'\n***\nResetting theme to default!\n***\n')
            sp.run(["rm", f'{home_dir}{config_dir}/gtk-4.0/gtk.css'])
            sp.run(["rm", f'{home_dir}{config_dir}/gtk-4.0/gtk-dark.css'])
            sp.run(["rm", f'{home_dir}{config_dir}/gtk-4.0/assets'])
            sp.run(["rm", f'{home_dir}{config_dir}/assets'])
        else:
            all_themes1 = str(sp.run(["ls", f'{home_dir}{themes_dir}/'], stdout=sp.PIPE).stdout.decode("UTF-8")).split()
            all_themes2 = str(sp.run(["ls", f'{themes_dir2}/'], stdout=sp.PIPE).stdout.decode("UTF-8")).split()

            lc=len(all_themes1)
            gb=len(all_themes2)

            all_themes=all_themes1+all_themes2
            print("Select theme: ")
            for i, theme in enumerate(all_themes):
                print(f'{i+1}. {theme}')
            print("e. Exit")
            chk = input("Your choice: ")
            chk_value = int(chk)-1
            chk_theme = all_themes[chk_value]

            if chk_theme in all_themes1 :
                chk = "local"
            elif chk_theme in all_themes2 :
                chk = "global"
            else :
                pass

            match chk:
                case "e":
                    print("Bye bye!")
                case "local":
                    print(f'\n***\nChoosed {chk_theme}\n***\n')
                    print("Removing previous theme...")
                    sp.run(["rm", f'{home_dir}{config_dir}/gtk-4.0/gtk.css'])
                    sp.run(["rm", f'{home_dir}{config_dir}/gtk-4.0/gtk-dark.css'])
                    sp.run(["rm", f'{home_dir}{config_dir}/gtk-4.0/assets'])
                    sp.run(["rm", f'{home_dir}{config_dir}/assets'])
                    print("Installing new theme...")
                    sp.run(["ln", "-s", f'{home_dir}{themes_dir}/{chk_theme}/gtk-4.0/gtk.css', f'{home_dir}{config_dir}/gtk-4.0/gtk.css'])
                    sp.run(["ln", "-s", f'{home_dir}{themes_dir}/{chk_theme}/gtk-4.0/gtk-dark.css', f'{home_dir}{config_dir}/gtk-4.0/gtk-dark.css'])
                    sp.run(["ln", "-s", f'{home_dir}{themes_dir}/{chk_theme}/gtk-4.0/assets', f'{home_dir}{config_dir}/gtk-4.0/assets'])
                    sp.run(["ln", "-s", f'{home_dir}{themes_dir}/{chk_theme}/assets', f'{home_dir}{config_dir}/assets'])
                    print("Done.")
                case "global":
                    print(f'\n***\nChoosed {chk_theme}\n***\n')
                    print("Removing previous theme...")
                    sp.run(["rm", f'{home_dir}{config_dir}/gtk-4.0/gtk.css'])
                    sp.run(["rm", f'{home_dir}{config_dir}/gtk-4.0/gtk-dark.css'])
                    sp.run(["rm", f'{home_dir}{config_dir}/gtk-4.0/assets'])
                    sp.run(["rm", f'{home_dir}{config_dir}/assets'])
                    print("Installing new theme...")
                    sp.run(["ln", "-s", f'{themes_dir2}/{chk_theme}/gtk-4.0/gtk.css', f'{home_dir}{config_dir}/gtk-4.0/gtk.css'])
                    sp.run(["ln", "-s", f'{themes_dir2}/{chk_theme}/gtk-4.0/gtk-dark.css', f'{home_dir}{config_dir}/gtk-4.0/gtk-dark.css'])
                    sp.run(["ln", "-s", f'{themes_dir2}/{chk_theme}/gtk-4.0/assets', f'{home_dir}{config_dir}/gtk-4.0/assets'])
                    sp.run(["ln", "-s", f'{themes_dir2}/{chk_theme}/assets', f'{home_dir}{config_dir}/assets'])
                    print("Done.")
    except ValueError as e:
        print("Incorrect value! Please try again!")
