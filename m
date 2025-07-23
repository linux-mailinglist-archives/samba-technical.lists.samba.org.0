Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B408B0F53A
	for <lists+samba-technical@lfdr.de>; Wed, 23 Jul 2025 16:25:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=1bqVPa9XyXao1MJcocBCQSmuynElGdsiJne42/gHwec=; b=W66x1S1A0FjZ7lWvK020rrfwKz
	z6sF7VtroZ5S3JkZt1L+YHHIbSX9PBk6obhNdfJiqaFkGJLUIL822Kv8FAA7g+IAvIKAvE5wpsO9x
	KqmKjjGKJcasarwKs2AVwXCajvtOnwbflBhZmIus569I2WoM84M09zN0S/VdyS4YyVVmWzJ68FSlO
	kLPml8a9njtyl6b1Hlhcmi4G0+LvTvd4dEeJK12dJFzRoXMQtd90FTtdFsDQrQqpztnP0gJtBb1Re
	Bv+GofNRWJMustET1ZMinZhywQw9paOaBqGW8hcPgPvEQzQJVJ4xFwQSAvncAB68bShfksT8UhZ2D
	pSbPuk0g==;
Received: from ip6-localhost ([::1]:53286 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ueaOw-00BgF7-Vj; Wed, 23 Jul 2025 14:24:59 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:52342) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ueaOs-00BgF0-CF
 for samba-technical@lists.samba.org; Wed, 23 Jul 2025 14:24:56 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-704c5464aecso61016556d6.0
 for <samba-technical@lists.samba.org>; Wed, 23 Jul 2025 07:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753280692; x=1753885492; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1bqVPa9XyXao1MJcocBCQSmuynElGdsiJne42/gHwec=;
 b=gqIXrgkB+nRN1CPYkNnfLZtukzxLxEOvwh4baI/tdLcIDiarJlsx+H00LkTcxjckxg
 ET07hHx+prBBv29u/CUe5ThCK12YiMRMurl89k/IbrnLbYwc1GyCmAN1hVzxqEM77v8n
 9y3Vj3a4rVkugXLIS/FB0PieXYZG8lAEcDHmjBkRL5jwZia4yqSe3JIeoN2Xx11iXvsV
 v6G8fw0jpw9zcgd86PjAGf4Igdge28EepqIaEHUO1EgWBuXGcj4ClmLm7Nbo2kSYTw6Y
 2Z0i+4VnRoW/gxVSbpZB9rDeH0wknGpBa2C2bFB2wAkNdKToPncu9/pOKfcH2zBUlSCg
 fohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753280692; x=1753885492;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1bqVPa9XyXao1MJcocBCQSmuynElGdsiJne42/gHwec=;
 b=eWtACUI0vd9ddSH5I86J+u61U+YMUI7+kuRWC7iIED3Y6AtiA+Z4DadU5ImMnvi6Q0
 3UnRoHrwr46MzJn2daNG3q5dUrGRI+OMDsg9VwPJpib+SX6FSkJzJHl3neqnOoLw76oo
 zUPXw6JDBv9AXe+qfZvEdF2VtS+Jd3wRXtTTm5lbOX8tcGiJhWvbagvvujjg/DvvCL3m
 T+4LzMVtPlmZj3pAi6/nT4g2liedzHSHtR4xBi+AwK/HK2T+P5bUh8mo7H9kKOqNdkNL
 maKITa/+8+JEV3lqBPhbiLAmU+9Xa8cuz8Kul24sUODWgLCFNwBd9j/A/3eAw27HqQmS
 VBNQ==
X-Gm-Message-State: AOJu0YwyVl39mVWAO4NmQnTaI2kAUgNWuqXGs+1O/UNpx+yPpmcHopqI
 phSyrhQLvweL3Nw0VdDAcYqG4QZ2ePGp+ykXoV+lSVMLwBpEbX5H/dagJASAnCU+FbYgEjzsDJk
 gfgkQqeHbxuHcUJBp0hHomY3bL8yGl1Q=
X-Gm-Gg: ASbGncsChdu2JESIYmBKW9MOU0Ok1foiLLN21WOlpRjZTzZbdcNaPqiG6bDdjMtutJH
 Ryu3VTYHFWYDClUgdxmSpSCX69FPMpSChBpVwm1mwiT9nfb9XXkozI98zEBYQbe3p+H8JHTWwk8
 cU1XXrCv1/5/qJ6qC15Nk+LCfnwuv46oiegBk4jRgt97RLfX77P9IXOWspNLsq//Icqpb49OHw+
 NJWOK1J8IiusW4RGIvaxqliO/wwnO26giQ6FXQz5mTB1jGm+bmp
X-Google-Smtp-Source: AGHT+IHdIUMG4tqijcPBaY868AfWSnmymkB2Sp1X6NXqpdb7A3JuYfSwfN5/AeXnGDEWmtkmU9DihiEBvgtUck0Y2bE=
X-Received: by 2002:a05:6214:c2f:b0:706:6967:4af9 with SMTP id
 6a1803df08f44-707008670c4mr49654396d6.42.1753280691897; Wed, 23 Jul 2025
 07:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mvaM2Fuytp9DH3RahQ-W_mQPpi=GBuKET6do1pmyiWT4w@mail.gmail.com>
 <aIBOfm6OKYlATpAs@jeremy-HP-Z840-Workstation>
In-Reply-To: <aIBOfm6OKYlATpAs@jeremy-HP-Z840-Workstation>
Date: Wed, 23 Jul 2025 09:24:40 -0500
X-Gm-Features: Ac12FXzlYLQEuLYuXZGrtWhIZEMlPtueMpSQaFCNSiooaiKxPskemBvSItl3PrI
Message-ID: <CAH2r5mvEAfDMhNyhzL877EjBsmdBavWeLQaVQKc+gmueUSXrrQ@mail.gmail.com>
Subject: Re: smbclient posix_mkdir over SMB3.1.1
To: Jeremy Allison <jra@samba.org>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Looks like a little bit of progress, but still fails all posix operations:

smb: /> posix_mkdir dir0 0755
smb1cli_req_writev_submit: called for dialect[SMB3_11] server[localhost]
Failed to open file \dir0. NT_STATUS_REVISION_MISMATCH
smb: /> chmod 0776 file1
NT_STATUS_ACCESS_DENIED chmod file \file1 0776
smb: /> posix_open newposixfile 0777
smb1cli_req_writev_submit: called for dialect[SMB3_11] server[localhost]
smb1cli_req_writev_submit: called for dialect[SMB3_11] server[localhost]
Failed to open file \newposixfile. NT_STATUS_REVISION_MISMATCH

On Tue, Jul 22, 2025 at 9:52=E2=80=AFPM Jeremy Allison <jra@samba.org> wrot=
e:
>
> On Tue, Jul 22, 2025 at 04:54:29PM -0500, Steve French via samba-technica=
l wrote:
> >I was noticing that with current smbclient (master branch) most POSIX
> >commands don't work when connected to current Samba.  I see the
> >SMB3.1.1 POSIX Extensions negotiated, and in some commands I see the
> >SMB3.1.1 POSIX create context sent, but none of the posix commands
> >(e.g. posix_mkdir and chmod and chown) work. After connecting to
> >Samba, issuing the command "posix" succeeds (but doesn't send anything
> >on the wire).   All of them fail with the following:
> >
> >smb: \> posix
> >smb: \> posix_mkdir 0755 dir
> >Command "posix" must be issued before the "posix_mkdir" command can be u=
sed.
> >
> >Is there a trick to turn on smbclient allowing SMB3.1.1 POSIX/LInux Exte=
nsions?
>
> Try this (completely untested :-) patch.
>
> diff --git a/source3/client/client.c b/source3/client/client.c
> index e96efb9ea23..d0ea3a12667 100644
> --- a/source3/client/client.c
> +++ b/source3/client/client.c
> @@ -3173,6 +3173,9 @@ static int cmd_posix(void)
>
>         if (smbXcli_conn_protocol(cli->conn) >=3D PROTOCOL_SMB3_11) {
>                 cli->smb2.client_smb311_posix =3D true;
> +               CLI_DIRSEP_CHAR =3D '/';
> +               *CLI_DIRSEP_STR =3D '/';
> +               client_set_cur_dir(CLI_DIRSEP_STR);
>                 return 0;
>         }



--=20
Thanks,

Steve

