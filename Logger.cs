using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
namespace ForksnSpoons
{
    public class Logger
    {
        private readonly ILogger _logger;
        public Logger(ILogger logger)
        {
            _logger = logger;
        }
        public enum logMethods
        {
            Info,
            Warn,
            Error,
            Fatal,
            Debug
        }
        public void Log(string  message, logMethods method=logMethods.Info) 
        {
            switch(method)
            {
                case logMethods.Info:
                    _logger.LogInformation(message); break;
                case logMethods.Warn:
                    _logger.LogWarning(message); break;
                case logMethods.Error:
                    _logger.LogError(message); break;
                case logMethods.Fatal:
                    _logger.LogCritical(message); break;
                case logMethods.Debug: 
                    _logger.LogDebug(message); break;
            }
        }
    }
}
