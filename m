Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 846FC1C83C7
	for <lists+samba-technical@lfdr.de>; Thu,  7 May 2020 09:47:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=uSkK5jsEqo+iUiPlIQ+3YmUelXTX1Op8113Tia2ncNs=; b=rLkoFZoVOnDI2DLfQvkm8yxKd3
	yMrUJn2EDPAgaA9VlcJ46bOB/aCeKnSs7dYUoBIgT00O3pe7AgnpRLSqIHj7cGdWDFoplX/6OcOHG
	/d3JdGvkbIYuaKoLYHRKeuuthDcai+xaOILJOr04gllvj++LQ74qNSjkQUGpitLQ6pmq0n4KqRR4Y
	O2RQjEwQJHXmAcr/QiEFfYHekYdOg6YuwqePcXSmlQJVHwpTFiHGcGF5kRorp0usTmR81sNNfBrcR
	cqNnFwnQPte3HT6+/YTD3+CEc2Kua6PRcHQhw8O7o0/g6f0qP+/+jPbm1kuMauTP5lRfzdu2RzC58
	+NaQfeMw==;
Received: from localhost ([::1]:21970 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWbFT-0036sa-Ln; Thu, 07 May 2020 07:47:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35520) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWbFL-0036sT-N7
 for samba-technical@lists.samba.org; Thu, 07 May 2020 07:47:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=uSkK5jsEqo+iUiPlIQ+3YmUelXTX1Op8113Tia2ncNs=; b=E+u5ATErHzq0RiKfi+njh0VDt3
 qI37TDb45629Chg7HyMJQDY8bNsgZcbsn3seudlWrIV48e/g+1UnjiLx8xIHRm8I+cxfuoFG1nypD
 mCjpWoDLt8ahKuoaJ7DDDjdnLlPM5iTUAioy209p/AWu7LGn1Nd/+AL0okMezM7NM9JwyY+USy2oD
 wqQgz1hBahIZjeOSm5j/Tt15meghho8HNop/ybZX4cXG/xTf2gsg8oyYwlaeoxLFIv0Y328zu4Rz5
 mcCRMhhqFmiEuOuIZ3FeIPLsvHVsVSNa0X5bitDKaqWXYoR5MmJAs0PlFZ0KtNTgSm9Y6qeN0OAqC
 Bjvj2t7cPO6JG7oZovJCx7jpIUS+9DEMaHz7G33Wq0FQpjT+eGH/yeiKZ9hnggM4HmVhupVIwj2mo
 J1wYZ2FPbxVphSzb1og+qAymbcJibQWD2VpcJTj1TD25y6nDd2NfaAAGGwntBE2Hz2NRc7vnF4XjL
 78LoO7LQHavCiG9l82U2FoMz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWbFK-0006ot-BC; Thu, 07 May 2020 07:47:07 +0000
Message-ID: <e9c9898b53bee412de56ba5429e972b150d25913.camel@samba.org>
Subject: Re: GSoC 2020 Community Bonding Outline
To: hezekiah maina <hezekiahmaina3@gmail.com>, samba-technical@lists.samba.org
Date: Thu, 07 May 2020 19:47:02 +1200
In-Reply-To: <CAH72RCX2B3z1Mv+R32yYA0GnpQY-WX7ustGtS3Npui1Dh_L+FQ@mail.gmail.com>
References: <CAH72RCX2B3z1Mv+R32yYA0GnpQY-WX7ustGtS3Npui1Dh_L+FQ@mail.gmail.com>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2020-05-05 at 13:30 +0300, hezekiah maina via samba-technical
wrote:
> Hello everyone, my name is Hezekiah. I have been selected to work
> with
> Samba during this year's GSoC. I'm excited to work with everyone in
> the
> community during the entire GSoC period and become an active
> committer
> after it's over. During the community bonding phase I'm hoping to
> engage
> with the community members, getting to know the history of Samba, how
> different people contribute, which projects the organisation works on
> and
> possibly contribute few patches before the coding phase begins. Any
> resources from the community aimed at onboarding new members would be
> greatly appreciated. Looking forward to working with you all.

G'Day!

I'm sorry for now responding earlier.  I do trust you will feel very
welcome in the Samba community, but in particular do feel free to ask
me anything at all, as Jeremy has said, we are incredibly fortunate to
have team members still with us from the earliest days of Samba.  I
myself started in 2001 - so quite late by some standards, but have seen
most of and with good friends built much of the Samba AD DC.

This means we really can answer most things (perhaps after a quick dive
into the git history).

In terms of onboarding, please ensure you have an account on GitLab.com
and let me know the username so I can add you to a shared repo we use
for testing there.

https://wiki.samba.org/index.php/Samba_CI_on_gitlab

(I'm sorry, the page talks about this as if it were 'just' a CI
platform, but actually we do the full code submission cycle there). 

Welcome!

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




