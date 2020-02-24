Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A7A16ABD9
	for <lists+samba-technical@lfdr.de>; Mon, 24 Feb 2020 17:42:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=8oq3y0RkJ5WE/3FXvT+z5bfj4fmmOzFW0GbMEaROb2A=; b=pXh7qcLS6vH5MSu3w87veLjdQ7
	2h49NJjyy3s1qTmkBmiGCybs7jVqu57+M/qXO+Ier4qK9wz9dZkyNP4B1001N0u7Ypni/qXAukcZG
	rsELT3lswzEh/v0OXlW0ren9Z6IfzeP/lOXXbUP2+UqLO8jteLtmKCCQ0rF6rFVl2ufPgLIrdw6ve
	QKGpCC8YJqNktpzLf+nm8xX1McBHJV918iykQu/yTtXc+3fWSNZybjoRCiWd+WUk20xBJAkeABZ0u
	R0eeU1pnF8CR71ck6IX50GBCClbAu3+3KkBWPgzpr2dLtDbdcZH5MuyBIEN2ZjEf55PKw8KxHdk8a
	W9W8DcJQ==;
Received: from localhost ([::1]:56220 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j6GoB-00BRlG-Ij; Mon, 24 Feb 2020 16:42:15 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:42242) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j6Go6-00BRl9-Up
 for samba-technical@lists.samba.org; Mon, 24 Feb 2020 16:42:12 +0000
Received: by mail-lj1-x229.google.com with SMTP id d10so10825977ljl.9
 for <samba-technical@lists.samba.org>; Mon, 24 Feb 2020 08:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8oq3y0RkJ5WE/3FXvT+z5bfj4fmmOzFW0GbMEaROb2A=;
 b=dO6tFtFWDMdCSGRHqqltC4JhEn1PYa7vF3z5Cyv1XCH/ZyEYltj7beXYgas8hJvoKx
 ZZN/4L0Rbu8Gq1EV3WhNL2Tw1ATH7iHz7loDdIx1Textjuf4CdmK4Hxd+kvk2DLkS/t7
 FZeDgxDDsRCFREkwM8wg3U00JG4PpjAlNXnqaC0ZWO+nT4daP8xTzrFleHfaMhZeogRw
 jJdOk8rmJxUlz4kMvkQrMyCU8IM7c4s6eQ0wjwv7Lb2v0iM6AOuBWUnQWEQ2PDdLdLD0
 uXiyu5TyE2edYZ8sV3k5zMO16nePqTHO5T/txgqUGq7wUaadxDwV+/PneTe52JOtG/H0
 pOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8oq3y0RkJ5WE/3FXvT+z5bfj4fmmOzFW0GbMEaROb2A=;
 b=paWz/jPYpyT6Urk9rFOKHVb5m42lgb5h3dUpJbLLRpguOEex0ilLy8CHmf/c5LEh36
 SkgMX0e87CxU6w+pI1v7Hlj6faNgeoomfWW9p+EGAvzRJOdrMWnucx5JPl3OvcGa8BeX
 jCW7+RjCWpVjcPNHn/0sSopXBvpEWhPgb0KPmLyNm/FxPk01FkKYYynegu5m+ndwImyf
 xabjt2j4iuwPj2//1fw2kyv8UdPPc60k5SuJ6PwdLdMJhG3BVIH2Vs56joS+CuZABvRU
 WCMRTspSFbj0hGeiERlDq724xZcVdBrKGH20T7OD3DGcqNU4fc1s0/M5R6BEhne22Lsx
 kmMQ==
X-Gm-Message-State: APjAAAXZQNycipUsp7iRAhnvll/7+sXxholbCsa/Wep0ORItezWdFfZ7
 OKEhcE7V0pBrWPZ1x0PrVeR4IQcG/h7t0nxB8qs=
X-Google-Smtp-Source: APXvYqx2a0PcsNC0y/ECnCQel1DIfYCXMSQGpskta0B6syq/uAgvS2S6W++axJA8l5a1aI3YQ/+Sj6bautv1jMERqZM=
X-Received: by 2002:a2e:8197:: with SMTP id e23mr29529365ljg.250.1582562529934; 
 Mon, 24 Feb 2020 08:42:09 -0800 (PST)
MIME-Version: 1.0
References: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>
 <6408dd32-53f3-2622-d6b9-04928793cc8b@samba.org>
 <CAC-fF8T6dGjDbH3YFpZpEA+Rtoppj+sJ4bZtt9ZDMfH85_UuUg@mail.gmail.com>
 <29a0fc8162de6bde7ea127956efb7de29b4fce3e.camel@redhat.com>
In-Reply-To: <29a0fc8162de6bde7ea127956efb7de29b4fce3e.camel@redhat.com>
Date: Mon, 24 Feb 2020 17:41:58 +0100
Message-ID: <CAC-fF8QyT+t0Cmi3BdJe8kJ-LRL_BvvhQr76GwF2t3ZQJWsDDw@mail.gmail.com>
Subject: Re: ADV190023 | LDAP channel binding support
To: Simo Sorce <simo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Stefan Metzmacher <metze@samba.org>, Andreas Schneider <asn@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Feb 24, 2020 at 2:35 PM Simo Sorce <simo@redhat.com> wrote:
>
> On Sat, 2020-02-22 at 20:09 +0100, Isaac Boukris wrote:
> > On Tue, Feb 18, 2020 at 5:48 PM Stefan Metzmacher <metze@samba.org> wrote:
> >
> > > I think we need input from dochelp to answer 2 questions:
> > > 1. which kind of channel bindings are expected/used by windows?
> > >    I assume tls-server-end-point. I guess MS-ADTS would be the place
> > >    to define these details for ldaps.
> >
> > I noticed more another reference to channel-bindings in MS-KILE, I
> > think maybe KERB_AP_OPTIONS_CBT ad element is the way to tell the
> > server to require CB when LdapEnforceChannelBinding is set to 1 only,
> > needs testing.
> >
> > 3.2.5.8 AP Exchange
> > If ChannelBinding is set to TRUE, the client sends
> > AD-AUTH-DATA-AP-OPTIONS data in an AD-IF-
> > RELEVANT element ([RFC4120] section 5.2.6.1). The Authorization Data
> > Type AD-AUTH-DATA-AP-
> > OPTIONS has an ad-type of 143 and ad-data of KERB_AP_OPTIONS_CBT
> > (0x4000). The presence of
> > this element indicates that the client expects the applications
> > running on it to include channel binding
> > information ([RFC2743] section 1.1.6 and [RFC2744]) in AP requests
> > whenever Kerberos
> > authentication takes place over an "outer channel" such as TLS.
> > Channel binding is provided using the
> > ChannelBinding variable specified in section 3.2.1.
> >
> > 3.4.5
> > If the ApplicationRequiresCBT parameter (section 3.4.1) is set to
> > TRUE, the server, if so configured,
> > SHOULD<67> return GSS_S_BAD_BINDINGS whenever the AP exchange request
> > message contains
> > an all-zero channel binding value and does not contain the
> > AD-IF-RELEVANT element ([RFC4120]
> > section 5.2.6.1) KERB_AP_OPTIONS_CBT.
>
> Very interesting, we should add support to decode this AD in MIT krb5
> and exposes it via naming attributes or context options, whatever makes
> the most sense.

Yeah, although I can't really think of something that would work,
given we want to know that before calling accept() on the input token.
On clients supporting CB, maybe we can add this ad-element via a
gss_set_name_attribute() call, not sure.
I'd like to send a mail on krbdev, but first I need test and see if it
is really what it looks like.

