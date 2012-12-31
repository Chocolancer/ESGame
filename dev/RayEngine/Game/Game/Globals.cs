using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Game
{
    /// <summary>
    /// Stores paused bool
    /// </summary>
    class Globals
    {
        /// <summary>
        /// Checks if minigame is paused
        /// </summary>
        static bool paused = false;
        /// <summary>
        /// Checks if minigame is paused
        /// </summary>
        public static bool Paused
        {
            get
            {
                return paused;
            }
            set
            {
                paused = value;
            }
        }
    }
}
