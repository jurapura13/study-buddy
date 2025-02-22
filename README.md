# Study Buddy Script

## Overview
This script helps you stay accountable during your study sessions by checking in with you periodically, tracking the time elapsed, and ensuring you reflect on your progress. The script interacts with a web-based check-in chat, using **study_buddy.sh** to handle the automation and **study_buddy_prompt.txt** to provide consistent check-in prompts.



## Files

1. **study_buddy.sh**  
   The main script that runs the check-in process. It opens a Firefox window, brings it into focus, and types in your check-in messages based on a time loop.

2. **study_buddy_prompt.txt**  
   A prompt file used by the chat system (ChatGPT, in this case). It defines how the system should interact with you, including the tone, structure, and feedback you need to receive during check-ins.



## How It Works

1. **Study Start Prompt:**  
   When you start the script, it fires off an initial message asking you for a detailed rundown of your study plan.

2. **Periodic Check-Ins:**  
   Every 30 minutes, the script prompts a check-in, asking how your study session is progressing and requesting a detailed update on what you've worked on, any challenges, and your next steps.

3. **Feedback:**  
   After each check-in response, the system gives brief positive feedback, acknowledging your progress without additional questions until the next check-in.



## Setting Up

### Prerequisites

- **Linux** (tested on Linux)
- **Firefox** browser
- **xdotool** (used to interact with the Firefox window)
- **Bash** (to run the script)

### 1. Install Dependencies

To use the script, you'll need `xdotool` to automate the interaction with Firefox.

On **Ubuntu/Debian**:
```bash
sudo apt-get update
sudo apt-get install xdotool
```

### 2. Download the Script Files

Download or clone the following files to your working directory:

- `study_buddy.sh` (the script)
- `study_buddy_prompt.txt` (the prompt file)

### 3. Make the Script Executable

Ensure that the script is executable by running:
```bash
chmod +x study_buddy.sh
```

### 4. Set Up Firefox and the Check-In Chat

1. Ensure that you have a working ChatGPT account and create a new chat using the prompt from `study_buddy_prompt.txt`.
2. Replace the link in the script (inside `study_buddy.sh`) with the **newly generated chat link** after inserting the prompt from `study_buddy_prompt.txt`:
   ```bash
   firefox "https://chatgpt.com/c/[your-new-check-in-chat-link]"
   ```

### 5. Run the Script

Now, you’re ready to run the script! Execute it by simply running:
```bash
./study_buddy.sh
```

### 6. Interact with the Check-In Chat

Once the script runs, it will open Firefox, focus on the check-in chat, and start sending periodic check-ins based on the time set in the script.



## Customizing the Script

If you want to change the interval of check-ins, you can adjust the `sleep 1800` line (which sets a 30-minute delay between check-ins). For example, to check in every 15 minutes, change it to:
```bash
sleep 900
```



## Important Notes

- **Xorg vs Wayland:**  
  For the script to function properly, **you must be using Xorg**, not Wayland. `xdotool` relies on X11, and it may not work correctly under Wayland. If Firefox doesn’t come into focus as expected, ensure that you’re on Xorg. You can check this by running:
  ```bash
  echo $XDG_SESSION_TYPE
  ```
  If the output is `wayland`, you’ll need to switch to Xorg for this script to function properly.



## Troubleshooting

- **Firefox doesn’t focus:** If Firefox is not coming into focus, ensure `xdotool` is installed properly, and your window search class matches. You can test `xdotool search --class "Firefox"` to see if it finds your Firefox window.
- **Script not executing:** Make sure the script is marked as executable with `chmod +x study_buddy.sh`.



## License

Feel free to modify, distribute, or use this script however you like. The script is provided as-is, with no warranty.


<!-- README.md generated using GPT-4o-mini -->
