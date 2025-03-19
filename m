Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8E4A69959
	for <lists+samba-technical@lfdr.de>; Wed, 19 Mar 2025 20:31:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=CjPdZUk4Nt9PEx4A+1SO/010u3e1pVDr5a3dUVLO0X0=; b=Olp336q1aiPiS5iJKITMdrCLU/
	5lF3Ug9C1EzxiyKixlG4g3kaafjJ8PaqYLJHZeDjEKCyasO5PNv+YoSjREgnUbq96NvNWh3Szh2nD
	Q8peZoUSvOUfRxrYzTldU3GD2U49HfyNmOQnb358Jcniia1ZmKoH+0xhJ6MxT0auPQ55Q9yPuiVvz
	RKvJcy/9xpoJBsuP/Bq+2PgRVcfMI7cY6inbF6Fyt/SM1NwWPLBo2JjJjlBCjxmRrTQEMvTKc7mu3
	PXf37Pp4ua6eVNt5aRi2RaAIBllRrLu7CvKu5YMlC6x6yioV5I1MFnmrIMoZ6dRvJKYAxEvG0ELnK
	4kjZPQLQ==;
Received: from ip6-localhost ([::1]:45094 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tuz7h-00GY9N-Ub; Wed, 19 Mar 2025 19:30:41 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:60775) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tuz7c-00GY9G-DJ
 for samba-technical@lists.samba.org; Wed, 19 Mar 2025 19:30:38 +0000
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5497590ffbbso62012e87.1
 for <samba-technical@lists.samba.org>; Wed, 19 Mar 2025 12:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742412623; x=1743017423; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CjPdZUk4Nt9PEx4A+1SO/010u3e1pVDr5a3dUVLO0X0=;
 b=ZTtMkfzqdjr8MfLR28y03flScp/+7BoqjC+tcL7NMsaLBn1FyMOBqX61b4nOQXLGgA
 gjfAudgKOSUGvT+eVz2gQiOQareYZE1Q3PBzZUMdVbLMLThk3dmc39/Wz+VLVGYMxAsy
 QtJC9rK7CHyM4gIHtrQqP4h54PCXgVtkF/klIO1hIOGrIoq2t2jfWVVR/Mf3W3DOVIpN
 yOa0WTUzaITbuMPjeRvTi2UahykshC+YNgDkGdP6N24nMH742sWYSVk5PYsAVSK9QzKj
 87c6qCzunqQPo+Po9Pg4jCuLk8Zvrj+g/oIIT8bpLanWGHqjlhPLSreIKuoTARnlyy1r
 hboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742412623; x=1743017423;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CjPdZUk4Nt9PEx4A+1SO/010u3e1pVDr5a3dUVLO0X0=;
 b=fagQrCVq2hFajCzwrL9ZvJSjUcdkJsz5Sc33XbxktmVNGx44ZOvnGCoja+N6AtiMLz
 9oZBH2Pzrjvu/3CZNmap+orbE9JDumQcIOSeQMGOt7Uzx7LM/LmxBk6R/4VntyUKRJQq
 B+mEwpWAMi7kZKcnxmBrQwUXk7AW8O4dVd9vFYESCfOcG/KzIuwHYFvJiJ9MNTZkXf8B
 yxEw7s2dh+jO+ar7//FJawAapV53ZM8r2sEu/jAEOMEmqjEyCnFjuq7obhzPvuqMe0b3
 QTnze7e4r+f6T3xZofIKsvqdgGHolcMS9G2hWUBEV5Xx6UIWydUxekzZHF3G7++vhi2N
 0mRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt3YnzyGufSS8lYtUES0y9ZfeIIeV8d3MsvagFFrXrZnPoIbCManZRwR6U7cnQ1imukLw8FjCa1QWBrMAWGNw=@lists.samba.org
X-Gm-Message-State: AOJu0YyAfJR7KMVYyO9bdIsZ8UWm2N+DiFXrhgFFSXbJ7MB7qJH4ZNk1
 eIMx2yaNntsYX/UjYfSbKAli9kXeUa/qLhueG8e9bZca7bIuiUU9jHhy+5HyPoG02+Jrh9xLidz
 iQ8OjAXmIkPt0Pv5RsyoAk9WJTVU=
X-Gm-Gg: ASbGncvFWnjmr3SoXzhmdB/Go9VCMR5CR+NubNSe5pQOPbC6YIp4M3g2a6DSCO6dQAw
 x/hRDlhCv9N0CZeZOBCBY8Z8h+b4sHCVF1lg4oIqOVYNXqjJDbBWg+bPg4MjGMYVqjv0IK0yfrz
 WKJNf+yuFvjL+eq/xU3F4+rHd/j72caI0VZf3kAHByZDn2hmII6awBLTeuCLGF75VvIFAqHRQ=
X-Google-Smtp-Source: AGHT+IGNmednv6g3WBsP6ygVOMceOxWwcUpi3FGO7Rvzn3j0b+dP4eq642X+94uECeHnq1fFOmasbAUrs3O4JAvrnUo=
X-Received: by 2002:a05:6512:234c:b0:549:7145:5d25 with SMTP id
 2adb3069b0e04-54ad067861fmr84418e87.34.1742412622784; Wed, 19 Mar 2025
 12:30:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250319123110.21814-1-adiupina@astralinux.ru>
 <ci4fhara55ka4mh65zn7x5vp3zjcqcytghupjzz2izudvjjejn@6qggfqf2qsxc>
 <6249e342-f379-4257-8a19-52b888e02c09@astralinux.ru>
In-Reply-To: <6249e342-f379-4257-8a19-52b888e02c09@astralinux.ru>
Date: Wed, 19 Mar 2025 14:30:10 -0500
X-Gm-Features: AQ5f1JoRrz5Nk1_H_FVmMQADeFbuF158bvWZ_f9-0tI7AoJZYN1WrJOk2nP-bvU
Message-ID: <CAH2r5muCakSQSh_Epm5eFDPnFu=_Ayc-wwd7a7t+FrKxziz5DA@mail.gmail.com>
Subject: Re: [lvc-project] [PATCH] cifs: avoid NULL pointer dereference in dbg
 call
To: Alexandra Diupina <adiupina@astralinux.ru>
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
Cc: Paulo Alcantara <pc@manguebit.com>, linux-cifs@vger.kernel.org,
 Shyam Prasad N <sprasad@microsoft.com>, lvc-project@linuxtesting.org,
 linux-kernel@vger.kernel.org, samba-technical@lists.samba.org,
 Fedor Pchelkin <pchelkin@ispras.ru>, Aurelien Aptel <aaptel@suse.com>,
 Steve French <sfrench@samba.org>, Bharath SM <bharathsm@microsoft.com>,
 Tom Talpey <tom@talpey.com>, Pavel Shilovsky <pshilov@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I don't mind if you also send patches as attachments (or with pointer
to git or github commit link), especially if your email is corrupting
whitespace

On Wed, Mar 19, 2025 at 9:33=E2=80=AFAM Alexandra Diupina
<adiupina@astralinux.ru> wrote:
>
>
>
>
> 19/03/25 16:20, Fedor Pchelkin =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Wed, 19. Mar 15:31, Alexandra Diupina wrote:
> >> diff --git a/fs/smb/client/smb2misc.c b/fs/smb/client/smb2misc.c
> >> index f3c4b70b77b9..c02aab58aade 100644
> >> --- a/fs/smb/client/smb2misc.c
> >> +++ b/fs/smb/client/smb2misc.c
> >> @@ -816,11 +816,12 @@ smb2_handle_cancelled_close(struct cifs_tcon *tc=
on, __u64 persistent_fid,
> >>              WARN_ONCE(tcon->tc_count < 0, "tcon refcount is negative"=
);
> >>              spin_unlock(&cifs_tcp_ses_lock);
> >>
> >> -            if (tcon->ses)
> >> +            if (tcon->ses) {
> >>                      server =3D tcon->ses->server;
> >> -
> >> -            cifs_server_dbg(FYI, "tid=3D0x%x: tcon is closing, skippi=
ng async close retry of fid %llu %llu\n",
> >> -                            tcon->tid, persistent_fid, volatile_fid);
> >> +                    cifs_server_dbg(FYI,
> >> +                                                    "tid=3D0x%x: tcon=
 is closing, skipping async close retry of fid %llu %llu\n",
> >> +                                                    tcon->tid, persis=
tent_fid, volatile_fid);
> >> +            }
> > Something is wrong with the indentation. Usually scripts/checkpatch.pl
> > can give some feedback on this, too.
> >
> > CHECK: Alignment should match open parenthesis
> > #32: FILE: fs/smb/client/smb2misc.c:822:
> > +                     cifs_server_dbg(FYI,
> > +                                                     "tid=3D0x%x: tcon=
 is closing, skipping async close retry of fid %llu %llu\n",
>
> In the *.patch file, everything was fine with indents,
> so the checkpatch.pl script completed without errors.
> But when sending, the indents got corrupted for some
> reason. I'll send the second version
> >
> >>
> >>              return 0;
> >>      }
> >> --
> >> 2.30.2
>
>


--=20
Thanks,

Steve

