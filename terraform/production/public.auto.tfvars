domain_primary = "codeday.com"

domain_internal = "codeday.net"

domain_primary_alias = [
  "srnd.org",
  "studentrnd.org",
  "studentrnd.com",
  "codeday.us",
  "codeday.xyz",
]

domain_country_specific = [
  "codeday.ca",
  "codeday.ch",
  "codeday.ee",
  "codeday.es",
  "codeday.fr",
  "codeday.in",
  "codeday.it",
  "codeday.se",
  "codeday.co.uk",
]

dmarc_rua = {
  "codeday.ca"     = "mailto:re+cqgb2ltrmgm@dmarc.postmarkapp.com"
  "codeday.ch"     = "mailto:re+qtaphb9qcfc@dmarc.postmarkapp.com",
  "codeday.ee"     = "mailto:re+snvqy8hv6uf@dmarc.postmarkapp.com",
  "codeday.es"     = "mailto:re+ksywwsyxiz1@dmarc.postmarkapp.com",
  "codeday.fr"     = "mailto:re+qtaphb9qcfc@dmarc.postmarkapp.com",
  "codeday.in"     = "mailto:re+qtaphb9qcfc@dmarc.postmarkapp.com",
  "codeday.it"     = "mailto:re+swkqh6sefl2@dmarc.postmarkapp.com",
  "codeday.se"     = "mailto:re+swkqh6sefl2@dmarc.postmarkapp.com",
  "codeday.co.uk"  = "mailto:re+swkqh6sefl2@dmarc.postmarkapp.com",
  "srnd.org"       = "mailto:re+oylttiijnvb@dmarc.postmarkapp.com",
  "studentrnd.org" = "mailto:re+pfbxf90hjnm@dmarc.postmarkapp.com",
  "studentrnd.com" = "mailto:re+nzsgui0u57c@dmarc.postmarkapp.com",
  "codeday.us"     = "mailto:re+ccketjwjw5x@dmarc.postmarkapp.com",
  "codeday.xyz"    = "mailto:re+gzvxznskvpo@dmarc.postmarkapp.com",
  "codeday.org"    = "mailto:re+p3tqby76fdg@inbound.dmarcdigests.com",
}

root_txt_records = {
  "codeday.ca"     = [],
  "codeday.ch"     = ["google-site-verification=ZEyJzoVfj9Zv0GCWRus4H0ibGAxhCz2XYES7E2Xu_hM"],
  "codeday.ee"     = ["google-site-verification=ZEyJzoVfj9Zv0GCWRus4H0ibGAxhCz2XYES7E2Xu_hM"],
  "codeday.es"     = ["google-site-verification=7IsJKtOXJQQ7HXLUzKQ1c3Jc4GgkYmE0E0hejOyNFiA"],
  "codeday.fr"     = ["google-site-verification=cmUqln3W7U8NyhgqvzLsydxcvwHaR2EzwLvtDJGpIaw"],
  "codeday.in"     = [],
  "codeday.it"     = ["google-site-verification=ZEyJzoVfj9Zv0GCWRus4H0ibGAxhCz2XYES7E2Xu_hM"],
  "codeday.se"     = ["google-site-verification=ZEyJzoVfj9Zv0GCWRus4H0ibGAxhCz2XYES7E2Xu_hM"],
  "codeday.co.uk"  = [],
  "srnd.org"       = [],
  "studentrnd.org" = ["google-site-verification=UXs5_KNkNTdKbjfWMXYZkC62Sm1AGpC26fmwGJWELIE"],
  "studentrnd.com" = [],
  "codeday.us"     = ["google-site-verification=BuVi92MciFyEFkw_BeEAW0gTq9fZbIt3XB6NHqlaTAM"],
  "codeday.xyz"    = ["google-site-verification=USCD3-I2rreTHVwFKWQ74RlmAnsKbHlmzvVxLdGU-S8"],
  "codeday.org"    = ["google-site-verification=xWYdwWHz551K6I_3eU5Q0lZWd8PsEHXb-bUKYqo__jc"],
}

google_dkim = {
  "srnd.org"       = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAg6zwzpiBIy6Ty7mxSNE3sBpJvwN7hALcn8E9qT07ymdPCYht7hMRDXBvvUfobofwufGfHfccjhz7l/Ib0q8scP88hZ4wnvoKeIPkaD89JajJhoF/ZaVzui3UbUJmf9MRJDtZcQNLP6qXlVUZC8F8Xo5rz+tEr3pn0KpcrtSHWd22IJ4u9agCcj3qIbUiMG6u/X1IRf4LbdH96h60f+fuzniIlr0OhQnQWnfgzpqI8tdHkXyhLihzPQb563MAaz80k0XgMX5oEK/TCQ8abd9qvygzPfotw06yTQp6vCW5FYa6P/oUWuDbQOWk2csT6/xQSrdmV9xFlS/u7C9L6X1cZQIDAQAB",
  "studentrnd.org" = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsgGYbFpNq/ueZ8OYzRkxTKFQ7eKm0I79aa0S6AwtXC0jfCYQQkucAdg5FJWUb0taljEOBCqrN8TRmKFYDuU1GGDjG382t8XokNaM5h/xhNc0rETaWa0i/Dr2zuTOQv5Pdw385ihNgYevKk5CVhGNtPgZRrgbC8aT4e9RJEQNO5bwa7MT+sxpB1EzVRHGkFOnY+a4yzJGcD59AaoVYdNbO9jRiz/VrLS7O6Gr0dTuwU3eDsF7zTGbGodVKmgKeRvNqEjz/2eRi/VtxHPi9sB6PFstWJasw86zM991F7fIR0n4Hsd2w0rjbTd/utZm8T/FDncpUsfPfMCvGz3Sl5GwXQIDAQAB",
  "codeday.us"     = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA3jWlN2N8Rx5rmwzF2l9C/3XR3fJTJQ6ar67cmR5aE8ZqTd/UrWabqMJl+c+j6YLMEC1KR+SrVIN0bZ5A7MQ+rYB5gk+SvSuOxf26kDmSLxDTKspKzhuEZ4IpKRx2eSI7vB+uJwxx8ozbg/+4yFD+qozxC7yxA/YoUTfvv/L5ejfk0KZVHNLtior4qY/nizDBtOiPjulp0uCpX3QOkQZdynv2cOmywmEuvWRGZ+vcqQonsgyIcowPJSbu51KhCZ/GN64wRcRbutg7r2aWP5v8iH/WLVeRBdiv5NC+EwImDYSErVFxeNO8WOl9AJZUBDHMSYXq1Jaunf6uxq6CzWQF4wIDAQAB",
  "codeday.ca"     = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqGo8mF1BHLcw4cratUrhActW8KfeSN84oF2UC1DekjmamWMD/pJKjd2cLXlMIl0Ivb3ZAzB3/ACEAMojdDXDB8U0IOFlE3XUbVi9LJad5FhXhgdpYtzxTXGCyNCWL61ZQDr+pt4s6wdRoFh04/6WOh8YSOyPD4mTtdlmeNMiNLu5zQ+4xfzDzLuV9ABOE+SeYq+UpvgowzDI66h+Y2hkuZFC6tIyitM8VfGMGzq0G2/b6ddB9ZGidADxD/ORvjdpAgTXyporYPNiOuEUjYaYDLSxbnYY1WVcBwAJwIMElNRg244f3+hJ5mVg+E695Qxf1pv8Ogc/xxUq1zvnT9jTTQIDAQAB",
  "codeday.ch"     = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvrE6nGTcpjmr9XHQWC5fdBwXtFSYOfhchSogoQXzT3v5sbCgno6tOLbaHz3SqyqcYoA8SytSME3DmoKKy7CT61S0vSNLCs8DEMjixUQQRZSPkNdZYqbOTUZpBD7EwZCQlj3kpen50V1MgDGStM548XD/TfWeISJ4QKU0PSQnfVhMiUyC4g52ue/TFF0eODHh2aju8Ikqd/Ua9A19VwIX5mBY5SJEIeJDQ88yNlwyLHqWTItvj8d5PuRWBrGf0bbjIR7M2ddiL9gsXBykL0Zy2zOJRA/f6zBKD28s41Ej5ajNCNRrSMEJtxdWaQFum2t4ayj2yS43L7tti0DNajdmMQIDAQAB",
  "codeday.ee"     = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAg6zwzpiBIy6Ty7mxSNE3sBpJvwN7hALcn8E9qT07ymdPCYht7hMRDXBvvUfobofwufGfHfccjhz7l/Ib0q8scP88hZ4wnvoKeIPkaD89JajJhoF/ZaVzui3UbUJmf9MRJDtZcQNLP6qXlVUZC8F8Xo5rz+tEr3pn0KpcrtSHWd22IJ4u9agCcj3qIbUiMG6u/X1IRf4LbdH96h60f+fuzniIlr0OhQnQWnfgzpqI8tdHkXyhLihzPQb563MAaz80k0XgMX5oEK/TCQ8abd9qvygzPfotw06yTQp6vCW5FYa6P/oUWuDbQOWk2csT6/xQSrdmV9xFlS/u7C9L6X1cZQIDAQAB",
  "codeday.es"     = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAg6zwzpiBIy6Ty7mxSNE3sBpJvwN7hALcn8E9qT07ymdPCYht7hMRDXBvvUfobofwufGfHfccjhz7l/Ib0q8scP88hZ4wnvoKeIPkaD89JajJhoF/ZaVzui3UbUJmf9MRJDtZcQNLP6qXlVUZC8F8Xo5rz+tEr3pn0KpcrtSHWd22IJ4u9agCcj3qIbUiMG6u/X1IRf4LbdH96h60f+fuzniIlr0OhQnQWnfgzpqI8tdHkXyhLihzPQb563MAaz80k0XgMX5oEK/TCQ8abd9qvygzPfotw06yTQp6vCW5FYa6P/oUWuDbQOWk2csT6/xQSrdmV9xFlS/u7C9L6X1cZQIDAQAB",
  "codeday.fr"     = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAg6zwzpiBIy6Ty7mxSNE3sBpJvwN7hALcn8E9qT07ymdPCYht7hMRDXBvvUfobofwufGfHfccjhz7l/Ib0q8scP88hZ4wnvoKeIPkaD89JajJhoF/ZaVzui3UbUJmf9MRJDtZcQNLP6qXlVUZC8F8Xo5rz+tEr3pn0KpcrtSHWd22IJ4u9agCcj3qIbUiMG6u/X1IRf4LbdH96h60f+fuzniIlr0OhQnQWnfgzpqI8tdHkXyhLihzPQb563MAaz80k0XgMX5oEK/TCQ8abd9qvygzPfotw06yTQp6vCW5FYa6P/oUWuDbQOWk2csT6/xQSrdmV9xFlS/u7C9L6X1cZQIDAQAB",
  "codeday.in"     = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAy3Wq20yL8689ksbor7Jvq59NQXtRpBWUxXELEMLOZAdhwVAbn9S1hxYxowAuovVxEc687wFSfEJHn5ZkxbLUnDuZN0tPdgtcWVRuLqNPqaxU2nZ0KRzgTVsELPC9JSiaz/1OwWvjUot3YXRVAabQWPIFfwnEXIESKZSDOeROTrEe+r/2rdMJop6roFRnunuad8hvPqouJLKTa1razZ2oLvEv78VJc8/92cnkjKKigdMoll9u5KoIocBJ+Mjct4RCoRQxKERaRo89wPjvbVukpm/y+3OYQB4QgA6kRVL+bgMnB71LaIxv8qb+J4UYunYl9orEL646Cd/oaWG+JSrgEwIDAQAB",
  "codeday.it"     = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA7Y52TSA5sErxNNWj5HYWOwJa7GNxAsws9ZjTW8Z62/00ECzEJFBMcoHW0D5kCrOv6fVnCvgiPMC4q1PmZD3FV4ULUA6HWklEqUetMPqLFbedwy3LBPaVikg6UEjRL+M3LKukouXwiOrFRm3mBh/rd56Cee8C8mkY8vfjyFLnoAd/BOCTcvZN59jubVQPSE9VVj5eT9ufLN7VS6rL+yAfjZH4d0+TqFS1+gHSlqeTbGU5cNzpkUuWOiTVZQali1JVTf/55lSC2IBiluMlLf8tcNTJZTDMecs4mU9DFH65tPDf6ox5G7UwRk4JxZbMierQ9LbnCRW/gvSo72V7f1bLPQIDAQAB",
  "codeday.se"     = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAlwJhjX9u4qM6b7gkFHRGBnC/GmPI2X4DbeshhFak0JDxfUyladS8+Uv2rgocJazYI0+3Xcz33d/GLxVKp+uL2WjJsBHG6slvfTN2S8geliiHcjdhFmMlyOO7PsZOvuGe5Gnl5n7p69y4hT1o0SDmMrPrmMNGhxThrNmVqUFTb+uASLF7wyEIT1IbJEwftlHAypElm0h6afzveOwFWsbPpVKSmBS4Bc+sR/DvRTjWH51nkf/8L8WKuMdkrWJnhGWfdUFQCXDIbnZhiVo5nhlyp5IuS9vFWu+oOVWPOjGkc7flptYeSQrPZxpYi1B/rgKdL9DAJYrgf+15W8GDCdqGJQIDAQAB",
  "codeday.co.uk"  = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzIi0XTtuTAI/HZ+1vxZ0WV+07ezbChpnxnbyBqC1kU11mJWKGHhwb+8Nvw5qQaxYIsgeSOh21pQKOgZhyFopdG3HG7Vrx0VcB+szXr5uqrsFxddu8LCvYB23WyfQrjmj74FqOmBImFP8SSDarHuvMXz4zL5A/4EMLfejid51KH6IXGOXD1dk6Wy6wwXyu8fqv+DoE90DPKkLNzO5vtix4EJV0SkTwDnfihR2FDQXOaZYagndVGKnm/hOpnlbKADo5VUjcq4AeZLP2IJrgV2AozKpNXg5wnztKOj5AmBCcHVIJdcApNUFcH78GeTNYuIo+HatXeSt5awQZjlCts4h8QIDAQAB",
  "srnd.org"       = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAg6zwzpiBIy6Ty7mxSNE3sBpJvwN7hALcn8E9qT07ymdPCYht7hMRDXBvvUfobofwufGfHfccjhz7l/Ib0q8scP88hZ4wnvoKeIPkaD89JajJhoF/ZaVzui3UbUJmf9MRJDtZcQNLP6qXlVUZC8F8Xo5rz+tEr3pn0KpcrtSHWd22IJ4u9agCcj3qIbUiMG6u/X1IRf4LbdH96h60f+fuzniIlr0OhQnQWnfgzpqI8tdHkXyhLihzPQb563MAaz80k0XgMX5oEK/TCQ8abd9qvygzPfotw06yTQp6vCW5FYa6P/oUWuDbQOWk2csT6/xQSrdmV9xFlS/u7C9L6X1cZQIDAQAB",
  "studentrnd.org" = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsgGYbFpNq/ueZ8OYzRkxTKFQ7eKm0I79aa0S6AwtXC0jfCYQQkucAdg5FJWUb0taljEOBCqrN8TRmKFYDuU1GGDjG382t8XokNaM5h/xhNc0rETaWa0i/Dr2zuTOQv5Pdw385ihNgYevKk5CVhGNtPgZRrgbC8aT4e9RJEQNO5bwa7MT+sxpB1EzVRHGkFOnY+a4yzJGcD59AaoVYdNbO9jRiz/VrLS7O6Gr0dTuwU3eDsF7zTGbGodVKmgKeRvNqEjz/2eRi/VtxHPi9sB6PFstWJasw86zM991F7fIR0n4Hsd2w0rjbTd/utZm8T/FDncpUsfPfMCvGz3Sl5GwXQIDAQAB",
  "studentrnd.com" = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAx8naiVCH6yPcA7SsWXz/eMJu7jy+IT4pv0VhONQoQHOkPzMQtaYwkPSqZgrOg6fy+s4S53B6R9ob9d1+kPk7r/FsntPmD6Sc49KWpTyuruJUZAlS2LMj2SFP600Fehk5DuQxKYLykz7ZI7/CFQnnFhiPMNjrX0Tc31ZRjj1Xw7Gg5K9DKXU9RbWoXWHCzyrgKRRkdsp3qfptzC3DRk9tazlrXEiEuEDHTqTvb/KQYpnatg5H0KhPSKn/RoLSjE/cGdfadzjG5OjshVbRGKm2L63Hg9lXcOkB1GXsRAa4eSXFI9Y9+okZzQqppgs9iqbISgJ9OzUoNK06I52akMqMnQIDAQAB",
  "codeday.us"     = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA3jWlN2N8Rx5rmwzF2l9C/3XR3fJTJQ6ar67cmR5aE8ZqTd/UrWabqMJl+c+j6YLMEC1KR+SrVIN0bZ5A7MQ+rYB5gk+SvSuOxf26kDmSLxDTKspKzhuEZ4IpKRx2eSI7vB+uJwxx8ozbg/+4yFD+qozxC7yxA/YoUTfvv/L5ejfk0KZVHNLtior4qY/nizDBtOiPjulp0uCpX3QOkQZdynv2cOmywmEuvWRGZ+vcqQonsgyIcowPJSbu51KhCZ/GN64wRcRbutg7r2aWP5v8iH/WLVeRBdiv5NC+EwImDYSErVFxeNO8WOl9AJZUBDHMSYXq1Jaunf6uxq6CzWQF4wIDAQAB",
  "codeday.xyz"    = "",
  "codeday.org"    = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAkTByyGNx30HTW8fsIbaF+ihN52g1ernVuWuNw7PmbtTwl+MG8XcYMNVqO6IztX3Q5ri3GvHRtw7caO/nUmvNWeBQpBOLUFCX7Wlwv6wSta/q3tLU5x0z6/WtC1Foa902UrU+0fz3TVCqxGdRQgqjMaeDpUeG2UNRNuFhTpZfrsaPsI5GWJiPR2C4LYROY5kr2lQXVB+rTGUPNhYU1BL08ra73XWkawn5DdWcAKlhJReVhqXMe1j9xYAa8RzuRqvdfbDx7Cd9kMms59Jm5LLQB8wRVdj5u2XBDCXsvnh8UHBH9N2hzb+PYbpG3siZlh9Ov0pt/OpmyQsd0OCo+Iwy2QIDAQAB",
}

vercel_project_id = "VERCEL_PROJECT_ID"

aws_region = "us-west-1"
