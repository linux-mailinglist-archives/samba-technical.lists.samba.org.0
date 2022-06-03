Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F91E53CD8F
	for <lists+samba-technical@lfdr.de>; Fri,  3 Jun 2022 18:54:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=QNtH04VF3Pjkzc8dciANe321uBQ8VQDQarlDju17a0g=; b=HRcE8glDqyMZkJgkRutEETgp6g
	Y6zKbcrBNcDa7MhBZ8X1zV30QGajj7GO3B8xfb26JebQmN/aDeVNE0KiQWaXxyca7FOyNEMTPM7+f
	rMgwNhVepbB1HkiOt64wl0to+8s0ovVTdd1zUos6D6Ohd51UwCgfhFuMLSHswW2bTOvBapuJGmB4n
	vtFYTQLVcfK3KNMCHJmP6zfCX+kAItAVkkwSrGPbK0CB9GiCTsHJOdDbE3AfFFHJPtzpRvBb5nxUa
	5Ks5vj+OLtGaObCG8wXQwBumb7jNF1JiZgv0MyOOKjIIxFt95By9qY99nj779MjasJJwzV3tqJvFU
	VrYOcBRA==;
Received: from ip6-localhost ([::1]:29682 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nxAY4-0075GY-Ah; Fri, 03 Jun 2022 16:53:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62012) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nxAXz-0075GP-LC
 for samba-technical@lists.samba.org; Fri, 03 Jun 2022 16:53:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=QNtH04VF3Pjkzc8dciANe321uBQ8VQDQarlDju17a0g=; b=NeH4oz5T0MCcTnovgMIWq8we8h
 hWJ6hoU11EtTe5m7FeG1X+SwWnI/YtfJ9NICRCwpjQlxTekhECxJXZ4yiUmo0gFN2e/xgE4OKaXHq
 KCPoMyDzWJHmLrnuLTZhL4WYJn6kXEs01Y9jsPOvgpmJXxoZMmqIKEGqcx+r8Qd8e8hz1uRDKN2jG
 jYHb09Q4sDhfP6ulATnBNsI8scPPfDkthAudcduy+D5Cwjv08IDYxvrulOKwk3rM1OYFa84pEw4D7
 x3E97so069r5Y7+dPohtI6ylLlQbN6/Bdsvnq3jGAVmeOmABAt38UzM5vQYib6rX64zbVs6vzZcq1
 dqV3XmMnEXD4yibTveXt2sY/gxWayyq7DLzPAqavpv5ujeXD7ECQ4weuDNSph+pOBp5VFAhNu0nfC
 007qHX5wXyN6f/uO81Js8nGjgUSs4nvh2vKlpA8xcusroyHict5mVR59yg6tKMxZMNZJJRWu+XUK1
 xLbmubJwBpOQi+ajMUm+8VMm;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nxAXy-003raX-4Z; Fri, 03 Jun 2022 16:53:14 +0000
Date: Fri, 3 Jun 2022 09:53:09 -0700
To: scabrero@samba.org
Subject: Re: Reintroduce netgroups support?
Message-ID: <Ypo8dcAnXWqnhBye@jeremy-acer>
References: <7b6cb695be2fe801b2e10139eaf84873e6578fea.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <7b6cb695be2fe801b2e10139eaf84873e6578fea.camel@samba.org>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jun 03, 2022 at 12:00:16PM +0200, Samuel Cabrero via samba-technical wrote:
>Hi,
>
>I have received some complains after we dropped netgroups support in
>Samba 4.15.0. Our release notes only mention we dropped NIS but
>netgroups went with it.
>
>Some people still use netgroups without NIS, stored in LDAP and made
>available to the system through nss_sss, but it is also possible to use
>/etc/netgroups.
>
>I had a look to the removed code and I think it is possible to
>reintroduce netgroups support independently from NIS, using the
>getdomainname() function from glibc instead of yp_get_default_domain()
>from libnsl.
>
>Should we bring back netgroups support?

If you can do it to help a customer without an extra
support burdon, then go for it !

I will help review the code.

Cheers,

	Jeremy.

