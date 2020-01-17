Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEF11404A2
	for <lists+samba-technical@lfdr.de>; Fri, 17 Jan 2020 08:54:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Ewcmoyl+6W8TZGkDd/S2uQ2DNIJNVj7mIuv/mX9U2rw=; b=lnUauSiM/qiIoutVMjGLFeBLcW
	e07I/gAFQSGLWdBf0EPAUr3XnBWmeGYYl0A3y6HExHGdJgzRky31UFlHvMA2NalSc7EPhI0o4Mj5G
	VCcJ/nxZDDOr2b0FkDefH4YNy/ptDVjNhSofs3LV8D8jd0S83pL9givt8PiljHgUcyWlsrNX6ejKr
	9vNikhHnUiPTp6mEtjTjqnvKGpDtydm8y8MjCr9nFdsPSQeF7beRN/7WHKIEs7eMDj1Hx0rq5Yu1X
	g0XLKViE8w425QowOgEAwp7gZx2FCy5tMfkLFTGd58hTDVSkQsTMrVHL2TFVxTO/cAmAPjjt7ruFA
	LVCYOkew==;
Received: from localhost ([::1]:22686 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1isMRt-003jq7-Pe; Fri, 17 Jan 2020 07:53:45 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:37092) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1isMRm-003jq0-Ph
 for samba-technical@lists.samba.org; Fri, 17 Jan 2020 07:53:43 +0000
Received: by mail-il1-x141.google.com with SMTP id t8so20584723iln.4
 for <samba-technical@lists.samba.org>; Thu, 16 Jan 2020 23:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ewcmoyl+6W8TZGkDd/S2uQ2DNIJNVj7mIuv/mX9U2rw=;
 b=tC8YASmQVV85WcRMP7qiq+zbkH7k4UzmDanPJDpIyhVnmFg8WsNqNlbgpvrNxolEml
 dsAHC+covEKZmIy2JOMHcYF+nq/AHfDn2NtSnmIGb3NJ6bM+WNd4tuoAZx81Vb5nY8v4
 AqxvXgFuwDg2VU8aFuSYEmeJdldRCeNQMaR4tOYKL87vB4yZIB0/Maz+kTGr+yPh13Lw
 juE/jJWSmn2nX7tPlsLxSfSX9F5bHW1qacKlKxW5vuohcVrG7BCzkoOvKWi8OpPsYDUx
 xlx52akyKGSBEy+LII7ccOWLlkPw/geakJB2/D9UYqTNA1bNXB+FCncFO0zBqSHw9AzR
 +skA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ewcmoyl+6W8TZGkDd/S2uQ2DNIJNVj7mIuv/mX9U2rw=;
 b=l20RRqa5E5wCJ2yBSVJ6dnQrvXktFo4NrqneHA23dFFzj/XRKpHvDgDWvTHVLUpQ37
 P0PasuAtchb5sBHSfPlrdKAmIW8a2YtBQx8T0y2KyFmGFaDyGfrM/qYstNXanK68IpBM
 d33XCVsrwvQ3d44hjhPGvrLqMtMUELdJN/oO6JjW2njCRW5mBjt1xx5QfiJxY1KPcoBw
 PKoB4NXy7oZ0REJdKR3w02VP9zztORga8y+nkeSfKeW3BbYWbe1HV1FQZ3y1wYwHdWPP
 ZeCFAst5jlfHg4BSAmp4jfokiTXc6XY0e3EeMbn+LNyCYbEW16jdw8DLz8Sz6SkeQonq
 BQ/A==
X-Gm-Message-State: APjAAAVurgrWygo1xuf9ilnbMahJEqSan3tmA2nHvtrjaHjrHwFJbQEc
 LErp5BDio1c2eNj4++oxs5iDuqXU8igYR3ekD0Q=
X-Google-Smtp-Source: APXvYqyJIO6p9W3sIvKgsnI9yM8+QC0mVX+Kx5GTkRRst1rZ6CJocMjvHEfBFMhU3gZEpc++9iMJgmfzVWEplNZ1+6s=
X-Received: by 2002:a92:9a90:: with SMTP id c16mr1971623ill.3.1579247617119;
 Thu, 16 Jan 2020 23:53:37 -0800 (PST)
MIME-Version: 1.0
References: <20200117025717.58636-1-yuehaibing@huawei.com>
In-Reply-To: <20200117025717.58636-1-yuehaibing@huawei.com>
Date: Fri, 17 Jan 2020 01:53:26 -0600
Message-ID: <CAH2r5ms=s_c5YOPfXdTE-ee6LX_Quq9_Oao4p_k0b59fDNemWQ@mail.gmail.com>
Subject: Re: [PATCH -next] cifs: remove set but not used variable 'server'
To: YueHaibing <yuehaibing@huawei.com>
Content-Type: text/plain; charset="UTF-8"
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
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <sfrench@samba.org>, Pavel Shilovskiy <pshilov@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Thu, Jan 16, 2020 at 10:01 PM YueHaibing <yuehaibing@huawei.com> wrote:
>
> fs/cifs/smb2pdu.c: In function 'SMB2_query_directory':
> fs/cifs/smb2pdu.c:4444:26: warning:
>  variable 'server' set but not used [-Wunused-but-set-variable]
>   struct TCP_Server_Info *server;
>
> It is not used, so remove it.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  fs/cifs/smb2pdu.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
> index a23ca3d..64d5a36 100644
> --- a/fs/cifs/smb2pdu.c
> +++ b/fs/cifs/smb2pdu.c
> @@ -4441,13 +4441,10 @@ SMB2_query_directory(const unsigned int xid, struct cifs_tcon *tcon,
>         int resp_buftype = CIFS_NO_BUFFER;
>         struct kvec rsp_iov;
>         int rc = 0;
> -       struct TCP_Server_Info *server;
>         struct cifs_ses *ses = tcon->ses;
>         int flags = 0;
>
> -       if (ses && (ses->server))
> -               server = ses->server;
> -       else
> +       if (!ses || !(ses->server))
>                 return -EIO;
>
>         if (smb3_encryption_required(tcon))
> --
> 2.7.4
>
>


-- 
Thanks,

Steve

