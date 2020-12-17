Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9772DD24B
	for <lists+samba-technical@lfdr.de>; Thu, 17 Dec 2020 14:41:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=8wlz3/0iQnzzkXl44dSRZEBGu1Ze6Jd85KeRi2ZTwsI=; b=sq8ROTlOV+zU5aTt8VGBGOlgAE
	p5Ex0XUDqgi9VRs9m4R+0Tz3uvwbPzxUKBUdRel9OcBse8MLA6Hhx0JPyKfZ/a6si68CtPSB2YTCI
	TFdPSYLEh5OIWlAWRPb4amUqtaz+KpD17Mu6LYzEva/QezbGB4lus0f1ZUvZxeCV5cy412DxDiMLq
	2dG2FTVLxqVwc4ddYjQOxp9kBQTajMJTQApXE2eak1kkX3yzFjt2v1afWv++xN/EsqORo39qdXKQr
	DaVpn5FYE8AiG1mIhAesxnxsiuCq9VrszBEzJPOLTKLLiuLjZv9UbMl937ql7TbgaNQToorLX03J6
	xM2+FoHg==;
Received: from ip6-localhost ([::1]:31380 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kptW7-001pu0-Q5; Thu, 17 Dec 2020 13:40:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58471) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kptVk-001pts-LW
 for samba-technical@lists.samba.org; Thu, 17 Dec 2020 13:40:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608212383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8wlz3/0iQnzzkXl44dSRZEBGu1Ze6Jd85KeRi2ZTwsI=;
 b=hetAc1IXieZ6xFcA459WC8Qt21duZRJsra7WkzA50uuEzbh84MsS59DUGYGNdoXgZV+GIn
 esOVpuv5R6tvj3qSlhO9Cmbbxi2pygKJKz+1LgaYZ/tVJukt0nzOAaGkxqLKFp8IZrE1NI
 1jAg6F58PfyZLow1pcwvHZcpRFoFxWc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608212383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8wlz3/0iQnzzkXl44dSRZEBGu1Ze6Jd85KeRi2ZTwsI=;
 b=hetAc1IXieZ6xFcA459WC8Qt21duZRJsra7WkzA50uuEzbh84MsS59DUGYGNdoXgZV+GIn
 esOVpuv5R6tvj3qSlhO9Cmbbxi2pygKJKz+1LgaYZ/tVJukt0nzOAaGkxqLKFp8IZrE1NI
 1jAg6F58PfyZLow1pcwvHZcpRFoFxWc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-bc2x_AJMNyuf3drEAx29Tg-1; Thu, 17 Dec 2020 08:39:39 -0500
X-MC-Unique: bc2x_AJMNyuf3drEAx29Tg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 735FD800D55;
 Thu, 17 Dec 2020 13:39:38 +0000 (UTC)
Received: from ovpn-112-247.phx2.redhat.com (ovpn-112-247.phx2.redhat.com
 [10.3.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB5DE60BE5;
 Thu, 17 Dec 2020 13:39:37 +0000 (UTC)
Message-ID: <c49c0a18c228e6aa43dbb2cbab7e0a266d1c0371.camel@redhat.com>
Subject: Re: [gssproxy] cifs-utils, Linux cifs kernel client and gssproxy
To: Steve French <smfrench@gmail.com>
Date: Thu, 17 Dec 2020 08:39:36 -0500
In-Reply-To: <CAH2r5mt9r6nWop_ekbe1CsinztUiGhP2-bxWFkRqHXOP=MXcVQ@mail.gmail.com>
References: <2e241ceaece6485289b1cddb84ec77ca@atos.net>
 <04d24a21a7a462b3dc316959c3a3b1c8be8caac3.camel@redhat.com>
 <CAH2r5mt9r6nWop_ekbe1CsinztUiGhP2-bxWFkRqHXOP=MXcVQ@mail.gmail.com>
Organization: Red Hat, Inc.
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
From: Simo Sorce via samba-technical <samba-technical@lists.samba.org>
Reply-To: Simo Sorce <simo@redhat.com>
Cc: "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 The GSS-Proxy developers and users mailing list
 <gss-proxy@lists.fedorahosted.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Steve,

GSSAPI and krb5 as implemented in system krb5 libraries exists from
longer than Samba has implemented those capabilities, I do not think it
make sense to reason along those lines.

GSS-Proxy has been built with a protocol to talk from the kernel that
resolved a number of issues for knfsd (eg big packet sizes when a MS-
PAC is present).

And Samba uses internally exactly the same krb5 mechanism as it defers
to the kerberos libraries as well.

Additionally GSS-Proxy can be very easily extended to also do NTLMSSP
using the same interface as I have built the gssntlmssp long ago from
the MS spec, and is probably the most correct NTLMSSP implementation
you can find around.

Gssntlmssp also has a Winbind backend so you get automaticaly access to
whatever cached credentials Winbindd has for users as a bonus (although
the integration can be improved there), yet you *can* use it w/o
Winbindd just fine providing a credential file (smbpasswd format
compatible).

GSS-Proxy is already integrated in distributions because it is used by
knfsd, and can be as easily used by cifsd, and you *should* really use
it there, so we can have a single, consistent, maintained, mechanism
for server side GSS authentication, and not have to repeat and reinvent
kernel to userspace mechanisms.

And if you add it for cifsd you have yet another reason to do it for
cifs.ko as well.

Finally the GSS-Proxy mechanism is namespace compatible, so you also
get the ability to define different auth daemons per different
containers, no need to invent new mechanisms for that or change yet
again protocols/userspace to obtain container capabilities.

For the client we'll need to add some XDR parsing functions in kernel,
they were omitted from my original patches because there was no client
side kernel consumer back then, but it i an easy, mechanical change.

HTH,
Simo.

On Wed, 2020-12-16 at 16:43 -0600, Steve French wrote:
> generally I would feel more comfortable using something (library or
> utility) in Samba (if needed) for additional SPNEGO support if
> something is missing (in what the kernel drivers are doing to
> encapsulate Active Directory or Samba AD krb5 tickets in SPNEGO) as
> Samba is better maintained/tested etc. than most components.  Is there
> something in Samba that could be used here instead of having a
> dependency on another project - Samba has been doing Kerberos/SPNEGO
> longer than most ...?   There are probably others (jra, Metze etc.)
> that have would know more about gssproxy vs. Samba equivalents though
> and would defer to them ...
> 
> On Wed, Dec 16, 2020 at 8:33 AM Simo Sorce <simo@redhat.com> wrote:
> > Hi Michael,
> > as you say the best course of action would be for cifs.ko to move to
> > use the RPC interface we defined for knfsd (with any extensions that
> > may  be needed), and we had discussions in the past with cifs upstream
> > developers about it. But nothing really materialized.
> > 
> > If something is needed in the short term, I thjink the quickest course
> > of action is indeed to change the userspace helper to use gssapi
> > function calls, so that they can be intercepted like we do for rpc.gssd
> > (nfs client's userspace helper).
> > 
> > Unfortunately I do not have the cycles to work on that myself at this
> > time :-(
> > 
> > HTH,
> > Simo.
> > 
> > On Wed, 2020-12-16 at 10:01 +0000, Weiser, Michael wrote:
> > > Hello,
> > > 
> > > I have a use-case for authentication of Linux cifs client mounts without the user being present (e.g. from batch jobs) using gssproxy's impersonation feature with Kerberos Constrained Delegation similar to how it can be done for NFS[1].
> > > 
> > > My understanding is that currently neither the Linux cifs kernel client nor cifs-utils userland tools support acquiring credentials using gssproxy. The former uses a custom upcall interface to talk to cifs.spnego from cifs-utils. The latter then goes looking for Kerberos ticket caches using libkrb5 functions, not GSSAPI, which prevents gssproxy from interacting with it.[2]
> > > 
> > > From what I understand, the preferred method would be to switch the Linux kernel client upcall to the RPC protocol defined by gssproxy[3] (as has been done for the Linux kernel NFS server already replacing rpc.svcgssd[4]). The kernel could then, at least optionally, talk to gssproxy directly to try and obtain credentials.
> > > 
> > > Failing that, cifs-utils' cifs.spnego could be switched to GSSAPI so that gssproxy's interposer plugin could intercept GSSAPI calls and provide them with the required credentials (similar to the NFS client rpc.gssd[5]).
> > > 
> > > Assuming my understanding is correct so far:
> > > 
> > > Is anyone doing any work on this and could use some help (testing, coding)?
> > > What would be expected complexity and possible roadblocks when trying to make a start at implementing this?
> > > Or is the idea moot due to some constraint or recent development I'm not aware of?
> > > 
> > > I have found a recent discussion of the topic on linux-cifs[6] which provided no definite answer though.
> > > 
> > > As a crude attempt at an explicit userspace workaround I tried but failed to trick smbclient into initialising a ticket cache using gssproxy for cifs.spnego to find later on.
> > > Is this something that could be implemented without too much redundant effort (or should already work, perhaps using a different tool)?
> > > 
> > > [1] https://github.com/gssapi/gssproxy/blob/main/docs/NFS.md#user-impersonation-via-constrained-delegation
> > > [2] https://pagure.io/gssproxy/issue/56
> > > [3] https://github.com/gssapi/gssproxy/blob/main/docs/ProtocolDocumentation.md
> > > [4] https://github.com/gssapi/gssproxy/blob/main/docs/NFS.md#nfs-server
> > > [5] https://github.com/gssapi/gssproxy/blob/main/docs/NFS.md#nfs-client
> > > [6] https://www.spinics.net/lists/linux-cifs/msg20182.html
> > > --
> > > Thanks,
> > > Michael
> > > _______________________________________________
> > > gss-proxy mailing list -- gss-proxy@lists.fedorahosted.org
> > > To unsubscribe send an email to gss-proxy-leave@lists.fedorahosted.org
> > > Fedora Code of Conduct: https://docs.fedoraproject.org/en-US/project/code-of-conduct/
> > > List Guidelines: https://fedoraproject.org/wiki/Mailing_list_guidelines
> > > List Archives: https://lists.fedorahosted.org/archives/list/gss-proxy@lists.fedorahosted.org
> > 
> > --
> > Simo Sorce
> > RHEL Crypto Team
> > Red Hat, Inc
> > 
> > 
> > 
> > 
> 
> 

-- 
Simo Sorce
RHEL Crypto Team
Red Hat, Inc





