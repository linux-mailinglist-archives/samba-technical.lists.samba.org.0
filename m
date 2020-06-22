Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCA32043D2
	for <lists+samba-technical@lfdr.de>; Tue, 23 Jun 2020 00:43:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=wC748OuFuVo3SLRDKliVth/eAqE32z9bGZcTEWPsBHM=; b=OU9b9Nu7hZOj1gJEvRkw4E28Pe
	7Tn6+P8g3z+eammzpPrYhh1RBoMXpspwrpQ2StNp3KYBBibVGFbjfUQZicekm+Rs+PmOVqge0wEBL
	dfolgMtxLMWardnKnJmNAHOgay9M0qpMPNuNQEnbbZK3PolmlR5ZiH9oOuNKf+kwfZxlsWvui0+Hz
	uWkqnVre9ybr+ZSj9vv0jjdRsZXfNa2FoOdf9HLsT+haN2n7ga36/aYnLwwLHVY267Q2xkS4sShsq
	aUDXic51cK2BYr0T7fsKfxsvSGATGILiAmPihTQlP7v5peyjC0dDEb18t9JFLwwEDvGQ/ns6Qj6z4
	7aIcX4rg==;
Received: from localhost ([::1]:33624 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jnV9O-001uQv-Sd; Mon, 22 Jun 2020 22:42:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53824) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jnV9I-001uQn-Fn
 for samba-technical@lists.samba.org; Mon, 22 Jun 2020 22:42:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=wC748OuFuVo3SLRDKliVth/eAqE32z9bGZcTEWPsBHM=; b=w7CM/RHTFO2NtzrYIpMAsgNegX
 c4iYyWLxCMcn1cWGzWIDoCIYk+4RMeQVMJRN7a9eFrLkY6uiWA49DqKDjmjuOPeZKYQJfeLNuuD0p
 KDIzKWcWd832ZQDMvKRmDUZxng8/QK9o33qEHss9C7pCrpMid+Aervug6yuCX1I6uYPO8FWSz61iw
 MAW3DcW0lsXCLG618HS21jEWc2iYYMpmHWqDBvhhmIpwEutCg5iEMFjjmCttvubQKr/Dkgst3etUA
 ysBGhDkb4Cs9Kie+FB3/esMVSyU7ZkKVB/yndoZ8mp9PhByUm/i/MEKrGxnTZz0hW4RCQLCVMERmV
 oeyEzms41sfdrxex6cUiNoXi3TEhYzoRvaKXkXLE6FWX9VQoJWM5bE61f13UyWtL319uJ9BcOLre/
 PM8M/ZmaNvrQ7YpsrYk31AsiIvRK4z+NHGDZN5kpnLYahobFUUGksyMCmzd5Z0HoXv5mkcxp4rurY
 h5sza9CAg3UXkA3aX+q4/8YZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jnV9G-0004w8-2o; Mon, 22 Jun 2020 22:42:42 +0000
Message-ID: <c91687fad82115c447845c3cc406a5143adf4bbe.camel@samba.org>
Subject: Re: gitlab: testing of ldap-ssl-ads option
To: Isaac Boukris <iboukris@gmail.com>
Date: Tue, 23 Jun 2020 10:42:36 +1200
In-Reply-To: <CAC-fF8RQztBgiFTCS6AxVWLsjV3UWyWNUK2Cz7qKpE6hWCy7uQ@mail.gmail.com>
References: <CAC-fF8TH5sf6ekjfG5QqnEwG41fopV1bWOMxBH_UnodfjDo_qA@mail.gmail.com>
 <20200619181956.GF10191@jeremy-acer>
 <CAC-fF8SYbXaz33yJ_QaZzeYh2uBt3iKxHzbQNtMPm5qqwvAciQ@mail.gmail.com>
 <CAC-fF8Stst7BnrEKVQLP7og-HLp=T+NNoiSpUmRD3mwxXtK67Q@mail.gmail.com>
 <20f59230-59fa-9946-3b4f-937cd1bf619a@sernet.de>
 <CAC-fF8SPmfGbokEzBjZW9zBqbDYeTUg8YN8i_cWY-UN3th1QPA@mail.gmail.com>
 <a2cbe7499956d3d2318326c935954b3636ad8d8a.camel@samba.org>
 <CAC-fF8RQztBgiFTCS6AxVWLsjV3UWyWNUK2Cz7qKpE6hWCy7uQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2020-06-22 at 23:02 +0200, Isaac Boukris wrote:
> On Mon, Jun 22, 2020 at 9:32 PM Andrew Bartlett <abartlet@samba.org>
> wrote:
> > 
> > Likewise, ldap ssl ads should explain more which operations it
> > applies
> > to (additionally note it doesn't apply to tldap and so idmap_ad as
> > TLS
> > isn't implemented there yet).
> 
> Yeah, I'm still unclear how it relates to and differs from "ldap
> ssl".
> 
> Another idea I've discussed with Andreas, we could implicitly set
> "client ldap sasl wrapping" to "plain" when we *know* we are over
> TLS,
> to avoid having the admin set to "plain" globally, but this can wait
> I
> guess.

Yes, we should do that, anything else just makes pain for the
administrator.

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




