Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CF81716A7AD
	for <lists+samba-technical@lfdr.de>; Mon, 24 Feb 2020 14:53:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=iEn1dz6YRGBn6cYHJ/DiaNqvwWoUvKSdDUQrKKJmhHY=; b=wXyuMpiR6SaTB2ET4AB9khI/d2
	3mfjfvvSvUOB3gohlhgSn7wemRYK8nS/aKRJcybCVa1/oAjUlwawpXDZW9YX2dk/k0v7idt4PbJw8
	EdGX1do25NCGk/QwR1WFx/aFiQ37h1au03teMCfcjNwR66dAbQeagtUz6EZY7pEu5Vw8LHWBrszC8
	BF/5nmgyz/QmN1RGXDuIuE6XD412e0H9I0n/wFTuV0YnzNHkJE78SdriCFykbTXVMpyizlegsYIVt
	/mFdIiQo+Uj1r3mtKV4K6gf15Fj1PCTWlB+dWB0kaXyH+laIPYVO2InNM4nxsRh5375ZCPiHg/Omr
	i/YhmVtQ==;
Received: from localhost ([::1]:40768 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j6E9f-00BPY2-Ah; Mon, 24 Feb 2020 13:52:15 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44337
 helo=us-smtp-1.mimecast.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1j6E9a-00BPXv-0o
 for samba-technical@lists.samba.org; Mon, 24 Feb 2020 13:52:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582552321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iEn1dz6YRGBn6cYHJ/DiaNqvwWoUvKSdDUQrKKJmhHY=;
 b=gO3GmWk5Kvaqif5EgGSvl16NQvz1MPb3NDCkDmQ/QLTIIGg/Wl8dGNBBbD6r8D7Lths6Y8
 DTmJq5yL24qds0qDhyRvMQb4qTj8K6tYQlnSUmtAywJSXTDsj+VvUUWC/Z8p37jANj4BK/
 XLNcwZG2AbWrHEw444ebxdljG8R7c+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-w3BCp4dENHytxRHVDxlISg-1; Mon, 24 Feb 2020 08:35:20 -0500
X-MC-Unique: w3BCp4dENHytxRHVDxlISg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D41B28017CC;
 Mon, 24 Feb 2020 13:35:18 +0000 (UTC)
Received: from ovpn-116-244.phx2.redhat.com (ovpn-116-244.phx2.redhat.com
 [10.3.116.244])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94CD660BF3;
 Mon, 24 Feb 2020 13:35:17 +0000 (UTC)
Message-ID: <29a0fc8162de6bde7ea127956efb7de29b4fce3e.camel@redhat.com>
Subject: Re: ADV190023 | LDAP channel binding support
To: Isaac Boukris <iboukris@gmail.com>, Stefan Metzmacher <metze@samba.org>
Date: Mon, 24 Feb 2020 08:35:16 -0500
In-Reply-To: <CAC-fF8T6dGjDbH3YFpZpEA+Rtoppj+sJ4bZtt9ZDMfH85_UuUg@mail.gmail.com>
References: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>
 <6408dd32-53f3-2622-d6b9-04928793cc8b@samba.org>
 <CAC-fF8T6dGjDbH3YFpZpEA+Rtoppj+sJ4bZtt9ZDMfH85_UuUg@mail.gmail.com>
Organization: Red Hat, Inc.
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Warn: EHLO/HELO not verified: Remote host 207.211.31.120
 (us-smtp-delivery-1.mimecast.com) incorrectly presented itself as
 us-smtp-1.mimecast.com
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
Cc: Andreas Schneider <asn@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 2020-02-22 at 20:09 +0100, Isaac Boukris wrote:
> On Tue, Feb 18, 2020 at 5:48 PM Stefan Metzmacher <metze@samba.org> wrote:
> > Am 18.02.20 um 17:06 schrieb Isaac Boukris:
> > > Has anyone looked into channel-binding or has any idea what is needed
> > > to implement in samba (or upstream) for this to work?
> > > Is there other ldap client code in samba that would also be impacted?
> > 
> > Yes.
> > 
> > > BTW, I noticed windows clients use both singing and sealing, should we
> > > consider changing the defaults of "client ldap sasl wrapping" to seal?
> > 
> > I looked at it a bit, see
> > https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=ac8fd11f1d4b9deb48d6c7942af0c83b52d69d7f
> > 
> > I think we need input from dochelp to answer 2 questions:
> > 1. which kind of channel bindings are expected/used by windows?
> >    I assume tls-server-end-point. I guess MS-ADTS would be the place
> >    to define these details for ldaps.
> 
> I noticed more another reference to channel-bindings in MS-KILE, I
> think maybe KERB_AP_OPTIONS_CBT ad element is the way to tell the
> server to require CB when LdapEnforceChannelBinding is set to 1 only,
> needs testing.
> 
> 3.2.5.8 AP Exchange
> If ChannelBinding is set to TRUE, the client sends
> AD-AUTH-DATA-AP-OPTIONS data in an AD-IF-
> RELEVANT element ([RFC4120] section 5.2.6.1). The Authorization Data
> Type AD-AUTH-DATA-AP-
> OPTIONS has an ad-type of 143 and ad-data of KERB_AP_OPTIONS_CBT
> (0x4000). The presence of
> this element indicates that the client expects the applications
> running on it to include channel binding
> information ([RFC2743] section 1.1.6 and [RFC2744]) in AP requests
> whenever Kerberos
> authentication takes place over an "outer channel" such as TLS.
> Channel binding is provided using the
> ChannelBinding variable specified in section 3.2.1.
> 
> 3.4.5
> If the ApplicationRequiresCBT parameter (section 3.4.1) is set to
> TRUE, the server, if so configured,
> SHOULD<67> return GSS_S_BAD_BINDINGS whenever the AP exchange request
> message contains
> an all-zero channel binding value and does not contain the
> AD-IF-RELEVANT element ([RFC4120]
> section 5.2.6.1) KERB_AP_OPTIONS_CBT.

Very interesting, we should add support to decode this AD in MIT krb5
and exposes it via naming attributes or context options, whatever makes
the most sense.

Simo.

-- 
Simo Sorce
RHEL Crypto Team
Red Hat, Inc





