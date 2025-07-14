Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 18953B04265
	for <lists+samba-technical@lfdr.de>; Mon, 14 Jul 2025 17:01:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=pjiEEUruxM1obtp6rmwv5BWjVLdnDI6Hb04lv1jWk4o=; b=0L/ieYPXjjcUzxzUeIxJ0JqpsP
	vRPTnrFl+AV4BiDlAMI9v4Elk21dgflOoNrZMkdOcvty+Ft39M7IqrgiqUNTMawvKxMQ/fUEM7XQt
	VuulGvgrQwjMTOUzap4dWIz6S3rSmAhtquDIuclz8IFmJcSmo4m6CDvXQR4sMkJnpzp0SQzbxqKIS
	WMjyfraC1RieTnAyr8+OYV23HdHScH2fEs7CQwq3hpdnfxR5gsQDBOw8Rq79a+MU0N97CcC0lOZha
	Emz+1Lls5NXkUn3Wnps8VXpoSOrCZf7s4rcK1odZo6n152yyC9q+wwnzJKWCLQVMJWy31WWTr9gCv
	A/Yzv9Pg==;
Received: from ip6-localhost ([::1]:24138 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ubKfQ-00BDEB-2u; Mon, 14 Jul 2025 15:00:32 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:59577) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ubKfL-00BDE4-0X
 for samba-technical@lists.samba.org; Mon, 14 Jul 2025 15:00:29 +0000
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-7d95b08634fso278726385a.2
 for <samba-technical@lists.samba.org>; Mon, 14 Jul 2025 08:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752505225; x=1753110025; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=J/8ZX3R2Lx1cVkfMJDCn648ZVKlTEYvDHUqkaB6Jd9M=;
 b=DhunHU/kTT4OYQwJdjlDbEjjFjPDVpkMmwolHdv88MzJcyLIEGfhwGgeh4F1bmbiMB
 c4i+dqzIa05IYLsaasctxsNDauIsv43Ppw51K6K91I8sETYdD+sdBc9rJ6zzKbGiD+1d
 UZsdoatMr+ZLfMMrd8yBZkcQ2PV9eD4ZZSKvQ2L0AC/0fpGWQ+eYgQj0nP2DqgRc96oW
 QBm5DMQeHBK+DtHAbWUiGUR8EL6+Jq9yLqmuZs3Fo0KdLp6R5J9Dizp5PxZgxRgGGRIW
 h7eRoUHLHLnjcz70mtBARN5nCUy2osc2bhKwwtG7uIugQXws4Xv41fE+bEQTERSAH6w+
 Pyqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752505225; x=1753110025;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J/8ZX3R2Lx1cVkfMJDCn648ZVKlTEYvDHUqkaB6Jd9M=;
 b=G8f8LppPaJ/BIK2SA1MOJPZLcjON0S0Q0Wu/aleLgwB0CsChT+7JhRZHdrSf161d9J
 oYYcUG6RvK6Iu5RpSv7VsCTPOnl/K0a+1fBX/I43ym5P4M5K689pV8osu/A5orXPAggh
 phKheV+MJI5V9MpUjqmYMMYJwgjF4cBSZHFkpG5kZ5QXY+m3Q0qmk18Tqdz9eN6lTNfh
 N63Sfyg88ivQ/oFQUYHwi13p7XliebDp2diH8eBrYmHnO5J0PFotbP8cWXjRZW1kEFn3
 6uBtBqckk0vE1oeWLxJ1/CmPVZjxtVybdJr5xf2qAj+/1SFbb8cAKTvk8PB7MtsQMkeO
 PyIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSeXEWCvNz4Y3V2cldX0Kh+n2hdPagG+Mj0QHvaiKoL1Cj9WxxRrI821l1JmxRum4gTIufUhdJWm9xcFraWBk=@lists.samba.org
X-Gm-Message-State: AOJu0YxkFyWj3XVrGVR1IcOMYBTTExHdkrdJBGYHurgBEAXhVKYbN+Ib
 p7/A+1WP7l3DTrSXgQxSXXoER/mUeSCjmydhBdjjSPCggefYHqswVRHK3BIupnP9VLeXGAREYom
 p6M5TSFY3YgrOWScOry0wD77e6FuM+OU=
X-Gm-Gg: ASbGncusFr/scXTrmuoWlEQIWqx8jKH4fi5k6r2ED6BP4yhNhqCxUu+G6UBbT/NQU88
 RUM3zhuZ0WyDHi4Az5tcrVCg13ThuS8WkmNbs1eLY6xCxuTUfOlZGnFlBYodNMTkwaz7DjnF7XE
 vUCNKPNu8fHzqAxqmm/Hkf+k4kjOpJWDenDPbn5INWbPakEWduXTjNZmgleu4VyKQbpKXV6yPSi
 dfP0ItssFip46Mo2rahgOmJ2uneLmfq3Fkbg08WAQ==
X-Google-Smtp-Source: AGHT+IFUDtfl7ds4MRAMBqzxqJ1h8LZEErdQmbEgycKsUgcM1Dl6fJAU0N5aOhPUA+yGubsP8gdBehWeBKRGtFIVCUg=
X-Received: by 2002:a05:6214:20ab:b0:6fb:1c3:f527 with SMTP id
 6a1803df08f44-704a431d283mr193741956d6.39.1752505221618; Mon, 14 Jul 2025
 08:00:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5muQGDkaHL78JOcgsfjL_=A64Xm9CrCBSKgOMABOjcg44w@mail.gmail.com>
 <CAH2r5msdLbvGMARXJ=V9wt0pvXJOrc=zh3eUfeF9AXEeshtByg@mail.gmail.com>
 <aHRo9VfMDIfK5MR6@jeremy-HP-Z840-Workstation>
 <42e549c1-0f92-4b95-b62b-3e0efab9aa10@samba.org>
 <5519b2d9-600c-4a3f-b44f-594877417df7@samba.org>
In-Reply-To: <5519b2d9-600c-4a3f-b44f-594877417df7@samba.org>
Date: Mon, 14 Jul 2025 10:00:08 -0500
X-Gm-Features: Ac12FXy_3DPiVNXVmetg9_U2BV0jUMSTd57dmzbVJ9vRyT53SHJfFNs7TGo-Hmg
Message-ID: <CAH2r5muuSicS+K3r01EnNQi693FiMOXmx+gP7VEAODAn9yF5Vw@mail.gmail.com>
Subject: Re: Samba support for creating special files (via reparse points)
To: Ralph Boehme <slow@samba.org>
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Paulo Alcantara <pc@manguebit.org>,
 samba-technical <samba-technical@lists.samba.org>,
 "vl@samba.org" <vl@samba.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Jul 14, 2025, 3:23=E2=80=AFAM Ralph Boehme <slow@samba.org> wrote:

> On 7/14/25 8:01 AM, Ralph Boehme via samba-technical wrote:
> > On 7/14/25 4:18 AM, Jeremy Allison wrote:
> >> It's an oversight I'm afraid.
> >
> > hm... it seems reparse points support is mandatory for SMB3 POSIX so I
> > wonder what this additional checks buys us.
> >
> > While I agree that generally we should likely set this, for SMB3 POSIX
> > the client should probably not check this and we should keep it out of
> > the spec.
>
> one additional thought: it seems like a valid scenario to be able to
> support SMB3 POSIX on a server that does not support xattrs on the
> backing filesystem and hence may not have a way of storing arbitrary
> reparse points.
>
> In SMB3 POSIX we're just using them as a wire transport, not necessarily
> expecting full support from the server.
>
> Hence, for Samba I see the following change
>
>      smbd: announce support for FILE_SUPPORTS_REPARSE_POINTS if the
> share supports EAs
> ---
>   source3/smbd/vfs.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/source3/smbd/vfs.c b/source3/smbd/vfs.c
> index 76895f52e039..ea3fa4c8784f 100644
> --- a/source3/smbd/vfs.c
> +++ b/source3/smbd/vfs.c
> @@ -1345,6 +1345,9 @@ uint32_t vfs_get_fs_capabilities(struct
> connection_struct *conn,
>          if (lp_nt_acl_support(SNUM(conn))) {
>                  caps |=3D FILE_PERSISTENT_ACLS;
>          }
> +       if (lp_ea_support(SNUM(conn))) {
> +               caps |=3D FILE_SUPPORTS_REPARSE_POINTS;
> +       }
>
>          caps |=3D lp_parm_int(SNUM(conn), "share", "fake_fscaps", 0);
>
> https://gitlab.com/samba-team/samba/-/merge_requests/4104
>
> For the client this would mean, it must allow reparse points for the
> special files if SMB3 POSIX is negotiated.
>
> Makes sense?
>
> -slow
>

Yes

>
