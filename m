Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 177647494C3
	for <lists+samba-technical@lfdr.de>; Thu,  6 Jul 2023 06:51:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=0vbGlXTVpdSyaaqs54Fhnj9u7VRZ/72tK9WO7d+UDHA=; b=ef4VRPbrlGl/OXurU3cJgitdM8
	D9uum05sFjPz6etxZH1MZl5dYfoit8ZwW+jyu9Cs62lAQGikeZPX9Xzod2HinsGU9KO6KEGQaACQZ
	D+oHjfN3JBFNyN8Le/Sr8I7ip5gt0RnPLAm3A0PID/wldT+EpxmXyWQK1OLknVJzcgnGiQwUJpC/1
	MhnWqQu+mEMFK4KyWQ2/Af/YgGSAf20m5kWHXmWoBHU1r4v7XEGkhPY1/m/XLiSdMgfOKgDnZtqYE
	EygCTDoULNICa9WbFmTRr7UpZwaFqjSxPFWJZQT5jQPdAOTfPFSsNcNoOxuBe+T+bTD2Xwi0/Jgnz
	CV3KKwhA==;
Received: from ip6-localhost ([::1]:48294 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qHGwu-000OTU-2k; Thu, 06 Jul 2023 04:50:36 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:54448) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qHGwn-000OTL-Fz
 for samba-technical@lists.samba.org; Thu, 06 Jul 2023 04:50:32 +0000
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b6fdaf6eefso3116981fa.0
 for <samba-technical@lists.samba.org>; Wed, 05 Jul 2023 21:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688619026; x=1691211026;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n3zpkMEs8PCb+eHMr6T6/iYgykGzVZgDyCH9d81pQs0=;
 b=ANdytqxpMBQBPl5zOX4SMADBagoRA15Bc8eVG+MLbKVfGv5klPmZxr6ahqV+dLGVSJ
 58xMCObMxIA/tMliHP4WbDZJZmfa5umNmgNVPenQHzmpb6yBU/BQAiyAsurdSCSdIObh
 DVPcefir0hpWxZyjYXRWDeYHcPZ3OREk3AZicPOk3UbGXl4L6gGhLvxpSurJGC8PIeUt
 7kMoOG55V2vJtmgS9Mjk5r87NQw4x6RW0W7SFcJUsSn8CxVinzRWPCTDQyrZM/sXhn11
 pMihMblCDDZqZhwnchyS8dMre3RJI2908510U/SImI6j2xH5BSdnxOnlLWybnbKKZnMI
 z3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688619026; x=1691211026;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n3zpkMEs8PCb+eHMr6T6/iYgykGzVZgDyCH9d81pQs0=;
 b=fb2RtgyNAtxhRz2mxOSD9DRSJIR6NAKpSzgz2N1dj4Pdwtljd3dmKZFTgWAnBKOiMq
 n/2JsNrElvZD1DJy6wPS5VSbeKsUFexYGe6zvFYTfCbQSIsKR82kZXbLTW9adxUgK3D4
 wo/oX9u0yyM3hY3V4Lg9dxq6DwG+I+AP+5Y18AMK4ukngTNiv7K9hzHs0GyhrfJaSbEm
 SkkwA+wI6b6XwiwiO6KgLqxtx6gfspBDu0/7yR9nDFjPdqXXPCwdA/ZubhcH+gS5yw2C
 8UjMcc1rzSVr4JVJBy8OX+W7gpMcB+QZFjRLuNxX1JPb+2hkgH7fB1n1TUW1fGla4hbx
 UtMw==
X-Gm-Message-State: ABy/qLZofP0Kr0lbRctxEr+vYg9d032SqfD21eSsg/BhURI/CSqdFN6y
 xAkzU90tnPztZpi+5xxJ+B3Nuxq1r9CmSBC7wNI=
X-Google-Smtp-Source: APBJJlHfDWgKz031fNrbMOciRULGSykScwaC7fMGNeWmSkcTON1/U5Dc+q0K/pbEnK7bREMjMsuMeQv513XWjGAz418=
X-Received: by 2002:a2e:3507:0:b0:2b6:b611:64e9 with SMTP id
 z7-20020a2e3507000000b002b6b61164e9mr336324ljz.52.1688619026278; Wed, 05 Jul
 2023 21:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230705185755.579053-1-jlayton@kernel.org>
 <20230705190309.579783-1-jlayton@kernel.org>
 <20230705190309.579783-6-jlayton@kernel.org>
In-Reply-To: <20230705190309.579783-6-jlayton@kernel.org>
Date: Wed, 5 Jul 2023 23:50:15 -0500
Message-ID: <CAH2r5mv+Fc9PuNtb8qMTwpb8qrEO2Tta5+o=mxD-2AY0cU5Aeg@mail.gmail.com>
Subject: Re: [PATCH v2 06/92] cifs: update the ctime on a partial page write
To: Jeff Layton <jlayton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Cc: Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org,
 samba-technical@lists.samba.org, Shyam Prasad N <sprasad@microsoft.com>,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

this looks useful (although we have a few more serious problems where we
don't keep the cached mtime/ctime/size for files that have RW or RWH leases
so can update the mtime/ctime/size from the server version of it which can
be stale in cases where we are caching writes (with leases).

Which tree do you want this patch to go through?

On Wed, Jul 5, 2023 at 2:04=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wro=
te:

> POSIX says:
>
>     "Upon successful completion, where nbyte is greater than 0, write()
>      shall mark for update the last data modification and last file statu=
s
>      change timestamps of the file..."
>
> Add the missing ctime update.
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/smb/client/file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
> index 879bc8e6555c..0a5fe8d5314b 100644
> --- a/fs/smb/client/file.c
> +++ b/fs/smb/client/file.c
> @@ -2596,7 +2596,7 @@ static int cifs_partialpagewrite(struct page *page,
> unsigned from, unsigned to)
>                                            write_data, to - from, &offset=
);
>                 cifsFileInfo_put(open_file);
>                 /* Does mm or vfs already set times? */
> -               inode->i_atime =3D inode->i_mtime =3D current_time(inode)=
;
> +               inode->i_atime =3D inode->i_mtime =3D inode->i_ctime =3D
> current_time(inode);
>                 if ((bytes_written > 0) && (offset))
>                         rc =3D 0;
>                 else if (bytes_written < 0)
> --
> 2.41.0
>
>

--=20
Thanks,

Steve
