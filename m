Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 443A12B4D30
	for <lists+samba-technical@lfdr.de>; Mon, 16 Nov 2020 18:37:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=p9Ef+kbMsmOYwaTlfVAMkDslIX6rxFTwbIXnWuHElRU=; b=x/qX6e0ocnhgiEl4tsEu9Gckwx
	d8RnJcakjYlscppxjJ8eSOJLuYolK45ug8kubxPuF4vB7f+hcbFWAcQKZMw/MxwC6vvcst0+78F2/
	S0nzoIucJbHMvGocDyiDuAYWXPWxUfHzq+RrNhWyHHj1HKTgfeZA546Rp+v0jakaoLZpwaTw76jXI
	2rzBQpF1TWKg4Gky3DM3RONR1z4T8NyupgRtN5xELTjBbr0N4X5NHVWI/9/imNupi93AaB+LpX4h0
	ZUEzGNTkM8NcUQBxfJdQyszipdnrkfueHMYvtQ5+PMa96gSigKEJcpgpkkG8Eb7DtblIYcCjxbg6T
	CVInLKgA==;
Received: from ip6-localhost ([::1]:24092 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1keiQZ-001U4n-3n; Mon, 16 Nov 2020 17:36:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54890) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1keiQJ-001U4f-C6
 for samba-technical@lists.samba.org; Mon, 16 Nov 2020 17:36:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=p9Ef+kbMsmOYwaTlfVAMkDslIX6rxFTwbIXnWuHElRU=; b=zjQr0qGEUfHXMghz0scjeWYVzT
 BFZJ9D1emzibfGlobweJ/OBoiZY6ErGV2whlXxzEb5nUizRGMct5jlwUqpjJWfL1bngxULskjEsH/
 8wQn2zWzoO/gGbL8RBwrbUkywYiZx4EEiYbUNrzUUtCfZphirBMw6ku2IFk2X6h5VckF+aPlnkqZv
 s57QKlBPWcA6nlgKl8JdwMct3CMvbg/8Tr/zR329MgscRtmXc8JC+yHHqaw5TdCf2JdJRB5r8BG0Q
 zs0iAPVZos/CK+DvZOyp6DUYGWs5+OPTOO1hEDwgJHpDE1y7Jl3OsOo2re3Ys4JdXAcROkThtfLit
 UOa0FkgFC9qi+alJzghheGdOV36LIXI98heB3fDl2KyQNuiMK3cK3uBBuGdM+EzX2w7vkhI6PRqpA
 hImt6xprEh/fA9yT8o3Le2BEXUDDGY/op6eM2I2MReojlYNRPcVOYAn8W3aZmSKbSm9s+p67nNU9h
 EdaLLNTaMKWw9XWsUIq2UrTq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1keiQG-0000IS-9v; Mon, 16 Nov 2020 17:36:13 +0000
Message-ID: <faf40b189e2afdc232a6352a9f2a5ae2e4f64f16.camel@samba.org>
Subject: Re: Eaten by autobuild?
To: SATOH Fumiyasu <fumiyas@osstech.co.jp>
Date: Tue, 17 Nov 2020 06:36:06 +1300
In-Reply-To: <87v9eb3gzf.wl-fumiyas@osstech.co.jp>
References: <b70db8da503720b24dbadcba32d95556c108d01a.camel@samba.org>
 <87pn4loc5e.wl-fumiyas@osstech.co.jp> <874klw3v4i.wl-fumiyas@osstech.co.jp>
 <306c76b907c8ec78738a86629948f9d33fa555f5.camel@samba.org>
 <87v9eb3gzf.wl-fumiyas@osstech.co.jp>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
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

On Thu, 2020-11-12 at 03:07 +0900, SATOH Fumiyasu via samba-technical
wrote:
> On Thu, 12 Nov 2020 02:21:45 +0900,
> Andrew Bartlett wrote:
> > Thanks for the suggestion!
> > 
> > Sorry I was distracted all day with some other patches, and didn't
> > get
> > back to you.  I really appriciate your work here, it will avoid
> > much
> > frustration!
> > 
> > Can you add your Signed-off-by to the patch so I can include it in
> > Samba?
> > 
> > https://wiki.samba.org/index.php/Contribute#Samba_Copyright_and_Community_Policies
> 
> Attached. Thank you!

Thanks so much!  Pushed to autobuild (GitLab CI doesn't cover this
block so not as much value doing an extra check there).

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




