Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 50164BDFA8B
	for <lists+samba-technical@lfdr.de>; Wed, 15 Oct 2025 18:30:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=/8GDrJ1rQnlamUx9lojh4fPxJBAOk9fRwuDS8zKFOtw=; b=58DXsHK0P6t1U4mla8ofeDmKNo
	3C+XY6AEylx4UrZSLHZs6UJ4RHYrLs079SS05WBF4pvKTHHMfGAg0Ni3oSXudeb9muwC9+kEVkvir
	j8Ow+8Obw2M1Jv7cxe7zdKd68gHmmBTLEgxGiruPAXhN5NJHMmgo/yD8SUxAKiMftJPspp6uyToia
	JTOT1ezLxN5Fd0LSNvLDdGe2Em4lsOd/7sdh5xR/IiWAA5/q4uE5JaTdgMOuHcbspJ1X4Ka12HHhW
	N7xNBfrKBOmIidFxOiQOu0Kl4jJ9r8ci19WOss3RPMZS9gzq9YoP4I8jX6sNk2CPURT6VRN2nEqDX
	pQR/H3xw==;
Received: from ip6-localhost ([::1]:31746 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v94O7-007sBj-TB; Wed, 15 Oct 2025 16:30:07 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:59534) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v94O2-007sBZ-9L
 for samba-technical@lists.samba.org; Wed, 15 Oct 2025 16:30:05 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-7960d69f14bso54117446d6.2
 for <samba-technical@lists.samba.org>; Wed, 15 Oct 2025 09:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760545800; x=1761150600; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/8GDrJ1rQnlamUx9lojh4fPxJBAOk9fRwuDS8zKFOtw=;
 b=i+FedjsCrAp1R3CjYxCsmmeJvWelmmATcY23GG4wU1dfeVcSA9lsLEcPYz+hjlIL6t
 NdljqKn4ZxDTBFc38HYU2scLUHmMqO5ZoZtobwWLg0sIfqg/nKZ5xxytU4tiMoPFix/j
 vmmgYXavXibjPOAhN6bPU/nbaPaUPpu38CZVDvuqHird4odqT/5BfLfvQm4qXTieQFs8
 QtTYXJDrQZO3CBHmYaDH8Q3H6CGjRyJJEzC/LNYuoqD7c9O7BEUFSzTCc3b/WJavwN6D
 9qzDqmHRFqgkcGQiedvUKSayqC3URK/Fq5TtskC8aAtCNr4Ey1N4nTlP30+5lYynCemV
 DDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760545800; x=1761150600;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/8GDrJ1rQnlamUx9lojh4fPxJBAOk9fRwuDS8zKFOtw=;
 b=TpxX4HUBlrBTQnoxVrHRkG/XxA/hEanaW1R+jawka/gZHL9ihG3N4ojEEYDkbnapCt
 AACIrIGkrm2aiPJrKVEu14MwywDU9qY+tll0gbOEL4CuyMopaHfAznApYQmmfD2Ymf2r
 gxj2nswpZ2+VreO3osv/K3CorNhQe79RkLJb3WIe7zTGbELFOzLJcyNOU+eRvDgCNmsI
 kfkfW7kCeGIKehA5Rc5JSnhW/GDzzXHO2MOfRoyL4wSTaM5u9VhxvhlXuCJ4itN3z5rk
 X++siiaZO8mdmwnxDUR5pmCYNBrCyWQK+kxwiGOOHu5eg+lh1in3NQWKrbv4MrxCJ7wZ
 8aqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+EDUXPIke+8FP6e7SNFFtdK4mcR/vMSWvnHo2cx348xQ4OO1TejqUzYQsI7kGxIJR2hLN9fI5JtLs0SqcFxk=@lists.samba.org
X-Gm-Message-State: AOJu0YyA769lDahscXA9nt0ikZ4T9zb8gUBkqBPf1/gRAIYQmoeQj9M9
 7+S8U2ArW4F5eAJ4cuyXQnDb30YEBx3HntT4HAyVjLY7wduus/bnGZtIXxpJGhD5F8Ff6sGxR4m
 roSvtcPCrPtIpfdvgVI7cn6HUqW+M/8o=
X-Gm-Gg: ASbGncvzOyxodrQllTgoSC2hYttcaVsf6M6S2kNujBkjR4gGOMpvt5BMN5+30wSWTU2
 z/sUdveY1hyFfTNStO/n4UXyylwmfjSgwJKljh9NpXjhFZ6wi1qIJejYDWtt+GNpETsjnrt1bjM
 JHdbetLdtEJazu4SCnWBC/Z5FYJAbEO2mjTDxyDa0jhjpuZLqnnNTwvbkOJHZU+m2hGICjXaGQD
 zPn7TBUJwCm1nVsE14RDzCsdb2BDyQNvsVnLAexhN1JE1GAOuJ0QcjTFMQDHdbbPaDjLzqA4TlA
 5zAKzoNv3uZvVU8SZsZePP/t5xGEKqX42D26KhCuyhQgnJqqN9uVKkbfsL0Wt0UUp9qlQzORAjD
 Qcc2Spu4yLLUoyLtuW6i9Wye2i4YCuue58W4C3Q==
X-Google-Smtp-Source: AGHT+IGVISVKSMZGXKvoUfC3pFbB5+MNCgPpT6oFP0VzuN6FflZ2A58qUHZ/QKyXQmRk6Yh4FFnGDxift44mJ0jL8XA=
X-Received: by 2002:a05:6214:6215:b0:87b:cc00:5de7 with SMTP id
 6a1803df08f44-87bcc005e4fmr188945256d6.18.1760545800119; Wed, 15 Oct 2025
 09:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <aOzRF9JB9VkBKapw@osx.local>
 <6599bf31-1099-426d-a8e5-902c3d98e032@web.de>
 <aO/DLq/OtAjvkgcY@chcpu18>
In-Reply-To: <aO/DLq/OtAjvkgcY@chcpu18>
Date: Wed, 15 Oct 2025 11:29:46 -0500
X-Gm-Features: AS18NWCziKfp_DI39cJxX3YKcNnedwhMB2N5vzWIwfO4Ia5b8m3SwzD1D2OHnU0
Message-ID: <CAH2r5msK3SDhAM0_monUcNTrf5JCwydD+AJgARaiVziUUo0WmQ@mail.gmail.com>
Subject: Re: [PATCH] smb: Fix refcount leak for cifs_sb_tlink
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
Cc: linux-cifs@vger.kernel.org, Shyam Prasad N <sprasad@microsoft.com>,
 Paulo Alcantara <pc@manguebit.org>, kernel-janitors@vger.kernel.org,
 samba-technical@lists.samba.org, LKML <linux-kernel@vger.kernel.org>,
 Steve French <sfrench@samba.org>, Bharath SM <bharathsm@microsoft.com>,
 Markus Elfring <Markus.Elfring@web.de>, Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I don't think the title needs to be changed, it seems clear enough.
The other changes are minor (changing goto label) and also probably
not needed but ok if you have to update it for other reasons.

On Wed, Oct 15, 2025 at 10:52=E2=80=AFAM Shuhao Fu <sfual@cse.ust.hk> wrote=
:
>
> On Wed, Oct 15, 2025 at 04:52:23PM +0200, Markus Elfring wrote:
> > > This patch fixes =E2=80=A6
> >
> > * Will another imperative wording approach become more helpful for an i=
mproved
> >   change description?
> >   https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
it.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Ft=
ree%2FDocumentation%2Fprocess%2Fsubmitting-patches.rst%3Fh%3Dv6.17%23n94&da=
ta=3D05%7C02%7Csfual%40connect.ust.hk%7Caffcb410915f4b4bc8f308de0bfa853c%7C=
6c1d415239d044ca88d9b8d6ddca0708%7C1%7C0%7C638961367775911255%7CUnknown%7CT=
WFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFO=
IjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DbThHSbvjokcDU6hNpnYxt4%2B=
lVyzlyxHl1JopGmCLY%2FQ%3D&reserved=3D0
> >
> > * Would it be more helpful to use the label =E2=80=9Cput_tlink=E2=80=9D=
 instead of =E2=80=9Cout=E2=80=9D?
> >
> > * Can a subject like =E2=80=9Csmb: client: Complete reference counting =
in three functions=E2=80=9D
> >   be nicer?
> >
> >
> > Regards,
> > Markus
>
> Hi,
>
> Thanks for the suggestions. My apologies for the inapproriate wording.
> Here's my updates. Please do let me know if it still needs improvement.
> I will definitely address these issues in patch v2.
>
> 1. An improved patch description
>
> Fix three refcount inconsistency issues related to `cifs_sb_tlink`.
>
> Comments for `cifs_sb_tlink` state that `cifs_put_tlink()` needs to be
> called after successful calls to `cifs_sb_tlink`. Three callsites fail
> to update refcount accordingly, leading to possible resource leaks.
>
> Fixes: 8ceb98437946 ("CIFS: Move rename to ops struct")
> Fixes: 2f1afe25997f ("cifs: Use smb 2 - 3 and cifsacl mount options getac=
l functions")
> Fixes: 366ed846df60 ("cifs: Use smb 2 - 3 and cifsacl mount options setac=
l function")
> Signed-off-by: Shuhao Fu <sfual@cse.ust.hk>
>
> 2. New subject: [PATCH v2] smb: client: Complete reference counting in th=
ree functions
>
> 3. Labels are changed accordingly
>
> @@ -3212,8 +3212,7 @@ get_smb2_acl_by_path(struct cifs_sb_info *cifs_sb,
>         utf16_path =3D cifs_convert_path_to_utf16(path, cifs_sb);
>         if (!utf16_path) {
>                 rc =3D -ENOMEM;
> -               free_xid(xid);
> -               return ERR_PTR(rc);
> +               goto put_tlink;
>         }
>
>         oparms =3D (struct cifs_open_parms) {
> @@ -3245,6 +3244,7 @@ get_smb2_acl_by_path(struct cifs_sb_info *cifs_sb,
>                 SMB2_close(xid, tcon, fid.persistent_fid, fid.volatile_fi=
d);
>         }
>
> +put_tlink:
>         cifs_put_tlink(tlink);
>         free_xid(xid);
>
> @@ -3285,8 +3285,7 @@ set_smb2_acl(struct smb_ntsd *pnntsd, __u32 acllen,
>         utf16_path =3D cifs_convert_path_to_utf16(path, cifs_sb);
>         if (!utf16_path) {
>                 rc =3D -ENOMEM;
> -               free_xid(xid);
> -               return rc;
> +               goto put_tlink;
>         }
>
>         oparms =3D (struct cifs_open_parms) {
> @@ -3307,6 +3306,7 @@ set_smb2_acl(struct smb_ntsd *pnntsd, __u32 acllen,
>                 SMB2_close(xid, tcon, fid.persistent_fid, fid.volatile_fi=
d);
>         }
>
> +put_tlink:
>         cifs_put_tlink(tlink);
>         free_xid(xid);
>         return rc;
>
> Thanks,
> Shuhao



--=20
Thanks,

Steve

