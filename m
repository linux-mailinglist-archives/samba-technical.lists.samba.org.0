Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3483F2F5F70
	for <lists+samba-technical@lfdr.de>; Thu, 14 Jan 2021 12:02:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=oDH9zTWxwqysDldJ9IzpyFyay1K5hxbK9DcnJ8NKIXw=; b=NOsCwO65teWUrzhbkShhSHTiyd
	ziH0cuz9ITkTExEC4lVBaBPQ9MQuf7WE9O/++7dIri9AAz68gSJJ5boolbeZ5kUiihnStPclaDnkE
	oR9QVz0pOgsqFVrFFPg70xvtu8aFHRWAis0aqfQYoKzzTnTZvpu4H/2wSyefBKq/qtgeSfCf2gOi5
	/UCExbj4ftJSwW1tGick1Y5JxwUxFnzOQ5RlgkHDD/W6ceoBC+zsAykx7AmqLI9yhhlnfQMxBsa7/
	sCse8ywRqSYWTa/GSCMTrqUGtEvrylumxqch1YMZcUGKzJHIkb3zAz5pQVmpPnL6L8MaqpNsJ5qdo
	LgMb6NIA==;
Received: from ip6-localhost ([::1]:62740 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l00Nt-005f5e-H3; Thu, 14 Jan 2021 11:01:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32748) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l00Nn-005f5X-UV
 for samba-technical@lists.samba.org; Thu, 14 Jan 2021 11:01:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=oDH9zTWxwqysDldJ9IzpyFyay1K5hxbK9DcnJ8NKIXw=; b=1dyyKdep8oHgux9i7nF8L5Ina0
 JCHu1YEkX59eg8C08VqZ1fVYL4oAr54iUUK2lEVZnQqxQGGl6hIY+btGpmw+AkP1FHgQJGifapfkX
 wFksSrDHznqDXh6FJot4xg32FVWChKEr1c5O5ptlWXodXKaokOrMw19MPNYyZMAHmZfaLBnUlcugv
 szgcUPqHh1dIk1aa/v84EV/5E43rfMa0CoihvaEyI7xOpdB/sOIeVtblG4yyEa5v8D72QCYUTN4DY
 OtE9i8LmLB8QihR+bh/NcvFKXqHWMXO8hOxRhMArbZyK991dbl0a/sJ0x0vxERyLX5rJ/iRq/igm2
 p5Si20n4yWB+YqiRQeieH8AMvNuXQjqNK0EH1saI7iigJixXPoQCdnsZJuhjV9KlBvLKfGWS5dvWi
 Yek5M13XcBcrm8L7qn9djT6o0jCJkN8ZhGUbCmYEOrDBe3Sozvc3eAVcDoKeBYQbsdYM/RCBk3jCN
 nmch2TQHsCnagURTpFIEIa/8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l00Nm-0007Cy-Qp; Thu, 14 Jan 2021 11:01:38 +0000
Date: Thu, 14 Jan 2021 13:01:37 +0200
To: Andreas Schneider <asn@samba.org>
Subject: Re: DCOM WMI
Message-ID: <20210114110137.GQ5029@pinega.vda.li>
References: <2384324.bt8ldtCKjX@magrathea>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2384324.bt8ldtCKjX@magrathea>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On to, 14 tammi 2021, Andreas Schneider via samba-technical wrote:
> Hi,
> 
> I've just recognized that source4/lib/wmi/ has a wscript file, but it isn't 
> included anywhere. This means the code isn't used nor built.
> 
> What should we do with this code? Can we remove it?

Cannot answer this but I may have a need for DCOM which is also used by
WMI and only referenced by WMI IDL file.

We have a customer request to support MS-ICPR which is a limited version
of WCCE protocol (only a singe call is available in MS-ICPR) that
depends on DCOM. It would be good to keep DCOM support. MS-ICPR is also
used by macOS[1] to be able to request certificates off MS CA.


[1] https://twocanoes.com/ad-certificate-profile-got-macos-apple/

-- 
/ Alexander Bokovoy

