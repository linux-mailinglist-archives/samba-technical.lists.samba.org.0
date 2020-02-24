Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6155316B0F9
	for <lists+samba-technical@lfdr.de>; Mon, 24 Feb 2020 21:29:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=THl+DjBzV563ZZ6BXYWXt4IC42VUcWU1LdRFjtCZGWM=; b=JwXsRt6Y+UfaywfbI6F6lxr5tF
	GKtFcmjFRIqi8ymwETc2TnxmIARt/sqztNszOtc7sVUriXpCpcjo/KXyBQrKjD6RVVk9AtURzoq0j
	ULikdkzTod6HIwaHH2Dko4pScJJUVQfFQ7lGFwQyhHMyOcnOQ5OxWGyE4MKbh/rDLRpfAj5uxn0ro
	nNNIMJGPLU+VweG8cYSx5cfa/BjttsahD6cCOTFVmU8f6FLptTAKZoMWxFbwTz6yNvidi/vxjJFyb
	Tw1Eh3bBNEcP9SvCeE9S/QbAZgf0qKEcI+YkoWSzW3WKGJiWTRy9Os3ukZnj43FDclb1qcd4Qw0Aq
	GrgY1wEA==;
Received: from localhost ([::1]:23262 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j6KLO-00BTqh-FB; Mon, 24 Feb 2020 20:28:46 +0000
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:40088
 helo=us-smtp-delivery-1.mimecast.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1j6KLJ-00BTqa-Lc
 for samba-technical@lists.samba.org; Mon, 24 Feb 2020 20:28:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582576112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=THl+DjBzV563ZZ6BXYWXt4IC42VUcWU1LdRFjtCZGWM=;
 b=Gu6aEUTW+ShVBev9mtPcKRou6xvPQALNOVInRCVjs9j3jOCJB30ImuGQYlrJJLCWDuWn6d
 rDf+KwVpU6QoH62w5uNUvBqLPNklfm7RYlgHHT7DJLOfOk9E1XocoCfNi8B0ggxqVa6RrE
 e+uQjmou0HW6XRW6vGvyosLaPtiFK+0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-LWEC1rbTMey38exAfykcVw-1; Mon, 24 Feb 2020 15:28:27 -0500
X-MC-Unique: LWEC1rbTMey38exAfykcVw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF6A8189F764;
 Mon, 24 Feb 2020 20:28:26 +0000 (UTC)
Received: from ovpn-116-244.phx2.redhat.com (ovpn-116-244.phx2.redhat.com
 [10.3.116.244])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACF4D86810;
 Mon, 24 Feb 2020 20:28:25 +0000 (UTC)
Message-ID: <dc76b713e4e4c94d396a0d95ebb5145c63ce4a4d.camel@redhat.com>
Subject: Re: ADV190023 | LDAP channel binding support
To: Isaac Boukris <iboukris@gmail.com>
Date: Mon, 24 Feb 2020 15:28:24 -0500
In-Reply-To: <CAC-fF8QyT+t0Cmi3BdJe8kJ-LRL_BvvhQr76GwF2t3ZQJWsDDw@mail.gmail.com>
References: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>
 <6408dd32-53f3-2622-d6b9-04928793cc8b@samba.org>
 <CAC-fF8T6dGjDbH3YFpZpEA+Rtoppj+sJ4bZtt9ZDMfH85_UuUg@mail.gmail.com>
 <29a0fc8162de6bde7ea127956efb7de29b4fce3e.camel@redhat.com>
 <CAC-fF8QyT+t0Cmi3BdJe8kJ-LRL_BvvhQr76GwF2t3ZQJWsDDw@mail.gmail.com>
Organization: Red Hat, Inc.
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Warn: EHLO/HELO not verified: Remote host 205.139.110.61
 (us-smtp-2.mimecast.com) incorrectly presented itself as
 us-smtp-delivery-1.mimecast.com
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
Cc: Stefan Metzmacher <metze@samba.org>, Andreas Schneider <asn@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2020-02-24 at 17:41 +0100, Isaac Boukris wrote:
> On Mon, Feb 24, 2020 at 2:35 PM Simo Sorce <simo@redhat.com> wrote:
> > On Sat, 2020-02-22 at 20:09 +0100, Isaac Boukris wrote:
> > > On Tue, Feb 18, 2020 at 5:48 PM Stefan Metzmacher <metze@samba.org> wrote:
> > > 
> > > > I think we need input from dochelp to answer 2 questions:
> > > > 1. which kind of channel bindings are expected/used by windows?
> > > >    I assume tls-server-end-point. I guess MS-ADTS would be the place
> > > >    to define these details for ldaps.
> > > 
> > > I noticed more another reference to channel-bindings in MS-KILE, I
> > > think maybe KERB_AP_OPTIONS_CBT ad element is the way to tell the
> > > server to require CB when LdapEnforceChannelBinding is set to 1 only,
> > > needs testing.
> > > 
> > > 3.2.5.8 AP Exchange
> > > If ChannelBinding is set to TRUE, the client sends
> > > AD-AUTH-DATA-AP-OPTIONS data in an AD-IF-
> > > RELEVANT element ([RFC4120] section 5.2.6.1). The Authorization Data
> > > Type AD-AUTH-DATA-AP-
> > > OPTIONS has an ad-type of 143 and ad-data of KERB_AP_OPTIONS_CBT
> > > (0x4000). The presence of
> > > this element indicates that the client expects the applications
> > > running on it to include channel binding
> > > information ([RFC2743] section 1.1.6 and [RFC2744]) in AP requests
> > > whenever Kerberos
> > > authentication takes place over an "outer channel" such as TLS.
> > > Channel binding is provided using the
> > > ChannelBinding variable specified in section 3.2.1.
> > > 
> > > 3.4.5
> > > If the ApplicationRequiresCBT parameter (section 3.4.1) is set to
> > > TRUE, the server, if so configured,
> > > SHOULD<67> return GSS_S_BAD_BINDINGS whenever the AP exchange request
> > > message contains
> > > an all-zero channel binding value and does not contain the
> > > AD-IF-RELEVANT element ([RFC4120]
> > > section 5.2.6.1) KERB_AP_OPTIONS_CBT.
> > 
> > Very interesting, we should add support to decode this AD in MIT krb5
> > and exposes it via naming attributes or context options, whatever makes
> > the most sense.
> 
> Yeah, although I can't really think of something that would work,
> given we want to know that before calling accept() on the input token.
> On clients supporting CB, maybe we can add this ad-element via a
> gss_set_name_attribute() call, not sure.

We might even just see there are CBs in gss_init_sec_context() and just
do it automatically. The only question is whether this can cause
interop issues which requires a more nuanced use of these.
 
> I'd like to send a mail on krbdev, but first I need test and see if it
> is really what it looks like.

Makes sense.

Simo.

-- 
Simo Sorce
RHEL Crypto Team
Red Hat, Inc





