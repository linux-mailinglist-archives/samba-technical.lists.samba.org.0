Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BA57E31FE5F
	for <lists+samba-technical@lfdr.de>; Fri, 19 Feb 2021 18:52:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=wVGcdmdbOcgxyfkYXVX6kG9kxkpHeXw/koQTNh3qOhc=; b=z0NkXG4ZRV6kLMCF+aO4q4im2r
	steJVjPTG2LCwkx1lBvx0hcB7MPjH+81qD1YcEudx1j/8Uqdb+BDKEPRjISzl20me6Fh/Fr2nVjlt
	TmfEKUtzO2sDZmdtlRJFYpCr3G9LoS3DnNA948x3noPKQX/239NvxeMdPDHPtjADI7sKpRCRCkZuM
	QlhsW4sZGXwA8J41DV53OGl2VegxwwLF5FWrXO/IDKBpgvX42VLau/pIALJXcDH1sv+BbH1/HXuDf
	Q6K8z2orG13967EeItKRG152WjyNS7sLzRaOtl9yKNjOk3CXvaBpsxQYdBs/zmjlSQ9PS/ED9/x6t
	cD94UwbQ==;
Received: from ip6-localhost ([::1]:44306 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lD9xC-000jWY-Lr; Fri, 19 Feb 2021 17:52:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26879) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lD9x7-000jWQ-BR
 for samba-technical@lists.samba.org; Fri, 19 Feb 2021 17:52:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613757145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wVGcdmdbOcgxyfkYXVX6kG9kxkpHeXw/koQTNh3qOhc=;
 b=Sb218YEbtUosWYHS77e5+GJER/b94oyMZavoqglWQcHBNx64nZbzKL7H7Z+1GLXC9qBcAw
 IiZiS2DaPC4F8nsjE6tHDXOjsknq3oARlea+M1ahPKf/2LTJeExGJaR1VKv8svaeOIhzIZ
 NKXmOA19xI1OzhzaX7PUYuceVpwKSV4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613757145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wVGcdmdbOcgxyfkYXVX6kG9kxkpHeXw/koQTNh3qOhc=;
 b=Sb218YEbtUosWYHS77e5+GJER/b94oyMZavoqglWQcHBNx64nZbzKL7H7Z+1GLXC9qBcAw
 IiZiS2DaPC4F8nsjE6tHDXOjsknq3oARlea+M1ahPKf/2LTJeExGJaR1VKv8svaeOIhzIZ
 NKXmOA19xI1OzhzaX7PUYuceVpwKSV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-yHEzfGuhNQGiRU9JC_6r2A-1; Fri, 19 Feb 2021 12:35:54 -0500
X-MC-Unique: yHEzfGuhNQGiRU9JC_6r2A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CF42107ACC7;
 Fri, 19 Feb 2021 17:35:53 +0000 (UTC)
Received: from ovpn-113-105.phx2.redhat.com (ovpn-113-105.phx2.redhat.com
 [10.3.113.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 228536085D;
 Fri, 19 Feb 2021 17:35:52 +0000 (UTC)
Message-ID: <facbd0542074a5b8ef2f6f3d5649010503d8d84d.camel@redhat.com>
Subject: Re: [gssproxy] cifs-utils, Linux cifs kernel client and gssproxy
To: Shyam Prasad N <nspmangalore@gmail.com>
Date: Fri, 19 Feb 2021 12:35:51 -0500
In-Reply-To: <CANT5p=p_G+jMMVMkYDL=fXZi_OO7eY2Foz8VkyQuT+1h5Xgifw@mail.gmail.com>
References: <2e241ceaece6485289b1cddb84ec77ca@atos.net>
 <04d24a21a7a462b3dc316959c3a3b1c8be8caac3.camel@redhat.com>
 <CAH2r5mt9r6nWop_ekbe1CsinztUiGhP2-bxWFkRqHXOP=MXcVQ@mail.gmail.com>
 <c49c0a18c228e6aa43dbb2cbab7e0a266d1c0371.camel@redhat.com>
 <CANT5p=p_G+jMMVMkYDL=fXZi_OO7eY2Foz8VkyQuT+1h5Xgifw@mail.gmail.com>
Organization: Red Hat, Inc.
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Steve French <smfrench@gmail.com>,
 The GSS-Proxy developers and users mailing list
 <gss-proxy@lists.fedorahosted.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2021-02-19 at 03:30 -0800, Shyam Prasad N wrote:
> Hi Simo,
> 
> > Finally the GSS-Proxy mechanism is namespace compatible, so you also
> > get the ability to define different auth daemons per different
> > containers, no need to invent new mechanisms for that or change yet
> > again protocols/userspace to obtain container capabilities.
> 
> Could you please point me to the documentation for doing this?

I do not know if the kernel documents this, but the way gssproxy works
is that when you start the daemon it pokes at the kernel to let it know
the socket is available. So then the kernel opens the socket in the
namespace the proxy is running into (detected from the poking
operation, which is a write in a proc file).

HTH,
Simo.

> 
> Regards,
> Shyam
> 
> On Thu, Dec 17, 2020 at 5:41 AM Simo Sorce <simo@redhat.com> wrote:
> > Hi Steve,
> > 
> > GSSAPI and krb5 as implemented in system krb5 libraries exists from
> > longer than Samba has implemented those capabilities, I do not think it
> > make sense to reason along those lines.
> > 
> > GSS-Proxy has been built with a protocol to talk from the kernel that
> > resolved a number of issues for knfsd (eg big packet sizes when a MS-
> > PAC is present).
> > 
> > And Samba uses internally exactly the same krb5 mechanism as it defers
> > to the kerberos libraries as well.
> > 
> > Additionally GSS-Proxy can be very easily extended to also do NTLMSSP
> > using the same interface as I have built the gssntlmssp long ago from
> > the MS spec, and is probably the most correct NTLMSSP implementation
> > you can find around.
> > 
> > Gssntlmssp also has a Winbind backend so you get automaticaly access to
> > whatever cached credentials Winbindd has for users as a bonus (although
> > the integration can be improved there), yet you *can* use it w/o
> > Winbindd just fine providing a credential file (smbpasswd format
> > compatible).
> > 
> > GSS-Proxy is already integrated in distributions because it is used by
> > knfsd, and can be as easily used by cifsd, and you *should* really use
> > it there, so we can have a single, consistent, maintained, mechanism
> > for server side GSS authentication, and not have to repeat and reinvent
> > kernel to userspace mechanisms.
> > 
> > And if you add it for cifsd you have yet another reason to do it for
> > cifs.ko as well.
> > 
> > Finally the GSS-Proxy mechanism is namespace compatible, so you also
> > get the ability to define different auth daemons per different
> > containers, no need to invent new mechanisms for that or change yet
> > again protocols/userspace to obtain container capabilities.
> > 
> > For the client we'll need to add some XDR parsing functions in kernel,
> > they were omitted from my original patches because there was no client
> > side kernel consumer back then, but it i an easy, mechanical change.
> > 
> > HTH,
> > Simo.
> > 
> > On Wed, 2020-12-16 at 16:43 -0600, Steve French wrote:
> > > generally I would feel more comfortable using something (library or
> > > utility) in Samba (if needed) for additional SPNEGO support if
> > > something is missing (in what the kernel drivers are doing to
> > > encapsulate Active Directory or Samba AD krb5 tickets in SPNEGO) as
> > > Samba is better maintained/tested etc. than most components.  Is there
> > > something in Samba that could be used here instead of having a
> > > dependency on another project - Samba has been doing Kerberos/SPNEGO
> > > longer than most ...?   There are probably others (jra, Metze etc.)
> > > that have would know more about gssproxy vs. Samba equivalents though
> > > and would defer to them ...
> > > 
> > > On Wed, Dec 16, 2020 at 8:33 AM Simo Sorce <simo@redhat.com> wrote:
> > > > Hi Michael,
> > > > as you say the best course of action would be for cifs.ko to move to
> > > > use the RPC interface we defined for knfsd (with any extensions that
> > > > may  be needed), and we had discussions in the past with cifs upstream
> > > > developers about it. But nothing really materialized.
> > > > 
> > > > If something is needed in the short term, I thjink the quickest course
> > > > of action is indeed to change the userspace helper to use gssapi
> > > > function calls, so that they can be intercepted like we do for rpc.gssd
> > > > (nfs client's userspace helper).
> > > > 
> > > > Unfortunately I do not have the cycles to work on that myself at this
> > > > time :-(
> > > > 
> > > > HTH,
> > > > Simo.
> > > > 
> > > > On Wed, 2020-12-16 at 10:01 +0000, Weiser, Michael wrote:
> > > > > Hello,
> > > > > 
> > > > > I have a use-case for authentication of Linux cifs client mounts without the user being present (e.g. from batch jobs) using gssproxy's impersonation feature with Kerberos Constrained Delegation similar to how it can be done for NFS[1].
> > > > > 
> > > > > My understanding is that currently neither the Linux cifs kernel client nor cifs-utils userland tools support acquiring credentials using gssproxy. The former uses a custom upcall interface to talk to cifs.spnego from cifs-utils. The latter then goes looking for Kerberos ticket caches using libkrb5 functions, not GSSAPI, which prevents gssproxy from interacting with it.[2]
> > > > > 
> > > > > From what I understand, the preferred method would be to switch the Linux kernel client upcall to the RPC protocol defined by gssproxy[3] (as has been done for the Linux kernel NFS server already replacing rpc.svcgssd[4]). The kernel could then, at least optionally, talk to gssproxy directly to try and obtain credentials.
> > > > > 
> > > > > Failing that, cifs-utils' cifs.spnego could be switched to GSSAPI so that gssproxy's interposer plugin could intercept GSSAPI calls and provide them with the required credentials (similar to the NFS client rpc.gssd[5]).
> > > > > 
> > > > > Assuming my understanding is correct so far:
> > > > > 
> > > > > Is anyone doing any work on this and could use some help (testing, coding)?
> > > > > What would be expected complexity and possible roadblocks when trying to make a start at implementing this?
> > > > > Or is the idea moot due to some constraint or recent development I'm not aware of?
> > > > > 
> > > > > I have found a recent discussion of the topic on linux-cifs[6] which provided no definite answer though.
> > > > > 
> > > > > As a crude attempt at an explicit userspace workaround I tried but failed to trick smbclient into initialising a ticket cache using gssproxy for cifs.spnego to find later on.
> > > > > Is this something that could be implemented without too much redundant effort (or should already work, perhaps using a different tool)?
> > > > > 
> > > > > [1] https://github.com/gssapi/gssproxy/blob/main/docs/NFS.md#user-impersonation-via-constrained-delegation
> > > > > [2] https://pagure.io/gssproxy/issue/56
> > > > > [3] https://github.com/gssapi/gssproxy/blob/main/docs/ProtocolDocumentation.md
> > > > > [4] https://github.com/gssapi/gssproxy/blob/main/docs/NFS.md#nfs-server
> > > > > [5] https://github.com/gssapi/gssproxy/blob/main/docs/NFS.md#nfs-client
> > > > > [6] https://www.spinics.net/lists/linux-cifs/msg20182.html
> > > > > --
> > > > > Thanks,
> > > > > Michael
> > > > > _______________________________________________
> > > > > gss-proxy mailing list -- gss-proxy@lists.fedorahosted.org
> > > > > To unsubscribe send an email to gss-proxy-leave@lists.fedorahosted.org
> > > > > Fedora Code of Conduct: https://docs.fedoraproject.org/en-US/project/code-of-conduct/
> > > > > List Guidelines: https://fedoraproject.org/wiki/Mailing_list_guidelines
> > > > > List Archives: https://lists.fedorahosted.org/archives/list/gss-proxy@lists.fedorahosted.org
> > > > 
> > > > --
> > > > Simo Sorce
> > > > RHEL Crypto Team
> > > > Red Hat, Inc
> > > > 
> > > > 
> > > > 
> > > > 
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





