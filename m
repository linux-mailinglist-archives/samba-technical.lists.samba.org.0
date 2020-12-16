Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA9C2DC92D
	for <lists+samba-technical@lfdr.de>; Wed, 16 Dec 2020 23:45:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=RraQxFubWkLaRPHcHp7s5FxOjPyXlZWojEueGaT6yF4=; b=coNOC4rJ/L28q0U/L+blwUqUwu
	RlR3ui7aH52GYLSPJEEp/0NMN6JYq6r7J6rQiGNcx+1qe3DkphpZhlKAcZmGKjHXq0etFBKJWCg7v
	fJvQDXEPDROALBO3Ek74nVrfQsEEgr36iWZwRYdmmQyRM0DiLKvZE7HsFj6TOOjsCjeCQZRI48ys7
	TFq4JC7aiQtokbIYB1vI2Wd/b3vOWH4D4KdW9PQZwcLlNdOz9URMpdzucnygInj4mN4Ij5vOtQ8IP
	G91xv6SnE6aAaCDK1m9DiusBQHTH0gZfY8bvnAAR8Xe14VE+LX6IbEO49jV0D4nloTS3R78xJHnlu
	VFDvpsYQ==;
Received: from ip6-localhost ([::1]:53450 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kpfWw-001jeF-JU; Wed, 16 Dec 2020 22:44:22 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:44892) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kpfWl-001je8-6P
 for samba-technical@lists.samba.org; Wed, 16 Dec 2020 22:44:18 +0000
Received: by mail-lf1-x134.google.com with SMTP id m25so52465886lfc.11
 for <samba-technical@lists.samba.org>; Wed, 16 Dec 2020 14:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RraQxFubWkLaRPHcHp7s5FxOjPyXlZWojEueGaT6yF4=;
 b=N1IsJG7dCLsFwFYwWeQH2K1yP5v+WHU38XUruZVceRELQhlz2p17vqa2Sc+UaJlI95
 2RyCFIAeAHVGi53NA1rYSFCT5pL1EbHYc13eammS/nfjyMy+mrbw3cM4bDIk/Z0WUamW
 X/opNFJ3edshVD0WPs2uJOYKFU05EtaxxNwu0YL/k2MJ7Qqi43gyuP/P+DLI6epvy3CM
 RnYrZHkMZi5+m2Gs9+Cm1I6zmrMYXpD9t40zEM/8VSUpX+biouf57krWIM19xoXA1E85
 qs5GoHwqUOXDnUH2RsRY5ezbyWLZMJ/nG2MjD+BhFayAqNQh2KhPnhVpVY7DJji3OkSK
 vu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RraQxFubWkLaRPHcHp7s5FxOjPyXlZWojEueGaT6yF4=;
 b=OTNkhWXeKgQH99Pj9doYFcByITm/SpKyES1GTV4xAy4DHvMfk+41PAFWlSsDRFjZs2
 haekC6MljNxI65uaVLi4vyJo6mDYTozW9olPLjCvQnvJpPMWJZFYrZXQt5YgBPzu3Of0
 u4S/WCSqGTUA8Gy9nLHQY48V8gdVjUjhDfBqF0j0MKW0uiyStpqJc229lT5NJOBQscj4
 Y3h+kaKe+cXNQ5TKLO868rW9yy6jQAcVM0IV4NWXGZ3BToF1SRmy9A5L4+SSeuJ5QQ/N
 VOLbMJMZvBB5DzYtbGhrrbEBeD5qtocrig2fZ3wK/fNPUeUqnKYgYY9iNFpj5DNF77YP
 PGuw==
X-Gm-Message-State: AOAM531m7FW1h8rtpDvfPnLCiTK9dTr5z2vnps1luuAlS9fDqZ+eQGm5
 r+Lae3LqHyY7QDLEmLJfJpg5jnP7PXS8tmSJvNo=
X-Google-Smtp-Source: ABdhPJyEnvKmClQ5NoxTj0vrx8rbNsdtQ3PSNJUp4fUU3Ct4hWYm2LmiepyO9tQPq7+q3D48Ei6VQ9CD4RJE7GuYkXs=
X-Received: by 2002:a2e:6a14:: with SMTP id f20mr2223949ljc.6.1608158637870;
 Wed, 16 Dec 2020 14:43:57 -0800 (PST)
MIME-Version: 1.0
References: <2e241ceaece6485289b1cddb84ec77ca@atos.net>
 <04d24a21a7a462b3dc316959c3a3b1c8be8caac3.camel@redhat.com>
In-Reply-To: <04d24a21a7a462b3dc316959c3a3b1c8be8caac3.camel@redhat.com>
Date: Wed, 16 Dec 2020 16:43:46 -0600
Message-ID: <CAH2r5mt9r6nWop_ekbe1CsinztUiGhP2-bxWFkRqHXOP=MXcVQ@mail.gmail.com>
Subject: Re: [gssproxy] cifs-utils, Linux cifs kernel client and gssproxy
To: Simo Sorce <simo@redhat.com>
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
Cc: "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 The GSS-Proxy developers and users mailing list
 <gss-proxy@lists.fedorahosted.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

generally I would feel more comfortable using something (library or
utility) in Samba (if needed) for additional SPNEGO support if
something is missing (in what the kernel drivers are doing to
encapsulate Active Directory or Samba AD krb5 tickets in SPNEGO) as
Samba is better maintained/tested etc. than most components.  Is there
something in Samba that could be used here instead of having a
dependency on another project - Samba has been doing Kerberos/SPNEGO
longer than most ...?   There are probably others (jra, Metze etc.)
that have would know more about gssproxy vs. Samba equivalents though
and would defer to them ...

On Wed, Dec 16, 2020 at 8:33 AM Simo Sorce <simo@redhat.com> wrote:
>
> Hi Michael,
> as you say the best course of action would be for cifs.ko to move to
> use the RPC interface we defined for knfsd (with any extensions that
> may  be needed), and we had discussions in the past with cifs upstream
> developers about it. But nothing really materialized.
>
> If something is needed in the short term, I thjink the quickest course
> of action is indeed to change the userspace helper to use gssapi
> function calls, so that they can be intercepted like we do for rpc.gssd
> (nfs client's userspace helper).
>
> Unfortunately I do not have the cycles to work on that myself at this
> time :-(
>
> HTH,
> Simo.
>
> On Wed, 2020-12-16 at 10:01 +0000, Weiser, Michael wrote:
> > Hello,
> >
> > I have a use-case for authentication of Linux cifs client mounts withou=
t the user being present (e.g. from batch jobs) using gssproxy's impersonat=
ion feature with Kerberos Constrained Delegation similar to how it can be d=
one for NFS[1].
> >
> > My understanding is that currently neither the Linux cifs kernel client=
 nor cifs-utils userland tools support acquiring credentials using gssproxy=
. The former uses a custom upcall interface to talk to cifs.spnego from cif=
s-utils. The latter then goes looking for Kerberos ticket caches using libk=
rb5 functions, not GSSAPI, which prevents gssproxy from interacting with it=
.[2]
> >
> > From what I understand, the preferred method would be to switch the Lin=
ux kernel client upcall to the RPC protocol defined by gssproxy[3] (as has =
been done for the Linux kernel NFS server already replacing rpc.svcgssd[4])=
. The kernel could then, at least optionally, talk to gssproxy directly to =
try and obtain credentials.
> >
> > Failing that, cifs-utils' cifs.spnego could be switched to GSSAPI so th=
at gssproxy's interposer plugin could intercept GSSAPI calls and provide th=
em with the required credentials (similar to the NFS client rpc.gssd[5]).
> >
> > Assuming my understanding is correct so far:
> >
> > Is anyone doing any work on this and could use some help (testing, codi=
ng)?
> > What would be expected complexity and possible roadblocks when trying t=
o make a start at implementing this?
> > Or is the idea moot due to some constraint or recent development I'm no=
t aware of?
> >
> > I have found a recent discussion of the topic on linux-cifs[6] which pr=
ovided no definite answer though.
> >
> > As a crude attempt at an explicit userspace workaround I tried but fail=
ed to trick smbclient into initialising a ticket cache using gssproxy for c=
ifs.spnego to find later on.
> > Is this something that could be implemented without too much redundant =
effort (or should already work, perhaps using a different tool)?
> >
> > [1] https://github.com/gssapi/gssproxy/blob/main/docs/NFS.md#user-imper=
sonation-via-constrained-delegation
> > [2] https://pagure.io/gssproxy/issue/56
> > [3] https://github.com/gssapi/gssproxy/blob/main/docs/ProtocolDocumenta=
tion.md
> > [4] https://github.com/gssapi/gssproxy/blob/main/docs/NFS.md#nfs-server
> > [5] https://github.com/gssapi/gssproxy/blob/main/docs/NFS.md#nfs-client
> > [6] https://www.spinics.net/lists/linux-cifs/msg20182.html
> > --
> > Thanks,
> > Michael
> > _______________________________________________
> > gss-proxy mailing list -- gss-proxy@lists.fedorahosted.org
> > To unsubscribe send an email to gss-proxy-leave@lists.fedorahosted.org
> > Fedora Code of Conduct: https://docs.fedoraproject.org/en-US/project/co=
de-of-conduct/
> > List Guidelines: https://fedoraproject.org/wiki/Mailing_list_guidelines
> > List Archives: https://lists.fedorahosted.org/archives/list/gss-proxy@l=
ists.fedorahosted.org
>
> --
> Simo Sorce
> RHEL Crypto Team
> Red Hat, Inc
>
>
>
>


--=20
Thanks,

Steve

