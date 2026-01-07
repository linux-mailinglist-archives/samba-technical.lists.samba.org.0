Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E48CFFCE8
	for <lists+samba-technical@lfdr.de>; Wed, 07 Jan 2026 20:43:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=RrJstrMrqTyof5Map5IaBsio4+p269zZO3fxKflWu7I=; b=E1fYc/qIXTFi0CvJ7+2Mn/P6f8
	Mi5Bk4I6ZptVFksHaCxQCqheGFNXwQGYJZmAl+noRkWqzhl8V7T34ZfnKNl0PcNdPdQqLy41YwOkA
	Q5UA6pLLJ/SkBJplXchTznaJLl3b19eOyLNvbgyR3LOnqrey0qAVk++c1tsH9+7IprXCtxMZee7Ui
	QsMSpJPdAY4Bw981OLfelKGnxz7xasC69NxAJOa4bx7xHnpnQL8ZZ6MowINSCi5bSklU5BVQbJO/T
	2lKP9eUA6OC/Xsoyz4pWVDsyNUmd2wnT8iA4BrpgRIwmLrlZcp+w6mf1kKYNrZoyExoTWBWgpXK0B
	36dGQfFg==;
Received: from ip6-localhost ([::1]:40024 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vdZQj-001br4-8F; Wed, 07 Jan 2026 19:42:53 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:58486) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vdZQe-001bqx-6p
 for samba-technical@lists.samba.org; Wed, 07 Jan 2026 19:42:51 +0000
Received: by mail-qt1-x835.google.com with SMTP id
 d75a77b69052e-4ee1a3ef624so15841781cf.0
 for <samba-technical@lists.samba.org>; Wed, 07 Jan 2026 11:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767814966; x=1768419766; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RrJstrMrqTyof5Map5IaBsio4+p269zZO3fxKflWu7I=;
 b=Lg6g2VpLyXB1vREL2FuOaWUgBdBhVzZtMCZvQAaBRrup8WpbNRkXHjMQmy0ci9lkR1
 nLMFpWv5SS01wvVyIRgK4yfl3idefuRn8NqE98ctiKzuKrntPUqLQTBHgb3g0GtiOFJC
 2v5nyiOetVcaVWumgwRuHD+IS7Y9KSMHMQjaenMIw6N/MIkcGDu24wEocSdf4eBkX0tO
 yWF1x2rejSgkbUZEoHVDojRXKT1JM2n0h2VDWq6tSk3rlNBDI5A1p7fwETX9QmyqS9U0
 e+hEgsJ7/aV4c9wxdj50aUQFbftc6NfsqLmxfw95i0nkLvMK9EUTjQKG9Ivoqo7+PF6j
 QHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767814966; x=1768419766;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RrJstrMrqTyof5Map5IaBsio4+p269zZO3fxKflWu7I=;
 b=XW1m1YfOF5f7TlJfMINBA7FBczSpDgz3HDWZg7MNIleyLixh746DwU7+h39VgKWyQG
 2G3IPYHXR13UIZp0Tdb9g3ffsU7C+rttMoH8gx7S84OVBIaIlYNBxc3C0fLnhZy//Knz
 MBC+pf6DugxvSpWm+0GBFnnx7t61N2cYSSu8h3ssdx+MGkopsV/3dABiG4GXNPuqv8xA
 pzjDzqwGCstbLxi/D7qILCW4IRjZISJ7YLalp8JEJBXq0nRs9gG0PurxNnWkzPLJK+T0
 t1pL8yRejJpiv8JWzsfM+GZGSTlaCZ+ji1L6Z3si3De2V+/AUI2pNvQxpcjzUB0nty5y
 MIFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVD9eOH10NrlGMKGau0jhO0jUpX+iYyp1Nq2j6kRSNYAU9vRirXonU/K3o4gusMrlFEtHJAlKpnblRM6ixxaEs=@lists.samba.org
X-Gm-Message-State: AOJu0YwwbPZfDsW+N/50nR0zwBr3BS1ASZAw9G4FxSlXjA31bh4hvkWL
 J+OVtlZbUpqERertEGIEp2xyQ7VGSpFOVKNjfP980yyupufw1yQfPNyItNkhoSXyh4xUisJWpwx
 9tir8OFlF5gkmBFqXBI6ASdxlbVVQK4Q=
X-Gm-Gg: AY/fxX547XNfx0G37une14p4q+7T9TonGUF4KzJBn3DgWHbda9t/38iVcnlAyIx94ti
 KKCsvbMdriKHyx9e6IkJLFPbq6ozyonrwiV1E7bYUqP/vEyCk1yMTN0IBky3WdhBZ2DiDxr+Khw
 l0MtrsxY3zASfk948dtDwipQG6E2/bad6JKwJf30qlSJHpPjHWcw10mhC1AQF9GSJK4DV3FELGP
 mQfQAO9tW3hs9bGKA2d8/5/frzaytgiWRvVvwtUbf2PL6epb0E/mIqsMLhYT3vFU613T9F3w2XC
 oK//hAkGPM/q1ji3mDAcJfDHYWMwy2Wmgn2z/sq+2bIQ5ZP+fM1ADAXtQfNPsG9pECMQSMy4zBw
 I4R8IquM1RKVdjjCyOPyQ2tpElf88i9YE033esmZRaIC/wU7r4AiuPKpLaU6lT+6qzSN6hE+IP6
 O1GjHnTB2tlQ==
X-Google-Smtp-Source: AGHT+IFG1CZCa9tjwyqnbeHdgMh1ksapd1SxPMnNo9v8X/+IXDRYNllJ0L6yORl8nFDhKQTHLS/ppaf7LEHlHyEOBAQ=
X-Received: by 2002:a05:622a:13d4:b0:4ee:2984:7d95 with SMTP id
 d75a77b69052e-4ffb48bb23cmr53833691cf.13.1767814966156; Wed, 07 Jan 2026
 11:42:46 -0800 (PST)
MIME-Version: 1.0
References: <20260107043109.1456095-1-chenxiaosong.chenxiaosong@linux.dev>
 <20260107043109.1456095-2-chenxiaosong.chenxiaosong@linux.dev>
In-Reply-To: <20260107043109.1456095-2-chenxiaosong.chenxiaosong@linux.dev>
Date: Wed, 7 Jan 2026 13:42:34 -0600
X-Gm-Features: AQt7F2rTzFZ0re9THqHEcrtcQxAiCgF1cs6Xyk4eyEkdw-30vEMjm5PaXDgKaig
Message-ID: <CAH2r5mtb65CsxQ_XnJGDWmmgERxHAMNNA31rdG4b8c5ibdEEBg@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] smbinfo: add notify subcommand
To: chenxiaosong.chenxiaosong@linux.dev
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

done - added to cifs-utils for-next, pending any additional review
comments and/or testing

On Tue, Jan 6, 2026 at 10:32=E2=80=AFPM <chenxiaosong.chenxiaosong@linux.de=
v> wrote:
>
> From: ChenXiaoSong <chenxiaosong@kylinos.cn>
>
> Add `notify` subcommand to query a directory for change notifications.
>
> Example:
>
>   ./smbinfo notify /mnt/dir
>   # Then create a new file `/server/export/dir/file` on SMB server
>   Notify completed, returned data_len is 20
>   00000000:  00 00 00 00 01 00 00 00  08 00 00 00 66 00 69 00  ..........=
..f.i.
>   00000010:  6c 00 65 00                                       l.e.
>   # Call `ioctl()` again
>
> Press `Ctrl+C` to exit `smbinfo`.
>
> Link: https://lore.kernel.org/linux-cifs/CAH2r5msHiZWzP5hdtPgb+wV3DL3J31R=
tgQRLQeuhCa_ULt3PfA@mail.gmail.com/
> Suggested-by: Steve French <stfrench@microsoft.com>
> Signed-off-by: ChenXiaoSong <chenxiaosong@kylinos.cn>
> ---
>  smbinfo     | 78 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  smbinfo.rst |  2 ++
>  2 files changed, 80 insertions(+)
>
> diff --git a/smbinfo b/smbinfo
> index 2e9e42d..57e8a0a 100755
> --- a/smbinfo
> +++ b/smbinfo
> @@ -27,6 +27,7 @@ import struct
>  import stat
>  import datetime
>  import calendar
> +import threading
>
>  VERBOSE =3D False
>
> @@ -36,6 +37,7 @@ CIFS_ENUMERATE_SNAPSHOTS =3D 0x800ccf06
>  CIFS_DUMP_KEY            =3D 0xc03acf08
>  CIFS_DUMP_FULL_KEY       =3D 0xc011cf0a
>  CIFS_GET_TCON_INFO       =3D 0x800ccf0c
> +CIFS_IOC_NOTIFY_INFO     =3D 0xc009cf0b
>
>  # large enough input buffer length
>  INPUT_BUFFER_LENGTH =3D 16384
> @@ -294,6 +296,10 @@ def main():
>      sap.add_argument("file")
>      sap.set_defaults(func=3Dcmd_gettconinfo)
>
> +    sap =3D subp.add_parser("notify", help=3D"Query a directory for chan=
ge notifications")
> +    sap.add_argument("file")
> +    sap.set_defaults(func=3Dcmd_notify)
> +
>      # parse arguments
>      args =3D ap.parse_args()
>
> @@ -905,5 +911,77 @@ def cmd_gettconinfo(args):
>      print("TCON Id: 0x%x"%tcon.tid)
>      print("Session Id: 0x%x"%tcon.session_id)
>
> +def cmd_notify(args):
> +    try:
> +        fd =3D os.open(args.file, os.O_RDONLY)
> +    except Exception as e:
> +        print("syscall failed: %s"%e)
> +        return False
> +
> +    thread =3D threading.Thread(target=3Dnotify_thread, args=3D(fd,))
> +    thread.start()
> +
> +    try:
> +        thread.join()
> +    except KeyboardInterrupt:
> +        pass
> +    finally:
> +        os.close(fd)
> +        return False
> +
> +def notify_thread(fd):
> +    fmt =3D "<IBI"
> +    # See `struct smb3_notify_info` in linux kernel fs/smb/client/cifs_i=
octl.h
> +    completion_filter =3D 0xFFF
> +    watch_tree =3D True
> +    data_len =3D 1000
> +
> +    while True:
> +        buf =3D bytearray(struct.pack(fmt, completion_filter, watch_tree=
, data_len))
> +        buf.extend(bytearray(data_len))
> +
> +        try:
> +            fcntl.ioctl(fd, CIFS_IOC_NOTIFY_INFO, buf, True)
> +        except Exception as e:
> +            print("syscall failed: %s"%e)
> +            return False
> +
> +        _, _, data_len_returned =3D struct.unpack_from(fmt, buf, 0)
> +        print("Notify completed, returned data_len is", data_len_returne=
d)
> +        notify_data, =3D struct.unpack_from(f'{data_len_returned}s', buf=
, struct.calcsize(fmt))
> +        print_notify(notify_data)
> +
> +def print_notify(notify_data):
> +    if notify_data is None:
> +        return
> +
> +    data_size =3D len(notify_data)
> +    if data_size =3D=3D 0:
> +        return
> +
> +    BYTES_PER_LINE =3D 16
> +    for offset in range(0, data_size, BYTES_PER_LINE):
> +        chunk =3D notify_data[offset:offset + BYTES_PER_LINE]
> +
> +        # raw hex data
> +        hex_bytes =3D "".join(
> +            (" " if i % 8 =3D=3D 0 else "") + f"{x:02x} "
> +            for i, x in enumerate(chunk)
> +        )
> +
> +        # padding
> +        pad_len =3D BYTES_PER_LINE - len(chunk)
> +        pad =3D "   " * pad_len
> +        if pad_len >=3D 8:
> +            pad +=3D " " * (pad_len // 8)
> +
> +        # ASCII
> +        ascii_part =3D "".join(
> +            chr(x) if 31 < x < 127 else "."
> +            for x in chunk
> +        )
> +
> +        print(f"{offset:08x}: {hex_bytes}{pad} {ascii_part}")
> +
>  if __name__ =3D=3D '__main__':
>      main()
> diff --git a/smbinfo.rst b/smbinfo.rst
> index 17270c5..91b8895 100644
> --- a/smbinfo.rst
> +++ b/smbinfo.rst
> @@ -98,6 +98,8 @@ the SMB3 traffic of this mount can be decryped e.g. via=
 wireshark
>
>  `gettconinfo`: Prints both the TCON Id and Session Id for a cifs file.
>
> +`notify`: Query a directory for change notifications.
> +
>  *****
>  NOTES
>  *****
> --
> 2.43.0
>


--=20
Thanks,

Steve

