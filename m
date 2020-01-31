Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 636FC14F2D2
	for <lists+samba-technical@lfdr.de>; Fri, 31 Jan 2020 20:36:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=E3zw9rbNvlHg7CTcsdmesqdiXq2sMPXI9ShQ4uPgyc0=; b=5R5EQXSv8bKHQtVuYoIaieMOCy
	ZYNzHmMji/vDvFi6F8YQTF6LcidtiwI33aR5m1NcPx8c6l4WTDWxF0Vo/uOGACmMrWseit2AFuIDQ
	L1UvxKxvmcEeVq5BChvEL7/HUc8obK32/xx66kpWCnvgWBOPyZJKR/4zqDKFyZYU3ssEZauLKBGet
	7AokhXmQDvAJWCegEUqF790zj9Zzemlw2JsO8rzpbIVgLf3G8qbRY7K7FcFHMbMN/g9TwhbtsqBhR
	rsVdhyyLLqr5MqLXNsFqrVilXT/KV2EgY47C8jyv1B1d6Br++qn9KN+pvVRhcrH9qC+0P8WvLFqea
	Qb2hhsbQ==;
Received: from localhost ([::1]:58406 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ixc4R-005s2a-Pf; Fri, 31 Jan 2020 19:35:16 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:55213) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ixc4M-005s2R-GB
 for samba-technical@lists.samba.org; Fri, 31 Jan 2020 19:35:12 +0000
Received: from intern.SerNet.DE by mail.SerNet.DE with esmtps (Exim 4.92 #3)
 id 1ixc4J-0004Sy-Kx; Fri, 31 Jan 2020 20:35:07 +0100
Received: by intern.sernet.de
 id 1ixc4J-0005Wl-Gl; Fri, 31 Jan 2020 20:35:07 +0100
Received: from bjacke by pell.sernet.de with local (Exim 4.90_1)
 (envelope-from <bjacke@sernet.de>)
 id 1ixc4J-0004Wv-Bp; Fri, 31 Jan 2020 20:35:07 +0100
Date: Fri, 31 Jan 2020 20:35:07 +0100
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: [Samba] LDAP signing and channel binding
Message-ID: <20200131193507.GF12961@sernet.de>
Mail-Followup-To: Andrew Bartlett <abartlet@samba.org>,
 Alexey A Nikitin <nikitin@amazon.com>,
 samba-technical@lists.samba.org
References: <1761956.tdWV9SEqCh@u33b4e6d89a065e.ant.amazon.com>
 <d64164c7cc95929f5ee6af134736c451459a501c.camel@samba.org>
 <1737556.atdPhlSkOF@u33b4e6d89a065e.ant.amazon.com>
 <7f97655db06e40a7d1d6afa7d7d10329a92eceec.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f97655db06e40a7d1d6afa7d7d10329a92eceec.camel@samba.org>
X-Q: Die Schriftsteller koennen nicht so schnell schreiben, wie die
 Regierungen Kriege machen; denn das Schreiben verlangt Denkarbeit. - Brecht
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
From: =?utf-8?q?Bj=C3=B6rn_JACKE_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?iso-8859-1?Q?Bj=F6rn?= JACKE <bj@SerNet.DE>
Cc: samba-technical@lists.samba.org, Alexey A Nikitin <nikitin@amazon.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 2020-01-29 at 14:01 +1300 Andrew Bartlett via samba sent off:
> On Tue, 2020-01-28 at 16:38 -0800, Alexey A Nikitin wrote:
> > On Tuesday, 28 January 2020 15:57:47 PST Andrew Bartlett wrote:
> > > On Tue, 2020-01-28 at 15:24 -0800, Alexey A Nikitin via samba
> > > wrote:
> > > > I'm having hard time finding any definitive information on
> > > > whether
> > > > Winbind supports LDAP signing (I assume 'yes') and channel
> > > > binding.
> > > > I read 
> > > > 
> https://wiki.samba.org/index.php/Samba_Security_Documentation#Special_dangers_of_NTLMSSP_and_Kerberos_over_TLS
> > > > to mean 'no' for channel binding, unless that documentation is
> > > > outdated or I misunderstand it.
> > > 
> > > Correct.  We don't support channel binding in our client or
> > > server. 
> > > While we avoid this combination where possible, we would gladly
> > > accept
> > > funding to add it client and server (DC) side for the the cases
> > > where
> > > (per below) it is forced.
> > > 
> > 
> > So considering Microsoft is planning to release a patch in March 2020
> > (
> > https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/ADV190023
> > ) that would force signing and channel binding for LDAP,
> > Samba/Winbind developers seem to be rather calm about it. I admit I'm
> > still learning about AD DS (as well as Winbind), so please correct me
> > if my understanding is wrong - the above mentioned upcoming patch is
> > generally not a concern because channel binding applies only to LDAP
> > authentication over TLS, and there is usually still an option of
> > authentication using Kerberos and SPNEGO instead of LDAPS. Is my
> > understanding correct?
> 
> In short, we hope so.  It would still be great if this could be
> developed, we know that some sites do enforce the use of TLS for
> various reasons.
> 
> Also, even with the warnings, the Samba development community is small
> and is funded significantly by customer needs/priorities.  So it can
> happen that even with warnings such as these it needs a customer to
> jump up and down before someone is able to put in the time.
> 
> A fix for this in Samba (for the winbind side) won't be trivial, we
> would need to read the SSL session ID from inside OpenLDAP's use of
> OpenSSL.  The Samba AD DC may be easier to patch, as we control the
> stack down to GnuTLS is that case.

the LdapEnforceChannelBinding from ADV190023 is obviously for enforcing the
standarized TLS extension for Channel Bindings, see RFC5929. And I
just saw that GnuTLS supports that since 2.11.4 already.

For our client site it looks like it's time to move away from openldap to tldap
finally to get control over the TLS layer. Has someone already started to work
out getting tldap for our client side?

Björn

