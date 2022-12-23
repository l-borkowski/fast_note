using Microsoft.AspNetCore.Mvc;
using NoteAPI.Models;
using NoteAPI.Services;

namespace NoteAPI.Controllers
{
    [Route("api/account")]
    [ApiController]
    public class AccountContoller : ControllerBase
    {
        private readonly IAccountService _accountService;
        public AccountContoller(IAccountService accountService)
        {
            _accountService = accountService;
        }

        [HttpPost("register")]
        public ActionResult RegisterUser([FromBody] RegisterUserDto dto)
        {
            _accountService.RegisterUser(dto);
            return Ok();
        }

        [HttpPost("login")]
        public ActionResult Login([FromBody] LoginDto dto)
        {
            string token = _accountService.GenerateJwt(dto);
            return Ok(token);
        }

        [HttpPatch("UserUpdate")]
        public ActionResult UpdateAccount([FromBody] UpdateUserDto dto)
        {
            if (!ModelState.IsValid || dto is null)
            {
                return BadRequest(ModelState);
            }

            _accountService.UpdateAccount(dto);

            return Ok();
        }

        [HttpPatch("PasswordUpdate")]
        public ActionResult UpdatePassword([FromBody] UpdatePasswordDto dto)
        {
            if (!ModelState.IsValid || dto is null)
            {
                return BadRequest(ModelState);
            }

            _accountService.UpdatePassword(dto);

            return Ok();
        }
    }
}