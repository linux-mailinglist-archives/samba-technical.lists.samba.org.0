Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6353A1ED70A
	for <lists+samba-technical@lfdr.de>; Wed,  3 Jun 2020 21:47:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=/iXa+dpaVvoTfUuFWKT8PTxF473uFzKoc4e8MDznKag=; b=bNqrTYYqiPR2z/G9H0V0VNBufm
	0PHZ5hna/e/SQ0UfQzmwalwtzgHcQoOzbEeuELMkaM9l8SiJ86+Be26RanU3gZEVnIhkjg7ziN4Os
	FbYNp4iW+GCe8W8HebXwOp56DazngGi6NwZSN9r9Bp0Uy7Yipwl3kOd5DtBD4lIS2EjwH7h7QfWDV
	0OEusXUNWlESWTrrT3qrBi30iWJvukCctsN5uqdU72RVrwuuuF8LTp51YN6/86XPzRX+SnI+4QwC7
	TcGR8vg5c2tv+hAiOL75nWhX2eiYhu4PbMJ+647+0m+QQ4G+dQMl8CkMc4IqXAaZIJ0yakN65UozF
	gzlokRgg==;
Received: from localhost ([::1]:47054 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jgZKy-008h5s-6Y; Wed, 03 Jun 2020 19:46:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43142) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jgZKs-008h5l-U2
 for samba-technical@lists.samba.org; Wed, 03 Jun 2020 19:46:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=/iXa+dpaVvoTfUuFWKT8PTxF473uFzKoc4e8MDznKag=; b=Lg+esGjEe1s0EjBlOoSnIFNYld
 XbS8VU6UX6/WJYw5EJ9CoGYXBQcHAub67rcUX9xcWPNY0kBl2EIzKNmyJZIfCYqKQp09mDgE9BeSE
 TJOA3l3OON3HO8/5yZYI5XQZU3VqclhvdKG0KPRTK0CorzFGNki1Drm/tBDJRk4I1nCh//hm48bHP
 ISyu0ZFgBgHaoXqjmsDDKtR5x038NYyMcPmq2FUUPLtDEz+WQuSMiq1Wj6ZlEf0Bfi4ss5Iw8pXWE
 HV6KX5PMchiwDRiALm/+WCIE9nPsdDru/4jkvCSKbcZ6cZK0Z4xl8lm0YNOZCVC98skVGEgr2QpR5
 PgOfVMaBvW6BAu6ip0Ri0Ou72wgOkzZj8JKjLCCRzPDQ7p4/kUU8ZfOdUES1JxXsZ8VDeVAcKCmQf
 drySxCAh5HwinPHSq3hsKTvglO/pe2ZeLYU6eY2pufoW/ftgueFqeeilfab/0rDHk1We0E3U85E8G
 dAPj6DjZU3y5Jy6TS1q+kBoj;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jgZKq-0007lH-TG; Wed, 03 Jun 2020 19:46:01 +0000
Message-ID: <8329a7d20be2c97a1c44ef37fbdb8cdc53938726.camel@samba.org>
Subject: Re: Samba Developers Guide
To: =?ISO-8859-1?Q?Bj=F6rn?= Jacke <bj@sernet.de>, 
 =?ISO-8859-1?Q?Aur=E9lien?= Aptel <aaptel@suse.com>
Date: Thu, 04 Jun 2020 07:45:55 +1200
In-Reply-To: <20200603111840.GA714675@sernet.de>
References: <c5c46e71b5093b5ba3450d089541a8d431792247.camel@samba.org>
 <87y2p4ikw5.fsf@suse.com> <20200603111840.GA714675@sernet.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2020-06-03 at 13:18 +0200, Björn Jacke wrote:
> On 2020-06-03 at 11:00 +0200 Aurélien Aptel via samba-technical sent
> off:
> > Andrew Bartlett via samba-technical <
> > samba-technical@lists.samba.org>
> > writes:
> > > Can anybody say some words in support of this, or should this now
> > > also
> > > be removed?
> > 
> > As samba grows more and more complex I think a document like this
> > is
> > desperatly needed. Perhaps it could be updated with the content
> > from
> > Ralph's sambaxp talk?
> 
> given that the mentioned document is so outdated, I think updating it
> would be
> like more or less like rewriting it from scratch. Of course a good
> devel
> starting point docu is required but for this old one I would not
> object to drop
> it. On the web there can still stay that old one archived with the
> "outdated"
> disclaimer in the background.

That sounds like a plan.  Step one for any update would be a vicious
triage of the current content into a wiki page, clearly linked from our
new 'Contribute' page.

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




