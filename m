Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0A7B914C6
	for <lists+samba-technical@lfdr.de>; Mon, 22 Sep 2025 15:09:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=/3JEh6YXMBsRukh5SpZ48nFA6vSS7cRxhs+mBDe2TYc=; b=iz3x4wrAAOKgIoxo96V0E3M+o/
	QbZKQmoBcEp0dhjp6mg75FWpfBKS68d23+0tqr8WEJe8HSawwZuYsGAc/ne9b2OfkuPnWlSXUaXYy
	1kOtpTWvP83ewSoglLZWLbqBedDyVz9ROWbyEkrAq8oZGkXtA6HJ3tLHaftLF0d+cxQx7s//Oo4a+
	b/duC36xZ7HSRxIdAoVnK6hrQy6yBt6+F2r3paakqk6fkJR++7A9qB3122SdlNuVG55FKH5fZWvsc
	SDb+7oX6VSNABcBUJubziOdx/JKmxfGeEtJe5bJxZbYJgY56nhqQOd2z0G/ZEnxoahkepMBQE3GDP
	2ys3XUuw==;
Received: from ip6-localhost ([::1]:46290 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v0gHR-004Xoo-CQ; Mon, 22 Sep 2025 13:08:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25495) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0gHL-004Xoh-AS
 for samba-technical@lists.samba.org; Mon, 22 Sep 2025 13:08:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758546503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/3JEh6YXMBsRukh5SpZ48nFA6vSS7cRxhs+mBDe2TYc=;
 b=Neu+HJO27x+FrfQjBbSmBKCU5A5tBpepMsqgVcViuAmmiw/NxPbSOTtsHudHSGLRb+ywrW
 FoYckNKGKQVge5bJrlR2yuU6n40oQXKfuwAPr32YzyQKwK7AIgQTrhe6fUb3ah8KJ7K1fn
 pTJhI4ZhfiWDQLn3x3u0Zbf9H7wg2WY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758546503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/3JEh6YXMBsRukh5SpZ48nFA6vSS7cRxhs+mBDe2TYc=;
 b=Neu+HJO27x+FrfQjBbSmBKCU5A5tBpepMsqgVcViuAmmiw/NxPbSOTtsHudHSGLRb+ywrW
 FoYckNKGKQVge5bJrlR2yuU6n40oQXKfuwAPr32YzyQKwK7AIgQTrhe6fUb3ah8KJ7K1fn
 pTJhI4ZhfiWDQLn3x3u0Zbf9H7wg2WY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-645-9b29mZvSN4e2G7Vzv44vhQ-1; Mon,
 22 Sep 2025 09:08:22 -0400
X-MC-Unique: 9b29mZvSN4e2G7Vzv44vhQ-1
X-Mimecast-MFC-AGG-ID: 9b29mZvSN4e2G7Vzv44vhQ_1758546501
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CDDF01955E70; Mon, 22 Sep 2025 13:08:20 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.155])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 41E831956056; Mon, 22 Sep 2025 13:08:19 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <CAN05THR3YQZ5sd7DOBo11kK=NaxFqr+X_fKjGt-8OXEkM4ShWw@mail.gmail.com>
References: <CAN05THR3YQZ5sd7DOBo11kK=NaxFqr+X_fKjGt-8OXEkM4ShWw@mail.gmail.com>
 <80395.1758522267@warthog.procyon.org.uk>
 <aNCOOS9GArQyf6Kb@jeremy-HP-Z840-Workstation>
 <12788.1758471560@warthog.procyon.org.uk>
 <98570.1758528576@warthog.procyon.org.uk>
 <101171.1758528778@warthog.procyon.org.uk>
To: ronnie sahlberg <ronniesahlberg@gmail.com>
Subject: Re: How to cause a multipart SMB1 Trans2 PDU to occur
MIME-Version: 1.0
Date: Mon, 22 Sep 2025 14:08:17 +0100
Message-ID: <184886.1758546497@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RnwiYnmjQpYjd8ov5imCeXh_0OqcfOKS7dKeOyM_o-0_1758546501
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <184885.1758546497.1@warthog.procyon.org.uk>
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
From: David Howells via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Howells <dhowells@redhat.com>
Cc: dhowells@redhat.com, Steve French <sfrench@samba.org>,
 samba-technical@lists.samba.org, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

ronnie sahlberg <ronniesahlberg@gmail.com> wrote:

> Can you check that "Preferences/Protocols/SMB/Reassemble SMB
> Transaction payload" is enabled?

It is.

> Packets 46,47,49 show up in the packet pane as "Trans2
> response<unknown>"     I will fix this and remove the "<unknown>" tag.

Actually, I think it is working.  The first packet shows a "Reassembled SMB
(16234 bytes)" tab with the data in it.  It's just that the follow on packets
say:

	Subcommand: <UNKNOWN> since request packet wasn't seen

> It should probably say "fragment" or something instead.

Perhaps "fragment 4032-8065/16232"?

David


