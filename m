Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BD82F1E53EB
	for <lists+samba-technical@lfdr.de>; Thu, 28 May 2020 04:30:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=dsA5DQtjVtuvoSu4Yc+ScuXXNB1gkA9aksQGwRsSSVw=; b=Dw+N0AlzmJkvXpWBD/uy6yU2yI
	J4cRBQ2kMUPLXKyZRQwbXYZg7RRCCahO/xp7AKpWUXV2iMNExHCDs+f4KRd4K/GNcZb3uu6jn8hvl
	PSgmmZ7TnwSqvWLnu4eRfSVeMQNnFKguW4aRm84Hm64wmS+K9dRvXwoxfzaFitKXBTSBTbKW9M/3w
	qUxYOBdAbzkqq2J1fCZRBKUeyfZAHocRMuAgyG8PBWF4VWgq/npEP8jGduN48TNcSONHaY0EKdc/i
	4IUm/KYRw1k6HcelO7GLSymXbYLzcR+nyQexjCNPlunO7FLgAkQlpJDpUkO25u98OoC+WradfyP5D
	Ju0+5rcA==;
Received: from localhost ([::1]:30446 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1je8Ir-0067Ln-6i; Thu, 28 May 2020 02:29:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64056) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1je8Im-0067Lg-13
 for samba-technical@lists.samba.org; Thu, 28 May 2020 02:29:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=dsA5DQtjVtuvoSu4Yc+ScuXXNB1gkA9aksQGwRsSSVw=; b=KQPo6D+meckUyP+tIgA1x+s8sq
 GDBdxiTAbnmKVbiCxWg0vaKYOvBEinRodXXfLXuCnS7PTuRjQw00RBRdDsJYAksM5BwFxEV6yVhgh
 ztwnPrBr1MPomfC1stjK3FPYGKev89l7Ze7mhESTD4z7d72oppoYpFhFHkO944UnVHnXWQVei83xl
 RkerS+QgOgXTz5G+gikdV3mE5XwOjUSywsOcfe1W2XTr7Wv7P1aqAcdjaT8qksSyDLl60UjWWiH5b
 DVfVeMpVuoTFZD+RSwd3QYYVe3OVmYb6agWA9h9srr56t4QcGzOnMyQUJfXD0NLTCB8KXiUV0RW4e
 mbcr5ITuYD1nPIJwJ1tmFhefzbrucWPzCUyu0tttdKMKL1o5okUnHP9gPRk/Nnbc5V+To2OXHXxWo
 YQTEWtAOH3eRGBZP3N5iONqrg06lfZ3vLc1xCbXUK1rWYam+PhDJA0sgJ/vVUWnCM2Etbhj8PqyZb
 wtcGq2Hzl27rHkJSFMzmGsOg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1je8Ij-00054v-EC; Thu, 28 May 2020 02:29:46 +0000
Message-ID: <7df7865c02e756254dfc9af87ad5873707fc82aa.camel@samba.org>
Subject: Re: Schema updates and modern Samba AD
To: William Brown <wbrown@suse.de>
Date: Thu, 28 May 2020 14:29:41 +1200
In-Reply-To: <0326D940-8BDC-4FE2-A7D4-00276A982979@suse.de>
References: <6519f23f61695e09cc6c9aa9336f69bcd8010da6.camel@samba.org>
 <E89015B7-BFCD-4731-82F9-AE09FE73C52A@suse.de>
 <01157baedc07f140b5a253a1813137a4f16196e2.camel@samba.org>
 <0326D940-8BDC-4FE2-A7D4-00276A982979@suse.de>
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

On Thu, 2020-05-28 at 12:19 +1000, William Brown wrote:
> > On 27 May 2020, at 14:41, Andrew Bartlett <abartlet@samba.org>
> > wrote:
> > 
> > On Wed, 2020-05-27 at 13:53 +1000, William Brown via samba-
> > technical
> > wrote:
> > > > 
> > > 
> > > 
> > 
> > 
https://docs.microsoft.com/en-us/windows/win32/ad/extending-the-schema
> > > 
> > > Generally, I'd say the biggest thing is that it's a one way
> > > street -
> > > you can add, but never remove, so that means your changes have to
> > > be
> > > very carefully considered, because a mistake can't easily be
> > > undone.
> > > 
> > > For example, if the ssh public key schema shipped in AD, the fact
> > > is
> > > has a "must" not "may" on the ldapPublicKey attribute makes it
> > > extremely hard to use in a self management scenario.
> > > 
> > > So my input (for what it's worth) is that schema changes should
> > > be
> > > considered carefully, and the consequences understood, as well as
> > > the
> > > ergonomics of how those changes will interface with access
> > > controls
> > > and that human interaction. 
> > > 
> > > Hope that helps,
> > 
> > G'Day William,
> > 
> > It is a wiki, feel free to craft some suitable guidance and add it!
> 
> Done, but I'm not able to upload files. Can you add the following for
> me? Then I can fix up some links in the page.

You are now approved, and can upload files!

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




