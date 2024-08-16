using System.CodeDom;
using System.IO;
using System.Runtime.CompilerServices;

namespace INISelector.Utilities
{
    public class INIParser
    {
        public static Dictionary<string, Dictionary<string, string>> ReadINIFile(string fp)
        {
            var data = new Dictionary<string, Dictionary<string, string>>();
            bool reading = false;
            string? curSection = null;

            foreach (var line in File.ReadLines(fp))
            {
                string ln = line.Trim();

                if (!reading && IsEmptyOrComment(ln)) continue;

                if (ln.StartsWith('['))
                {
                    curSection = ln.Trim('[',']');
                    curSection = NormalizeString(curSection);

                    if (!data.ContainsKey(curSection))
                    {
                        data[curSection] = new Dictionary<string, string>();
                    }
                    reading = true;
                }
                else if (curSection != null && IsEmptyOrComment(ln))
                {
                    string[] keyvalue = ln.Split(['-','='], StringSplitOptions.RemoveEmptyEntries);

                    if (keyvalue.Length == 1)
                    {
                        data[curSection][keyvalue[0].TrimStart(['#',';']).Trim()] = keyvalue[0].Trim();
                    }
                    else if (keyvalue.Length == 2)
                    {
                        data[curSection][keyvalue[0].TrimStart(['#',';']).Trim()] = keyvalue[1].Trim();
                    }
                    else
                    {
                        continue;
                    }
                }
                else
                {
                    string[] keyvalue = ln.Split('=', StringSplitOptions.RemoveEmptyEntries);

                    data[curSection+" Default"] = new Dictionary<string, string>();

                    data[curSection+" Default"][keyvalue[0].Trim()] = keyvalue[1].Trim();
                }
            }

            return data;
        }

        private static bool IsEmptyOrComment(string ln)
        {
            if (string.IsNullOrEmpty(ln) || ln.StartsWith(';') || ln.StartsWith('#'))
            {
                return true;
            }
            return false;
        }

        internal static string NormalizeString(string str)
        {
            bool capitalizeNext = true;

            char[] chars = str.ToLower().ToCharArray();

            for (int i = 0; i < chars.Length; i++)
            {
                if (char.IsWhiteSpace(chars[i]))
                {
                    capitalizeNext = true;
                }
                else if (capitalizeNext)
                {
                    chars[i] = char.ToUpper(chars[i]);
                    capitalizeNext = false;
                }
            }

            Console.WriteLine($"{new String(chars)}");

            return new string(chars);
        }
    }
}