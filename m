Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0694B7E7892
	for <lists+samba-technical@lfdr.de>; Fri, 10 Nov 2023 05:20:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=OAmwXK+iDSWfdTObmutZF/SAgh4gxinIE7yeyirigQA=; b=2cXGhGBCFd1T5pvCegLChh+gIW
	SLGgoEuQb0Afl0u9M8rMuxsLUubTcjXDZ7v9qC6V7Y710UM8kBCiaeAwZhiiSwRRHrN5eqj0h6cN6
	hhTc5Bw22Zz0I+pshIbiHM3FuZPy2MYwg8Q/kXO4IRzubZn1kCSq2hOCjiQnYLPd96kznSqmEmvjs
	qL2gIgo5IQ8lsn5nozgyjF6AMXNZVpPS3RszqCAs29oda/uXlPagyk5izbM5Os6OLPE9JUZl+8KFO
	KJc3auyZgE8JrbQTfa8xbgrdsOr/IVRDflFBRBifjgGbjZW60oanI+HfBMl3D6C15f248ctwVNVH9
	6IY5K6rQ==;
Received: from ip6-localhost ([::1]:65304 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r1Izb-007ULM-8y; Fri, 10 Nov 2023 04:19:39 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:57467) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r1IzV-007ULD-DC
 for samba-technical@lists.samba.org; Fri, 10 Nov 2023 04:19:36 +0000
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c504a5e1deso21509951fa.2
 for <samba-technical@lists.samba.org>; Thu, 09 Nov 2023 20:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699589972; x=1700194772; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OAmwXK+iDSWfdTObmutZF/SAgh4gxinIE7yeyirigQA=;
 b=Hsu4yDRPdK1WlYNvNnXucqwHUVJjH3KN2WFQpzEmvt6P/bZLeMht7L5GtXWUuTAFXL
 YTCNwQKED+Eub0ay3hhK2VTUr6rOVPCit+VZ/P2x6+3YUpeek6v1kxPhw9Wh6M4iB1Om
 fn3RiC9tybKfCEHg054293kgeYNELdKXlRh293abapvM207rNKHUFGWDQc+5SR5Eqrcm
 YJ9LRAevyEx54lruSE6d2n499vuHFyGm+494ee5LTQjExqJkGfB19GTbzQ5Z44nzh0vn
 W8nUmL9giVqnrVbT+heH/N9CBTuQDS9im6TKeR9r/5ukoglREOpbYrRr17QUGjh8dA/r
 Ktxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699589972; x=1700194772;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OAmwXK+iDSWfdTObmutZF/SAgh4gxinIE7yeyirigQA=;
 b=VCBky79eikFIrTPP3OaVUvFm7HCzUj/T0NnuJedH9Pgg1XdcrU5idpk89Jwk6lHC2H
 ofFN4A8hFytwaykSd+O1Q5waNdxKqUk0Lo2n4YuqSDHJoH6fjYj/DXXRTclz23+wYeuH
 EjVdK9VQF41Z6lBu4ZwQO2pykeb3QkgxVg2wHlNOSJsR6jWoFi5RVkrtXjhdk8YXUkYz
 c0c0AE86/6iuc/UrCIZsDaHuMqpmSAPp3WRIdxDq8ZqboVKxSD0cvkLVbmAE5HsVm0rc
 9u61RDR8Q3Ig4NC54GY62EGFPPpR03pA3VJjGcYFGotFo6i/pZ3RPwmm2p88rFYnLYj9
 Vn+A==
X-Gm-Message-State: AOJu0YyXUnw6NeSxHVvQLCgr8AEffg//LrtM4EdTw46gjZAowTdxU1+b
 Y2EqmRPCRqIo2LbpfF7vkckrOiw+bLybUfSuF2s=
X-Google-Smtp-Source: AGHT+IFH8mCws/7YFJadNm2sRt8kKIC0xAsS4FDccNuYgmupaiuoQLs6kc2nWTizlJgFgLQFBAJdmxwrsaJnIC6e2Eo=
X-Received: by 2002:a2e:3315:0:b0:2c5:2182:48db with SMTP id
 d21-20020a2e3315000000b002c5218248dbmr5320463ljc.20.1699589971813; Thu, 09
 Nov 2023 20:19:31 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mt-t0QDZk4Zz+cSs8=s=VhUW09erUBAtm8f7xXG3rHJqw@mail.gmail.com>
 <CAH2r5mtWC4hX8v-CwDQC6qp4tWzdNaMSag9myYM4dGmC4zr9FA@mail.gmail.com>
In-Reply-To: <CAH2r5mtWC4hX8v-CwDQC6qp4tWzdNaMSag9myYM4dGmC4zr9FA@mail.gmail.com>
Date: Fri, 10 Nov 2023 09:49:20 +0530
Message-ID: <CANT5p=rLdEAsXCXtf88OTg=Zy7d9yqDJf2_Z-r9oFZ0aGaR8iw@mail.gmail.com>
Subject: Re: [PATCH][smb3 client] allow debugging session and tcon info to
 improve stats analysis and debugging
To: Steve French <smfrench@gmail.com>
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Nov 10, 2023 at 8:21=E2=80=AFAM Steve French <smfrench@gmail.com> w=
rote:
>
> Updated patch to remove dumping of flags (tcon->Flags was already
> supposed to be dumped via
> the other ioctl (CIFS_IOC_GET_MNT_INFO) but it had a minor bug - will
> send followon patch for that)
>
>
> On Thu, Nov 9, 2023 at 3:51=E2=80=AFPM Steve French <smfrench@gmail.com> =
wrote:
> >
> > [PATCH] smb3: allow debugging session and tcon info to improve stats
> >  analysis and debugging
> >
> > When multiple mounts are to the same share from the same client it was =
not
> > possible to determine which section of /proc/fs/cifs/Stats (and DebugDa=
ta)
> > correspond to that mount.  In some recent examples this turned out to  =
be
> > a significant problem when trying to analyze performance problems - sin=
ce
> > there are many cases where unless we know the tree id and session id we
> > can't figure out which stats (e.g. number of SMB3.1.1 requests by type,
> > the total time they take, which is slowest, how many fail etc.) apply t=
o
> > which mount.
> >
> > Add an ioctl to return tid, session id, tree connect count and tcon fla=
gs.
> >
> > --
> > Thanks,
> >
> > Steve
>
>
>
> --
> Thanks,
>
> Steve

IMO, tc_count is not necessary here. We should keep this ioctl very
specific to this use case.
Moreover, DebugData already prints tc_count.

--=20
Regards,
Shyam

