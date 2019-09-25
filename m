Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 543E6BE55E
	for <lists+samba-technical@lfdr.de>; Wed, 25 Sep 2019 21:09:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=z4ir1oOozhaHG7qr6qMQwbqxOI+Bdpc5FaVBMw4dkE4=; b=Qg5WhA4EtL2930peYGthrEH9Si
	aErErAVZHroZpAYlfVrrnBY+vUfl2WpYb33aFHHOs+N4FJAlDTBzJARsueA2iZ25POAdP/eBMuTqP
	WOw3CY5WdsB1Tjqaxe36kJyVeCQmYFH/m1oisotlaHd0n5uyhTmjyuO9amMOtvixuZ8mCyckKLedA
	NjW5oRf/s8yHadeMQbkxzkzpVTLTsLBvBJPEri2D/rmU6FHgZ+FLB41MQ96m8jMPCIo+esPOWA/KM
	29wNhrZsQGfqaNcutwbyMaOQSk4Pj9sdQciz3VSPaqRM7CfEhToXQheuCimS7QJtbGWt1lVLc32vJ
	F7wyzbzw==;
Received: from localhost ([::1]:63954 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iDCfb-008cjM-Ki; Wed, 25 Sep 2019 19:09:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20370) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iDCfV-008cjA-Ms
 for samba-technical@lists.samba.org; Wed, 25 Sep 2019 19:09:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=z4ir1oOozhaHG7qr6qMQwbqxOI+Bdpc5FaVBMw4dkE4=; b=dSmjp4enMHEYzLwalz2lQMaTjc
 bPpzQUaA+kyrSfYUPz5Yy+upbWRb9wu3ApACjjuzhC0o/hyVK2tTA1KgCxHIHJRQmNIEIVaCb/4p3
 9C4MNigaspavvrBKvjnwKMuljIFJJZwttqrPNWXxCojlz3Kv6+H+I4vy4Vns0i/TDqBk=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iDCfR-00042S-Vr; Wed, 25 Sep 2019 19:09:40 +0000
Date: Wed, 25 Sep 2019 12:09:35 -0700
To: Uri Simchoni <uri@samba.org>
Subject: Re: getpwnam/uid for group with ID_TYPE_BOTH
Message-ID: <20190925190934.GA17280@samba.org>
References: <20190923193911.GA9762@samba.org>
 <62c2ca93-2600-27d9-1697-0d465efed1a9@samba.org>
 <8e2dd85c-37d3-6c65-49f6-28aa5d59018f@samba.org>
 <a361812a-cc20-40a3-1499-75e381ef1ef2@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a361812a-cc20-40a3-1499-75e381ef1ef2@samba.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: Stefan Metzmacher <metze@samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Sep 25, 2019 at 09:14:12PM +0300, Uri Simchoni via samba-technical wrote:
> On 9/24/19 12:45 AM, Stefan Metzmacher via samba-technical wrote:
> >Hi Rowland,
> >
> >No, it did with 4.5 and that's how it's supposed to be.
> >That's exactly what ID_TYPE_BOTH is all about.
> >
> >metze
> >
> 
> Hi metze,
> 
> Can you elaborate on that sentence, and what is the use case for
> generating passwd for a group? Is it related to a file being owned
> by a group SID (administrators)?

The case i was looking at is that a file is owned by a group. This works
as ID_TYPE_BOTH provides botha uid and a gid with the same value, and
the uid can be used as the unix file owner.

Now the usecase for generating a passwd entry is that 'ls -l' issues a
getpwuid call to query the passwd in order to display the name. Without
that, only the uid displayed.

> I'm not sure I ever understood this ID_TYPE_BOTH thing - I seem to
> remember that my understanding has been that it simplifies the code
> - that some rid backends don't know and don't care if a SID is a
> group or a user, but they sure can convert it to a unix ID, hence
> the "both", but that explanation doesn't mandate ability to generate
> passwd for a group, so hearing that this is actually what
> ID_TYPE_BOTH is all about was surprising to me.

The only requirement i see is the one from above: Having the ability to
map through the normal NSS calls between names and uids. I think this
would also enable a 'chown'  from the shall with a group, as chown
issues a getpwnam call to get the uid from the name.

Christof

