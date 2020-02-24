Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C9F16B104
	for <lists+samba-technical@lfdr.de>; Mon, 24 Feb 2020 21:37:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=rvzCg1g8gmMJGWyH2mVG2fw15B/D+Pvw2N6yAqcWP5k=; b=TgJnud9dbAXdi8beH5wRfCX1wu
	6OlxiWFJEOM9oW5UO40Ob1tb1xPXC+r/44rfM8k9K3nkUrygsl0gvB0gXqMeNUqxK9qLH80ozGDMA
	hJuvEmEIAVJVGr2I42SBiJ66W8mYrB+ZarT+qby9LBRBXo/Hd51tbag1/tMuutPCM6xTfF369OJ9X
	j0ALmdjAorcq+h6iJ/azHaVLa9jWnZmRsjiSzr04hsOgOcp4wBuqcqpDL7kUC/FAag1fvvpWaNy+i
	nQrzzLvrP+7hTTQDHjcFheYvRAVzeXnIf93CynOAXUTERDm+hK7tufIAMn42MeGiRhPDo44D0mQyo
	tGJxULqg==;
Received: from localhost ([::1]:24772 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j6KTn-00BU3H-Se; Mon, 24 Feb 2020 20:37:27 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:43141) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j6KTj-00BU3A-Vq
 for samba-technical@lists.samba.org; Mon, 24 Feb 2020 20:37:25 +0000
Received: by mail-lj1-x22c.google.com with SMTP id a13so11587380ljm.10
 for <samba-technical@lists.samba.org>; Mon, 24 Feb 2020 12:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rvzCg1g8gmMJGWyH2mVG2fw15B/D+Pvw2N6yAqcWP5k=;
 b=nOcJ8wbPEIYHj+gKhLd6SCqo11wRlmLS92n87wt/hFqhWLtdWTdKLZry+VIvRocfo1
 1MdRHayONQPv/hr028IblKenZuKy2vuo1ktynlIr+yi5OWK0wBu07iPxXfHkXHpHQ8hL
 YfWR7286yUKWiIe1SH0VKEBv+TaDDESu5r2PkZyKlyHr1LDGP5C3u/Mjzbili7j3s7Yi
 uxTHc+nb3U4+Aec/hwTl9x3GBS4GXqShr7AQFHL4bGfmh5+VcDwSkfUsv4RSkuGRZiZF
 yg85+sI+hJwMB+38Jr0hfVgj+1t2I5Uu61d2Iwl5g+LpJXoQkd9tXF3FAPpyuSuCmZxL
 BTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rvzCg1g8gmMJGWyH2mVG2fw15B/D+Pvw2N6yAqcWP5k=;
 b=fo0U7L7FgKim5LQcMSWcmyl6bqyDw2fjQQXZn4rc2JD2glL6S5hktyCCMwbA1d7Yrt
 5oMxnHgEqLdNCP/cqPhMiiiwO6iDBq0vJNtmhpaAkuf1cBxH7WZ+1YhDkNNKRMPYx798
 Fg9oEEePPrQjdLD0baD9jiR+GgQ319x4eyZWVvRdfdzgTsUTndFAncurdRgqaHjvWBwR
 bOZC3dzHbBiwojpPuWGCRhpWMQS1gCZ/+vjNj+UYIXqubsQ+y97WLhi0kHYp2jI0SwmK
 fjwN7Ck3v5bjXN5GUUlVLsd5LCVe8U/IcXAKtmyaGyU7Svo5fRjKRyILFXq2MM6K/Z/5
 9I/w==
X-Gm-Message-State: APjAAAXL/vyoZx7oI9+jtyl1qTui5TaA4bR7wxt9vnXl2s4JLnyIZc+n
 WcNIRh9GoGEDXsNuSi8e1nT5UyvaD1SPtbI859k=
X-Google-Smtp-Source: APXvYqxKCAGxOWHtntWZacB5I32b7NC59QCEvjsI0pUnYDt7Ms/gdnscTuWLjI6xyOvqfiji25LdEikhwuIDOkLJuhQ=
X-Received: by 2002:a2e:5304:: with SMTP id h4mr31070571ljb.75.1582576640879; 
 Mon, 24 Feb 2020 12:37:20 -0800 (PST)
MIME-Version: 1.0
References: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>
 <6408dd32-53f3-2622-d6b9-04928793cc8b@samba.org>
 <CAC-fF8T6dGjDbH3YFpZpEA+Rtoppj+sJ4bZtt9ZDMfH85_UuUg@mail.gmail.com>
 <29a0fc8162de6bde7ea127956efb7de29b4fce3e.camel@redhat.com>
 <CAC-fF8QyT+t0Cmi3BdJe8kJ-LRL_BvvhQr76GwF2t3ZQJWsDDw@mail.gmail.com>
 <dc76b713e4e4c94d396a0d95ebb5145c63ce4a4d.camel@redhat.com>
In-Reply-To: <dc76b713e4e4c94d396a0d95ebb5145c63ce4a4d.camel@redhat.com>
Date: Mon, 24 Feb 2020 21:37:09 +0100
Message-ID: <CAC-fF8RrV1XtnaB0va3Bv8++c17qXKh+JtdSUqS00Eg-3OZUfQ@mail.gmail.com>
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

On Mon, Feb 24, 2020 at 9:28 PM Simo Sorce <simo@redhat.com> wrote:
>
> On Mon, 2020-02-24 at 17:41 +0100, Isaac Boukris wrote:
> > On Mon, Feb 24, 2020 at 2:35 PM Simo Sorce <simo@redhat.com> wrote:
> > > On Sat, 2020-02-22 at 20:09 +0100, Isaac Boukris wrote:
> > > > On Tue, Feb 18, 2020 at 5:48 PM Stefan Metzmacher <metze@samba.org> wrote:
> > > >
> > > > > I think we need input from dochelp to answer 2 questions:
> > > > > 1. which kind of channel bindings are expected/used by windows?
> > > > >    I assume tls-server-end-point. I guess MS-ADTS would be the place
> > > > >    to define these details for ldaps.
> > > >
> > > > I noticed more another reference to channel-bindings in MS-KILE, I
> > > > think maybe KERB_AP_OPTIONS_CBT ad element is the way to tell the
> > > > server to require CB when LdapEnforceChannelBinding is set to 1 only,
> > > > needs testing.
> > > >
> > > > 3.2.5.8 AP Exchange
> > > > If ChannelBinding is set to TRUE, the client sends
> > > > AD-AUTH-DATA-AP-OPTIONS data in an AD-IF-
> > > > RELEVANT element ([RFC4120] section 5.2.6.1). The Authorization Data
> > > > Type AD-AUTH-DATA-AP-
> > > > OPTIONS has an ad-type of 143 and ad-data of KERB_AP_OPTIONS_CBT
> > > > (0x4000). The presence of
> > > > this element indicates that the client expects the applications
> > > > running on it to include channel binding
> > > > information ([RFC2743] section 1.1.6 and [RFC2744]) in AP requests
> > > > whenever Kerberos
> > > > authentication takes place over an "outer channel" such as TLS.
> > > > Channel binding is provided using the
> > > > ChannelBinding variable specified in section 3.2.1.
> > > >
> > > > 3.4.5
> > > > If the ApplicationRequiresCBT parameter (section 3.4.1) is set to
> > > > TRUE, the server, if so configured,
> > > > SHOULD<67> return GSS_S_BAD_BINDINGS whenever the AP exchange request
> > > > message contains
> > > > an all-zero channel binding value and does not contain the
> > > > AD-IF-RELEVANT element ([RFC4120]
> > > > section 5.2.6.1) KERB_AP_OPTIONS_CBT.
> > >
> > > Very interesting, we should add support to decode this AD in MIT krb5
> > > and exposes it via naming attributes or context options, whatever makes
> > > the most sense.
> >
> > Yeah, although I can't really think of something that would work,
> > given we want to know that before calling accept() on the input token.
> > On clients supporting CB, maybe we can add this ad-element via a
> > gss_set_name_attribute() call, not sure.
>
> We might even just see there are CBs in gss_init_sec_context() and just
> do it automatically. The only question is whether this can cause
> interop issues which requires a more nuanced use of these.

Right, doing it automatically make sense. I think an unknown
ad-element in ad-if-relevant container shouldn't cause interop issues.

