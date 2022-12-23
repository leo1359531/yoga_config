import requests
import bs4
import subprocess as sb

# Macro Sections
URL='https://www.kernel.org/'
DIR_NAME='Kernel'
UCODE='/amd-ucode.img'
OPTIONS='root="LABEL=arch_os" rw log quiet loglevel=0 resume=UUID=5282f4ff-5e48-444b-99f5-550383537484 resume_offset=17693035'

###############################################################
# CODE SECTION
###############################################################
USER_NAME=sb.check_output('whoami', encoding='utf-8').strip()
DIR='/home/' + str(USER_NAME) + '/' + DIR_NAME

# Checks latest kernel from URL
def get_kernel():
    req = requests.get(URL)
    if req.status_code == 200:
        bs_txt = bs4.BeautifulSoup(req.text, 'html.parser')
        kernel_version_td = bs_txt.find(id="latest_link")
        if kernel_version_td != None:
            return [kernel_version_td.find('a').get('href'), kernel_version_td.find('a').getText()]
    
    return "Error"

# Checks current kernel
def check_kernel():
    return sb.check_output(['uname', '-r'], encoding='utf-8').split('-')[0]


# Updates the kernel -> kernel.sh is a bash script
def update(last_version):
    folder_name = 'linux-' + last_version[1]
    sb.run(['./kernel.sh', DIR, last_version[0], last_version[0].replace('.xz', '.sign'), folder_name, last_version[1], UCODE, OPTIONS])

    return 0

# main
last_version = get_kernel()

if last_version[1] >= check_kernel():
    print("New kernel", last_version[1], "avaible")
    print("Would you like to update?")
    while 1:
        char = input()
        if char.strip().lower() == 'y': 
            update(last_version)
            break
        elif not char: 
            update(last_version)
            break
        elif char.strip().lower() == 'n': 
            print("Exiting...")
            exit()

        print("Input is not valid, please type 'Y' or 'n'")



