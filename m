Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE1F92D984
	for <lists+samba-technical@lfdr.de>; Wed, 10 Jul 2024 21:49:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Mn7tf1n9eqS4vdwHAMfIoIm/ajGZvR74ISU+VBQiKkM=; b=fXFvMXmUbUEOzmRuP+PfauTXib
	6+RCOdbLI3Qo82vY4/m/0wbv4R4cNfyeOyArW11/NWpF3/wgJ2o02qhuBbm2whp8j1mEdOBIS/uMu
	o4MdoVeBmRlygbWMo7aKWwdy3ntrFCynLEJ00REM3tqsQR7GEFK4fHt1gsPS2Kjx9Dmrbk6/Tkxff
	179/VuzumB/XSOCZ/1gAKE2XXw2gOVrj8DTNeki7Wnrt3wMwV7t+fYyM4m7lBiP0djx7h+ocakJsT
	eJXU6GB23FL9WXBbrhTUxPUNPLVa69RC/pP6Wj1wYHyHrxhsxi5SoCHo7QnZ1DC42iKKyXawzd84d
	6A14Y2Nw==;
Received: from ip6-localhost ([::1]:28314 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sRdJZ-000P0X-22; Wed, 10 Jul 2024 19:49:21 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:46585) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sRdJU-000P0Q-Pm
 for samba-technical@lists.samba.org; Wed, 10 Jul 2024 19:49:19 +0000
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-52e9b9fb3dcso178750e87.1
 for <samba-technical@lists.samba.org>; Wed, 10 Jul 2024 12:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720640955; x=1721245755; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mn7tf1n9eqS4vdwHAMfIoIm/ajGZvR74ISU+VBQiKkM=;
 b=TzHHhw9SRG5NxSlXHi4HN7g0a41LLEfGrsGantzpDA1vlpOhvb3HW28crH3KB/h1OY
 WhSYEQrPWVshUJPhrOJL3jcsUi0n/bvlt2/ulescdJz8pxQ0MVVoUkIkYDfYt0EOlit5
 ZTQ+eW5+cJBT9YkxASQeWPLr5EUsdSNzGKpzkODNbaGLew3dPLOKKjpXzhnnOSHY/OMH
 dbZPeneqI3UYqWwBiGdCgeSg5P5/xKw5dnWzVuqxiTesHgbsFRkiWO5SWNZa8DzufYQm
 5ERznMWp5gvujhccsdo6yxGjpwFQEk7B9/Ywyr5nwu8WnwIZjuKNVk9pE3VQbUrBm5sI
 3jOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720640955; x=1721245755;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mn7tf1n9eqS4vdwHAMfIoIm/ajGZvR74ISU+VBQiKkM=;
 b=v6+YPpvR8iUdRix83fBVxLltJtY/j9SgZvJeyij7KmreybxfMOvnqVt2cmarCW+NNv
 tMjJpRvdMeeh6vLh1RE3dxJrYW4TXasGMvRyP8T+7krt7l3Rs4bMwe4b2oTGp4n3xJ1S
 ASYN8YYQ9heBJM8gOoqWBBzbm1zxKjIH2vXYBm25xFdKK3IXvkuLAaE/5HSN7xsl+xf3
 iXyhq4x9uT7KvPfewZG2i6a3glQLGgeXY1qFW8/PTg9lGU97k6xTkdYYTtMZg85+msgJ
 QyLKpr+MIk1V110WOrwBadRlEL6NnQ88K7ZDExEflbqrtCtWn2kxqI9Hc8bYv+Q4oZPd
 h06A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/FMLYFgDP4rhALPWl3wHrVPtx5EbmE5YuLyWKPOengoS/zPGJvejKXLozsaiGK5kvp+JLcMpGJkBWbLESIwryfJsHwc9+PgnK5MXv2OTW
X-Gm-Message-State: AOJu0Yzjtok5mprCrm0NK2ijHbw8OjSNvUTCtOYg4swirblpFmVFRKFF
 Ri8wSs/Bq95b3QgaZInB3X+LtAiXwhw4Hml4HJpIDR/2Imim161VIrMnpn5qMADq1zIC7ZW+CJt
 /uTQUYOvBoDrCh8M7LhU3ssptDy4=
X-Google-Smtp-Source: AGHT+IEyaVajNPO+TUbI0u+tauTGQUtgoPcUomKHl5sHgI13fZAn9wJR+ra/wRSqzZFh/zaLJFpc/1fthi6vaH6v3aA=
X-Received: by 2002:ac2:4206:0:b0:52c:e030:1450 with SMTP id
 2adb3069b0e04-52eb99913a3mr3412098e87.14.1720640954762; Wed, 10 Jul 2024
 12:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240705204352.975013-1-profnandaa@gmail.com>
In-Reply-To: <20240705204352.975013-1-profnandaa@gmail.com>
Date: Wed, 10 Jul 2024 14:49:03 -0500
Message-ID: <CAH2r5muZF19O4Atro_TjjiQsrhXT6fodZwwWuGskOxQwh8P=6A@mail.gmail.com>
Subject: Re: [PATCH] cifs-utils: smbinfo: add gettconinfo command
To: Anthony Nandaa <profnandaa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 Pavel Shilovsky <pshilovsky@samba.org>, sfrench@samba.org,
 stfrench@microsoft.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Pavel,

looks good - I checked it out and tested it.  It can be helpful in
debugging server logs to have this information (about the tree id and
session id for a particular mount)

Can add my Tested-by and or Reviewed-by if you want

On Fri, Jul 5, 2024 at 3:44=E2=80=AFPM Anthony Nandaa <profnandaa@gmail.com=
> wrote:
>
> As a follow up on the patch on Linux: de4eceab578e
> ("smb3: allow dumping session and tcon id to improve stats analysis
> and debugging") [1]
>
> Add `gettconinfo` command to dump both the TCON Id and Session Id of
> a given SMB mount; to help with correlation in cases when multiple
> mounts are to the same share.
>
> Example run:
> ```
> ./smbinfo gettconinfo /mnt/smb_share
> TCON Id: 0x1
> Session Id: 0xa40000000001
> ```
>
> [1] https://github.com/torvalds/linux/commit/de4eceab578ead12a71e5b5588a5=
7e142bbe8ceb
>
> Cc: Pavel Shilovsky <pshilovsky@samba.org>
> Cc: Steve French <stfrench@microsoft.com>
> Signed-off-by: Anthony Nandaa <profnandaa@gmail.com>
> ---
>  smbinfo     | 29 +++++++++++++++++++++++++++++
>  smbinfo.rst |  2 ++
>  2 files changed, 31 insertions(+)
>
> diff --git a/smbinfo b/smbinfo
> index 73c5bb3..3467b0b 100755
> --- a/smbinfo
> +++ b/smbinfo
> @@ -35,6 +35,7 @@ CIFS_QUERY_INFO          =3D 0xc018cf07
>  CIFS_ENUMERATE_SNAPSHOTS =3D 0x800ccf06
>  CIFS_DUMP_KEY            =3D 0xc03acf08
>  CIFS_DUMP_FULL_KEY       =3D 0xc011cf0a
> +CIFS_GET_TCON_INFO       =3D 0x800ccf0c
>
>  # large enough input buffer length
>  INPUT_BUFFER_LENGTH =3D 16384
> @@ -289,6 +290,10 @@ def main():
>      sap.add_argument("file")
>      sap.set_defaults(func=3Dcmd_keys)
>
> +    sap =3D subp.add_parser("gettconinfo", help=3D"Prints TCON Id and Se=
ssion Id for a cifs file")
> +    sap.add_argument("file")
> +    sap.set_defaults(func=3Dcmd_gettconinfo)
> +
>      # parse arguments
>      args =3D ap.parse_args()
>
> @@ -876,5 +881,29 @@ def cmd_keys(args):
>          print("ServerIn  Key: %s"%bytes_to_hex(kd.server_in_key))
>          print("ServerOut key: %s"%bytes_to_hex(kd.server_out_key))
>
> +class SmbMntTconInfoStruct:
> +    def __init__(self):
> +        self.tid =3D 0
> +        self.session_id =3D 0
> +
> +    def ioctl(self, fd):
> +        buf =3D bytearray()
> +        buf.extend(struct.pack("=3DIQ", self.tid, self.session_id))
> +        fcntl.ioctl(fd, CIFS_GET_TCON_INFO, buf, True)
> +        (self.tid, self.session_id) =3D struct.unpack_from('=3DIQ', buf,=
 0)
> +
> +def cmd_gettconinfo(args):
> +    fd =3D os.open(args.file, os.O_RDONLY)
> +    tcon =3D SmbMntTconInfoStruct()
> +
> +    try:
> +        tcon.ioctl(fd)
> +    except Exception as e:
> +        print("syscall failed: %s"%e)
> +        return False
> +
> +    print("TCON Id: 0x%x"%tcon.tid)
> +    print("Session Id: 0x%x"%tcon.session_id)
> +
>  if __name__ =3D=3D '__main__':
>      main()
> diff --git a/smbinfo.rst b/smbinfo.rst
> index 1acf3c4..17270c5 100644
> --- a/smbinfo.rst
> +++ b/smbinfo.rst
> @@ -96,6 +96,8 @@ COMMAND
>  the SMB3 traffic of this mount can be decryped e.g. via wireshark
>  (requires root).
>
> +`gettconinfo`: Prints both the TCON Id and Session Id for a cifs file.
> +
>  *****
>  NOTES
>  *****
> --
> 2.34.1
>
>


--=20
Thanks,

Steve

