Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3F02DC273
	for <lists+samba-technical@lfdr.de>; Wed, 16 Dec 2020 15:50:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=ELcYwcd5+8Wpv1Iv8HJcz0WHlykRwQrTtcj43dV5dsY=; b=CGSm7k9qbAIceb5cnzi4RMOzD0
	IHL0moIZxUQLRDlsZPzLeZ1qzewg5DX3ahAf0l71S0WUF10Owrp2kaykMvzGbnJ+IgrDWXp96Fb4q
	os7pgERKFOsRePLn3wiFGbZqsHyrAloiEGDqedk3d7L7Bf5DoDr6+6ayIbR5K9woHniiDXhXG7JC1
	GS+dfGKu/3kCPPxylbLGQL7vg/p1C2MXUGYu32M2rS+2je6d21JZ+7hNpTWypKuxzLiEPoK+ZSTmy
	3iGEImBaHf65lWD1sVqMs0t/Lg2fnP8GwCQOCKDNtAdkwzA7Geql5cXf5iS7x7P86SK++k+CofLZ6
	TXc4992g==;
Received: from ip6-localhost ([::1]:45792 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kpY77-001b0Z-PY; Wed, 16 Dec 2020 14:49:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55365) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kpY70-001b0S-QG
 for samba-technical@lists.samba.org; Wed, 16 Dec 2020 14:49:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608130141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ELcYwcd5+8Wpv1Iv8HJcz0WHlykRwQrTtcj43dV5dsY=;
 b=GnijZKopC7AvrJzxYMf2HoIqHLoky6vJ34LcPCMHjPj4u0J7q3Tbj+9aofLI0+RRBnclOE
 +VbLYbXhFSA+VC2AsvFBFoOM+R0553h+3at1tVZZtvTjmelCDdfXrtRX0k+a9xPXpebGao
 1mhTFBZ+K78NEv76Zw40qHLxlthsffA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608130142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ELcYwcd5+8Wpv1Iv8HJcz0WHlykRwQrTtcj43dV5dsY=;
 b=OjQM72vONJfyDClkf0fk1F5gGZQEOtWxxo+tb/3TnTAc9vjDIKUaS7M7Bk/tTXrzSy3/4v
 W5Oc1MEnz+EIPAblRl9Qy+WSKgkBsjxp6r1NB3sdlgq9gQDsXOMDY1EjUBIUXS8P0PEWMI
 i7DtoRHwmwbGaQ4kzcW1rht3t1Ni4z0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-HMNnCmJUNZ2rQSSOmuBLnA-1; Wed, 16 Dec 2020 09:31:43 -0500
X-MC-Unique: HMNnCmJUNZ2rQSSOmuBLnA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30A05107ACF9;
 Wed, 16 Dec 2020 14:31:42 +0000 (UTC)
Received: from ovpn-112-247.phx2.redhat.com (ovpn-112-247.phx2.redhat.com
 [10.3.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 999445D9C0;
 Wed, 16 Dec 2020 14:31:41 +0000 (UTC)
Message-ID: <04d24a21a7a462b3dc316959c3a3b1c8be8caac3.camel@redhat.com>
Subject: Re: [gssproxy] cifs-utils, Linux cifs kernel client and gssproxy
To: The GSS-Proxy developers and users mailing list
 <gss-proxy@lists.fedorahosted.org>, "linux-cifs@vger.kernel.org"
 <linux-cifs@vger.kernel.org>
Date: Wed, 16 Dec 2020 09:31:40 -0500
In-Reply-To: <2e241ceaece6485289b1cddb84ec77ca@atos.net>
References: <2e241ceaece6485289b1cddb84ec77ca@atos.net>
Organization: Red Hat, Inc.
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Michael,
as you say the best course of action would be for cifs.ko to move to
use the RPC interface we defined for knfsd (with any extensions that
may  be needed), and we had discussions in the past with cifs upstream
developers about it. But nothing really materialized.

If something is needed in the short term, I thjink the quickest course
of action is indeed to change the userspace helper to use gssapi
function calls, so that they can be intercepted like we do for rpc.gssd
(nfs client's userspace helper).

Unfortunately I do not have the cycles to work on that myself at this
time :-(

HTH,
Simo.

On Wed, 2020-12-16 at 10:01 +0000, Weiser, Michael wrote:
> Hello,
> 
> I have a use-case for authentication of Linux cifs client mounts without the user being present (e.g. from batch jobs) using gssproxy's impersonation feature with Kerberos Constrained Delegation similar to how it can be done for NFS[1].
> 
> My understanding is that currently neither the Linux cifs kernel client nor cifs-utils userland tools support acquiring credentials using gssproxy. The former uses a custom upcall interface to talk to cifs.spnego from cifs-utils. The latter then goes looking for Kerberos ticket caches using libkrb5 functions, not GSSAPI, which prevents gssproxy from interacting with it.[2]
> 
> From what I understand, the preferred method would be to switch the Linux kernel client upcall to the RPC protocol defined by gssproxy[3] (as has been done for the Linux kernel NFS server already replacing rpc.svcgssd[4]). The kernel could then, at least optionally, talk to gssproxy directly to try and obtain credentials.
> 
> Failing that, cifs-utils' cifs.spnego could be switched to GSSAPI so that gssproxy's interposer plugin could intercept GSSAPI calls and provide them with the required credentials (similar to the NFS client rpc.gssd[5]).
> 
> Assuming my understanding is correct so far:
> 
> Is anyone doing any work on this and could use some help (testing, coding)?
> What would be expected complexity and possible roadblocks when trying to make a start at implementing this?
> Or is the idea moot due to some constraint or recent development I'm not aware of?
> 
> I have found a recent discussion of the topic on linux-cifs[6] which provided no definite answer though.
> 
> As a crude attempt at an explicit userspace workaround I tried but failed to trick smbclient into initialising a ticket cache using gssproxy for cifs.spnego to find later on.
> Is this something that could be implemented without too much redundant effort (or should already work, perhaps using a different tool)?
> 
> [1] https://github.com/gssapi/gssproxy/blob/main/docs/NFS.md#user-impersonation-via-constrained-delegation
> [2] https://pagure.io/gssproxy/issue/56
> [3] https://github.com/gssapi/gssproxy/blob/main/docs/ProtocolDocumentation.md
> [4] https://github.com/gssapi/gssproxy/blob/main/docs/NFS.md#nfs-server
> [5] https://github.com/gssapi/gssproxy/blob/main/docs/NFS.md#nfs-client
> [6] https://www.spinics.net/lists/linux-cifs/msg20182.html
> -- 
> Thanks,
> Michael
> _______________________________________________
> gss-proxy mailing list -- gss-proxy@lists.fedorahosted.org
> To unsubscribe send an email to gss-proxy-leave@lists.fedorahosted.org
> Fedora Code of Conduct: https://docs.fedoraproject.org/en-US/project/code-of-conduct/
> List Guidelines: https://fedoraproject.org/wiki/Mailing_list_guidelines
> List Archives: https://lists.fedorahosted.org/archives/list/gss-proxy@lists.fedorahosted.org

-- 
Simo Sorce
RHEL Crypto Team
Red Hat, Inc





