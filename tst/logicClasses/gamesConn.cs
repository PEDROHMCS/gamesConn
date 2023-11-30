using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;

namespace tst.logicClasses
{
    public class gamesConn
    {
        private string strFileName, strFilePath, strFolder, gameIcon;
        private HtmlInputFile imgInput;



        public gamesConn()
        {
            StrFileName = string.Empty;
            StrFilePath = string.Empty;
            StrFolder = string.Empty;
            gameIcon = string.Empty;
        }

        public string createIcon()
        {
            string strFolderClass;

            strFolderClass = HttpContext.Current.Server.MapPath(strFolder);
            strFileName = ImgInput.PostedFile.FileName;
            strFileName = Path.GetFileName(strFileName);

            if(imgInput.Value != "")
            {
                if (!Directory.Exists(strFolderClass))
                {
                    Directory.CreateDirectory(strFolderClass);
                }
                strFilePath = strFolderClass + strFileName;
                if(File.Exists(strFilePath))
                {
                    gameIcon = strFileName;
                    
                }
                else
                {
                    imgInput.PostedFile.SaveAs(strFilePath);
                    gameIcon = strFileName;
                }
                return gameIcon;
            }
            else
            {
                throw new Exception("Selecione um arquivo!");
            }



        }


        #region setters
        public string StrFileName
        {
            private get { return strFileName; }
            set { strFileName = value; }
        }

        public string StrFilePath
        {
            private get { return strFilePath; }
            set { strFilePath = value; }
        }

        public string StrFolder
        {
            private get { return StrFolder; }
            set { strFolder = value; }
        }

        public HtmlInputFile ImgInput
        {
            private get { return imgInput; }
            set { imgInput = value; }
        }


        #endregion

    }


}