Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EA782B38AA0
	for <lists+samba-technical@lfdr.de>; Wed, 27 Aug 2025 22:04:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=PbMg2iZBF50w9bvltl4tIdLeh/aZoJYuThqFn7NRr7U=; b=47tPC+Tfcx4/niDBmn9pg2f7c3
	TgCTdF5d2yqLSQXHDWRJ2YUvIW4VH38ioLZDEXZWmMZh+EJY6tMR647P2K3hPCe/wlKtJ3TYLFukv
	6olLRZ8bGf2Ol3oHyp730T58odM86L5buClTH2X2Yw6ofyy6F3KWTxNHdePF/ccTN3XTUQ1fOwWQW
	/zl+DlVoeihactKbqCjh2Y6FjVNwj4VW70Mq2LZSt66z+LKZBrwZONPGUeeJQb57aTSgNZLCKyGoI
	K1zSk3OVsy7NfeYMmfsOEThIWUSlm486PW/VgWR/ttra2VmDSCgpEwWisoyDIiF9XYwOxcTU7tNpR
	aecXBdQA==;
Received: from ip6-localhost ([::1]:40980 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1urMMv-000eLq-Ab; Wed, 27 Aug 2025 20:03:41 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:56564) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1urMMq-000eLj-Pr
 for samba-technical@lists.samba.org; Wed, 27 Aug 2025 20:03:39 +0000
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-4b109914034so3373301cf.0
 for <samba-technical@lists.samba.org>; Wed, 27 Aug 2025 13:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756325015; x=1756929815; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PbMg2iZBF50w9bvltl4tIdLeh/aZoJYuThqFn7NRr7U=;
 b=kpd11vAa70Pr/Jag1Pvyv9DPNPemCslPBCTL3rvawDI+HQx62mplXzS9ehT11wumY0
 a7glkHtyPIaLMiyzxVFxy+5nUvV48wxacnBwz7OsxAUa29Jq5fpbpkoBefOlTDd/EHWQ
 5oVkemsMUdsQMQTDH1wwDQmj2eqCs+L0QVKp96D1Xx6tvzXhJWxKvJT3NF7bfmhmOYmA
 QmrhJhtWjxEF/dFDthQK31NOdjJvjtncmU6MCQhlzUGy5ybDGc8+ash662Pz0Reb0JuE
 BOOfYsqDdewMhWLfrF4x8mNYLwBuiRPJyP5RIA4Pf47gz23mYn8Ltl09Amy8es1pK449
 y3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756325015; x=1756929815;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PbMg2iZBF50w9bvltl4tIdLeh/aZoJYuThqFn7NRr7U=;
 b=WWnrEmcfFRkKgup9f4g0G+9VL9mK51Yyztvy/Lyc3m1abPkDbKWqAHgrTaa3AELaPH
 PPckaph5WawgF3ZSCp2YWhz3uWtKdMkzf8WjQ2RUDFNrjo+C3bqRDwzNBcJE3tuI3a9X
 Q3uqCOy4XylXYmVFQvOf/sP326krzWpx1LF+1KcgB05G7lJgit8k1y/Q0RP28esg1bWv
 5q18kSxPOce3pnX7f/aJCWNF7305PLCFnH9nzqBxdUE01D6OQ+L1loU6UUikX4OGYtjc
 C801WwIDGmv8KHNgloIp9upuCY5bHnAqslGuScrKnhylebacM1d3fpW8vobk6MpK0ekJ
 Hs7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5+aYzna5f+cMIaL8lKsUA9T5z6Nw0cshtB445Rgxip4nncEAFPQDWZBZ41nmY/8itr9X6qC51bQ2tZzCbsDo=@lists.samba.org
X-Gm-Message-State: AOJu0YyCrHijKaWtdZc7KwlWYwgcIM9Jk5eKcNQg8Sw3XJWSnhAVVqEu
 7dV6kvESkh8JvxuVyUFhkfgesnTne8eo6Fm4M1cmvdBZ/DNvRdn0H9jUQn3vuQ3gkPXd/jaLP8Q
 12XFivCA/SRkRl1TkBeAzqpnzD17Xt40=
X-Gm-Gg: ASbGncuoOz5QD7uIBKaYB+vDJZPNxKcg0hxOAUt7/rBRCjA0wLtfvHZEbJ6Zukm9Sa+
 yZmRjusGr+kYY9lQoUlrlO4hrsbF/wUzEnUCNEvqy6QRbRXRJ8WkhrY/4RkM0aYgy4zOFjmBSB0
 xkUP2HtJxMYYcTNKqAogPoIsprnx3z4ZFxH4ShTVMfRGPzrrls5t7CPElHG+fpAlncA08yzxNIe
 iqdeFHcpm2JCHmSuKoBdWN00E44gFH1ExuuK1d7EfXjZLz+E+2HaKeDDDRAPtPVkVY7fC/WgxDs
 rHBSdZZFfN6GPbIc7F6S1g==
X-Google-Smtp-Source: AGHT+IGvR9Gopsnrfnv3RsqoGfwVXlA895U4Bna9kgMu39ZeDGlbhCSyjzjh40Dwdu8dELMXQbQY/g9N4Qw8chD4d1o=
X-Received: by 2002:a05:6214:1cc1:b0:70d:a94f:eb47 with SMTP id
 6a1803df08f44-70da94ff287mr163620996d6.11.1756325013863; Wed, 27 Aug 2025
 13:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <aK9NPzbY9M_9eKuv@homelab>
In-Reply-To: <aK9NPzbY9M_9eKuv@homelab>
Date: Wed, 27 Aug 2025 15:03:22 -0500
X-Gm-Features: Ac12FXzT5j85uvaUwuToH9BZp8ybhHwDmgslW2zYSlEpHJUVxteHmRT4WIfmndU
Message-ID: <CAH2r5mvKJyf9JtRRCRB6Y+9y9RDUpoJW9Cgar7Fs9dgO-zwhLg@mail.gmail.com>
Subject: Re: [PATCH] fs/smb: Fix inconsistent refcnt update
To: Shuhao Fu <sfual@cse.ust.hk>
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
Cc: Tom Talpey <tom@talpey.com>, Shyam Prasad N <sprasad@microsoft.com>,
 Paulo Alcantara <pc@manguebit.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Steve French <sfrench@samba.org>,
 Bharath SM <bharathsm@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git pending testing (and added Cc:stable and
Acked-by from Paulo)

Let me know if any objections etc

On Wed, Aug 27, 2025 at 1:33=E2=80=AFPM Shuhao Fu <sfual@cse.ust.hk> wrote:
>
> A possible inconsistent update of refcount was identified in `smb2_compou=
nd_op`.
> Such inconsistent update could lead to possible resource leaks.
>
> Why it is a possible bug:
> 1. In the comment section of the function, it clearly states that the
> reference to `cfile` should be dropped after calling this function.
> 2. Every control flow path would check and drop the reference to
> `cfile`, except the patched one.
> 3. Existing callers would not handle refcount update of `cfile` if
> -ENOMEM is returned.
>
> To fix the bug, an extra goto label "out" is added, to make sure that the
> cleanup logic would always be respected. As the problem is caused by the
> allocation failure of `vars`, the cleanup logic between label "finished"
> and "out" can be safely ignored. According to the definition of function
> `is_replayable_error`, the error code of "-ENOMEM" is not recoverable.
> Therefore, the replay logic also gets ignored.
>
> Signed-off-by: Shuhao Fu <sfual@cse.ust.hk>
> ---
>  fs/smb/client/smb2inode.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/fs/smb/client/smb2inode.c b/fs/smb/client/smb2inode.c
> index 2a0316c51..31c13fb5b 100644
> --- a/fs/smb/client/smb2inode.c
> +++ b/fs/smb/client/smb2inode.c
> @@ -207,8 +207,10 @@ static int smb2_compound_op(const unsigned int xid, =
struct cifs_tcon *tcon,
>         server =3D cifs_pick_channel(ses);
>
>         vars =3D kzalloc(sizeof(*vars), GFP_ATOMIC);
> -       if (vars =3D=3D NULL)
> -               return -ENOMEM;
> +       if (vars =3D=3D NULL) {
> +               rc =3D -ENOMEM;
> +               goto out;
> +       }
>         rqst =3D &vars->rqst[0];
>         rsp_iov =3D &vars->rsp_iov[0];
>
> @@ -864,6 +866,7 @@ static int smb2_compound_op(const unsigned int xid, s=
truct cifs_tcon *tcon,
>             smb2_should_replay(tcon, &retries, &cur_sleep))
>                 goto replay_again;
>
> +out:
>         if (cfile)
>                 cifsFileInfo_put(cfile);
>
> --
> 2.39.5
>
>


--=20
Thanks,

Steve

